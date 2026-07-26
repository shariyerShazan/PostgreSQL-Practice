
-- File: primary_key.sql
-- Topic: PRIMARY KEY in PostgreSQL
-- Schema: shazan

-- Remove the table if it already exists
DROP TABLE IF EXISTS shazan.primary_key;

-- Create table
CREATE TABLE shazan.primary_key (
    id SERIAL PRIMARY KEY,
    full_name TEXT NOT NULL,
    email TEXT NOT NULL,
    age INTEGER
);

-- VALID INSERTS

-- id will be generated automatically
INSERT INTO shazan.primary_key (full_name, email, age)
VALUES
('John Doe', 'john@example.com', 25);

INSERT INTO shazan.primary_key (full_name, email, age)
VALUES
('Alice Johnson', 'alice@example.com', 30);

INSERT INTO shazan.primary_key (full_name, email, age)
VALUES
('Bob Smith', 'bob@example.com', 22);

-- View data
SELECT * FROM shazan.primary_key;

-- PRIMARY KEY EXAMPLES

-- Explicitly provide an unused id
INSERT INTO shazan.primary_key (id, full_name, email, age)
VALUES
(100, 'David Wilson', 'david@example.com', 35);

-- Check the table
SELECT * FROM shazan.primary_key;

-- INVALID EXAMPLES

-- 1. Duplicate PRIMARY KEY
-- Expected:
-- ERROR: duplicate key value violates unique constraint

INSERT INTO shazan.primary_key (id, full_name, email, age)
VALUES
(100, 'Another David', 'another@example.com', 40);


-- 2. NULL PRIMARY KEY
-- Expected:
-- ERROR: null value violates not-null constraint

INSERT INTO shazan.primary_key (id, full_name, email, age)
VALUES
(NULL, 'Null User', 'null@example.com', 28);


-- Current Data
SELECT * FROM shazan.primary_key;