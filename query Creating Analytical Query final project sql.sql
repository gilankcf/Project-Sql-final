Part5: Creating Analytical Query

--Nomor1
SELECT c.brand, c.model, COUNT(b.bid_id) AS total_bids
FROM Cars c
JOIN Bids b ON c.product_id = b.product_id
GROUP BY c.brand, c.model
ORDER BY total_bids DESC;

--Nomor 2
SELECT 
    ci.nama_kota AS nama_kota,
    ca.brand AS merk,
    ca.model AS model,
    ca.year AS year,
    ca.price AS price,
    AVG(ca.price) OVER (PARTITION BY ci.nama_kota) AS avg_car_city
FROM 
    Cars ca
JOIN 
    Cities ci ON ca.kota_id = ci.kota_id
ORDER BY 
    ci.nama_kota ASC, ca.price ASC;

--Nomor 3
WITH RankedBids AS (
    SELECT
        b.product_id,
        b.buyer_id AS user_id,
        b.bid_price,
        b.date_bid,
        ROW_NUMBER() OVER (PARTITION BY b.product_id ORDER BY b.date_bid) AS bid_rank
    FROM
        Bids b
    JOIN
        Cars c ON b.product_id = c.product_id
    WHERE
        c.brand = 'Daihatsu' AND c.model = 'Ayla'
)

SELECT
    'Daihatsu Ayla' AS model,
    rb1.user_id,
    rb1.date_bid AS first_bid_date,
    rb2.date_bid AS next_bid_date,
    rb1.bid_price AS first_bid_price,
    rb2.bid_price AS next_bid_price
FROM
    RankedBids rb1
JOIN
    RankedBids rb2 ON rb1.product_id = rb2.product_id AND rb1.bid_rank = rb2.bid_rank - 1
WHERE
    rb1.bid_rank = 1;


--Nomor4
WITH AvgModelPrice AS (
    SELECT
        brand,
        model,
        AVG(price) AS avg_price
    FROM
        Cars
    GROUP BY
        brand, model
),

AvgBidPrice AS (
    SELECT
        c.brand,
        c.model,
        AVG(b.bid_price) AS avg_bid_6month
    FROM
        Bids b
    JOIN
        Cars c ON b.product_id = c.product_id
    WHERE
        b.date_bid >= CURRENT_DATE - INTERVAL '6 months'
    GROUP BY
        c.brand, c.model
)

SELECT
    amp.brand,
    amp.model,
    amp.avg_price,
    COALESCE(abp.avg_bid_6month, 0) AS avg_bid_6month,
    COALESCE(amp.avg_price - abp.avg_bid_6month, 0) AS difference,
    CASE
        WHEN amp.avg_price != 0 THEN (COALESCE(amp.avg_price - abp.avg_bid_6month, 0) / amp.avg_price) * 100
        ELSE 0
    END AS difference_percent
FROM
    AvgModelPrice amp
LEFT JOIN
    AvgBidPrice abp ON amp.brand = abp.brand AND amp.model = abp.model
ORDER BY
    amp.brand, amp.model;


--Nomor 5
WITH AvgBidMonths AS (
    SELECT
        brand,
        model,
        DATE_TRUNC('month', date_bid) AS bid_month,
        AVG(bid_price) AS avg_bid_price
    FROM
        Bids b
    JOIN
        Cars c ON b.product_id = c.product_id
    GROUP BY
        brand,
        model,
        DATE_TRUNC('month', date_bid)
    ORDER BY
        brand,
        model,
        bid_month DESC
    LIMIT 6  -- Ambil data 6 bulan terakhir
),
ModelAverageBids AS (
    SELECT
        brand,
        model,
        MAX(CASE WHEN EXTRACT(MONTH FROM bid_month) = EXTRACT(MONTH FROM CURRENT_DATE - INTERVAL '0 months') THEN avg_bid_price ELSE NULL END) AS m_min_1,
        MAX(CASE WHEN EXTRACT(MONTH FROM bid_month) = EXTRACT(MONTH FROM CURRENT_DATE - INTERVAL '1 months') THEN avg_bid_price ELSE NULL END) AS m_min_2,
        MAX(CASE WHEN EXTRACT(MONTH FROM bid_month) = EXTRACT(MONTH FROM CURRENT_DATE - INTERVAL '2 months') THEN avg_bid_price ELSE NULL END) AS m_min_3,
        MAX(CASE WHEN EXTRACT(MONTH FROM bid_month) = EXTRACT(MONTH FROM CURRENT_DATE - INTERVAL '3 months') THEN avg_bid_price ELSE NULL END) AS m_min_4,
        MAX(CASE WHEN EXTRACT(MONTH FROM bid_month) = EXTRACT(MONTH FROM CURRENT_DATE - INTERVAL '4 months') THEN avg_bid_price ELSE NULL END) AS m_min_5,
        MAX(CASE WHEN EXTRACT(MONTH FROM bid_month) = EXTRACT(MONTH FROM CURRENT_DATE - INTERVAL '5 months') THEN avg_bid_price ELSE NULL END) AS m_min_6
    FROM
        AvgBidMonths
    GROUP BY
        brand,
        model
)
SELECT
    brand,
    model,
    m_min_6,
    m_min_5,
    m_min_4,
    m_min_3,
    m_min_2,
    m_min_1
FROM
    ModelAverageBids
ORDER BY
    brand,
    model;


