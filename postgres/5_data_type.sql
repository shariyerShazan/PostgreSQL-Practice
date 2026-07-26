CREATE SCHEMA IF NOT EXISTS shazan;
DROP TABLE IF EXISTS shazan.product;

CREATE TABLE shazan.product(
    id SERIAL PRIMARY KEY,

    --  varchar mean -> string max length 100
    title VARCHAR(100) NOT NULL,
    description TEXT,
    stock INTEGER DEFAULT 0 CHECK (stock >= 0),

    -- Bigint mean larger then integer.
    total_views BIGINT DEFAULT 0,

    -- numeric(10,2) mean decimal with after point 2digit. 
    price NUMERIC(10,2)  CHECK (price >= 0),

    is_active BOOLEAN DEFAULT true
);

-- Insert

INSERT INTO shazan.product(title, description, stock, price, is_active)
VALUES ('Product 1' , 'Its description for product 1', 11 , 150 , true),
       ('Product 2' , 'Its description for product 2', 22 , 250 , false),
       ('Product 3' , 'Its description for product 1', 33 , 350 , true);

SELECT * FROM shazan.product;

SELECT title, description, stock, price
FROM shazan.product
WHERE is_active = true;