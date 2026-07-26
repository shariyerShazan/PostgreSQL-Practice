DROP TABLE IF EXISTS shazan.accounts;

CREATE TABLE shazan.accounts(
    id SERIAL PRIMARY KEY,
    full_name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    is_active BOOLEAN DEFAULT true,
    age INTEGER CHECK(age >= 18),
    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO shazan.accounts (full_name, email, age, is_active)
VALUES
('John Doe', 'john@example.com', 25, true);

INSERT INTO shazan.accounts (full_name, email, age)
VALUES
('Duplicate User', 'john@example.com', 28);

INSERT INTO shazan.accounts (full_name, email, age)
VALUES
('Alice Johnson', 'alice@example.com', 30);

INSERT INTO shazan.accounts (full_name, email, age)
VALUES
(NULL, 'nullname@example.com', 24);

INSERT INTO shazan.accounts (full_name, email, age)
VALUES
('Bob Smith', 'bob@example.com', 18);

INSERT INTO shazan.accounts (full_name, email, age)
VALUES
('Young User', 'young@example.com', 17);

INSERT INTO shazan.accounts (full_name, email, age)
VALUES
('Negative Age', 'negative@example.com', -5);

INSERT INTO shazan.accounts (full_name, email, age, is_active)
VALUES
('Charlie Brown', 'charlie@example.com', 45, false);


INSERT INTO shazan.accounts (full_name, email, age)
VALUES
('No Email', NULL, 26);

