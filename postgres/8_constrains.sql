DROP TABLE IF EXISTS shazan.accounts;

CREATE TABLE shazan.accounts(
    id SERIAL PRIMARY KEY,
    full_name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    is_active BOOLEAN DEFAULT true,
    age INTEGER CHECK(age >= 18),
    created_at TIMESTAMP DEFAULT NOW()
)