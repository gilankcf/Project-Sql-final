Langkah #4 - Creating Transactional Query
--Nomor1
SELECT * 
FROM Cars 
WHERE year >= 2015;

--Nomor2
INSERT INTO Bids (bid_id, product_id, buyer_id, date_bid, bid_price, bid_status)
VALUES (101, 21, 1, '2024-07-09', 180000000, 'Pending');

--Nomor3
SELECT c.product_id, c.brand, c.model, c.year, c.price, c.body_type, a.title, a.description, a.date_post
FROM Cars c
JOIN Ads a ON c.product_id = a.product_id
WHERE c.user_id = 31
ORDER BY a.date_post DESC;

--Nomor4
SELECT c.product_id, c.brand, c.model, c.year, c.price
FROM Cars c
JOIN Ads a ON c.product_id = a.product_id
WHERE c.brand LIKE '%Yaris%' OR c.model LIKE '%Yaris%'
ORDER BY c.price ASC;

--Nomor5
SELECT c.product_id, c.brand, c.model, c.year, c.price, c.body_type, a.title, a.description, a.date_post,
       sqrt(power(j.latitude - j.latitude, 2) + power(j.longitude - j.longitude, 2)) AS distance
FROM Cars c
JOIN Ads a ON c.product_id = a.product_id
JOIN Cities j ON c.kota_id = j.kota_id
WHERE j.kota_id = 3175  -- Jakarta Timur
ORDER BY distance ASC;



