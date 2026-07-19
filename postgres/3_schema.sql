-- DB -> SCHEMA -> TABLE -> ROWS

--! if schema si already created then it's prevent a error
CREATE SCHEMA IF NOT EXISTS first_schema;


CREATE EXTENSION IF NOT EXISTS pgcrypto;