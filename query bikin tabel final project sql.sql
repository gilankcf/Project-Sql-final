-- Tabel Cities
CREATE TABLE Cities (
    kota_id SERIAL PRIMARY KEY,
    nama_kota VARCHAR(100) NOT NULL,
    latitude DOUBLE PRECISION NOT NULL,
    longitude DOUBLE PRECISION NOT NULL
);

-- Tabel Users
CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    kota_id INT REFERENCES Cities(kota_id)
);

-- Tabel Cars
CREATE TABLE Cars (
    product_id SERIAL PRIMARY KEY,
    brand VARCHAR(100) NOT NULL,
    model VARCHAR(100) NOT NULL,
    body_type VARCHAR(50) NOT NULL,
    year INT NOT NULL,
    price DECIMAL(12, 2) NOT NULL,
    user_id INT REFERENCES Users(user_id),
    kota_id INT REFERENCES Cities(kota_id)
);

-- Tabel Ads
CREATE TABLE Ads (
    ad_id SERIAL PRIMARY KEY,
    product_id INT REFERENCES Cars(product_id),
    title VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    date_post DATE NOT NULL
);

-- Tabel Bids
CREATE TABLE Bids (
    bid_id SERIAL PRIMARY KEY,
    product_id INT REFERENCES Cars(product_id),
    buyer_id INT REFERENCES Users(user_id),
    date_bid DATE NOT NULL,
    bid_price INT NOT NULL,
    bid_status VARCHAR(50) NOT NULL
);

