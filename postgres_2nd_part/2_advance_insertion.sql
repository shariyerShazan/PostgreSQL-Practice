/*
=========================================================
Topic      : INSERT & SELECT BASICS
File       : 02_insert_select_where.sql
Schema     : shazan
Database   : PostgreSQL
=========================================================

This file covers:

1. Insert a Single Row
2. Insert Multiple Rows
3. Select Specific Columns
4. WHERE Basic Filters
5. AND, OR, NOT Filters

=========================================================
STEP 1 : CREATE TABLE
=========================================================
*/

DROP TABLE IF EXISTS shazan.accounts;

CREATE TABLE shazan.accounts(
    id SERIAL PRIMARY KEY,
    full_name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    age INT CHECK(age >= 18),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT NOW()
);

/*
=========================================================
1. INSERT A SINGLE ROW
=========================================================

Concept:
---------
INSERT adds a new row into a table.

Each INSERT statement below inserts ONE record.

Syntax:

INSERT INTO table_name(columns...)
VALUES(values...);
*/

INSERT INTO shazan.accounts
(full_name,email,age)
VALUES
('John Doe','john@gmail.com',25);

/*
Current Table

+----+----------+----------------+-----+
| id | name     | email          | age |
+----+----------+----------------+-----+
| 1  | John Doe | john@gmail.com | 25  |
+----+----------+----------------+-----+
*/

SELECT * FROM shazan.accounts;


/*
=========================================================
2. INSERT MULTIPLE ROWS
=========================================================

Concept:
---------
Instead of writing multiple INSERT statements,
we can insert many rows using ONE query.

Benefits:

✔ Faster
✔ Cleaner
✔ Better Performance

Syntax:

INSERT INTO table(...)
VALUES
(...),
(...),
(...);
*/

INSERT INTO shazan.accounts
(full_name,email,age,is_active)
VALUES
('Alice','alice@gmail.com',22,TRUE),
('Bob','bob@gmail.com',30,FALSE),
('Charlie','charlie@gmail.com',28,TRUE),
('David','david@gmail.com',19,TRUE);

/*
Current Table

1 John
2 Alice
3 Bob
4 Charlie
5 David
*/

SELECT * FROM shazan.accounts;


/*
=========================================================
3. SELECT SPECIFIC COLUMNS
=========================================================

Concept:
---------
SELECT * returns EVERY column.

Sometimes we only need a few columns.

Instead of:

SELECT *

Use:

SELECT column1,column2

Benefits:

✔ Less data transferred
✔ Faster queries
✔ Cleaner output
*/

-- Return every column
SELECT *
FROM shazan.accounts;

-- Return only names
SELECT
full_name
FROM shazan.accounts;

-- Return names and emails only
SELECT
full_name,
email
FROM shazan.accounts;

-- Return name and age
SELECT
full_name,
age
FROM shazan.accounts;


/*
=========================================================
4. WHERE BASIC FILTERS
=========================================================

Concept:
---------
WHERE filters rows.

Without WHERE:

SELECT *

Returns ALL rows.

With WHERE:

Returns ONLY matching rows.

Comparison Operators

=      Equal

>      Greater Than

<      Less Than

>=     Greater Than Equal

<=     Less Than Equal

<>     Not Equal

!=     Not Equal
*/

-- Find user named Alice
SELECT *
FROM shazan.accounts
WHERE full_name='Alice';

-- Find users older than 25
SELECT *
FROM shazan.accounts
WHERE age > 25;

-- Find users age 22
SELECT *
FROM shazan.accounts
WHERE age = 22;

-- Find users NOT age 22
SELECT *
FROM shazan.accounts
WHERE age <> 22;

-- Find inactive users
SELECT *
FROM shazan.accounts
WHERE is_active = FALSE;


/*
=========================================================
5. AND FILTER
=========================================================

Concept:
---------
Every condition MUST be TRUE.

TRUE  AND TRUE  -> Returned

TRUE  AND FALSE -> Not Returned

FALSE AND TRUE  -> Not Returned
*/

-- Active users older than 20

SELECT *
FROM shazan.accounts
WHERE age > 20
AND is_active = TRUE;


/*
=========================================================
6. OR FILTER
=========================================================

Concept:
---------
Only ONE condition must be TRUE.

TRUE OR FALSE -> Returned

FALSE OR TRUE -> Returned

FALSE OR FALSE -> Not Returned
*/

-- Age below 21 OR inactive

SELECT *
FROM shazan.accounts
WHERE age < 21
OR is_active = FALSE;


/*
=========================================================
7. NOT FILTER
=========================================================

Concept:
---------
NOT reverses a condition.

NOT TRUE  -> FALSE

NOT FALSE -> TRUE
*/

-- Everyone except Alice

SELECT *
FROM shazan.accounts
WHERE NOT full_name='Alice';

-- Everyone except active users

SELECT *
FROM shazan.accounts
WHERE NOT is_active;


/*
=========================================================
8. COMBINING AND + OR
=========================================================

Parentheses matter.

(age > 20)
AND
(active OR name = Bob)
*/

SELECT *
FROM shazan.accounts
WHERE age > 20
AND
(
    is_active = TRUE
    OR full_name = 'Bob'
);


/*
=========================================================
9. PRACTICE QUERIES
=========================================================

Try writing these yourself.

1.
Find all active users.

2.
Find everyone older than 25.

3.
Find Alice.

4.
Find everyone except Bob.

5.
Find active users older than 18.

6.
Find inactive users OR users under 25.

7.
Show only names.

8.
Show names and ages.

9.
Show names and emails.

10.
Show every column.
*/


/*
=========================================================
INTERVIEW QUESTIONS
=========================================================

Q1. Difference between INSERT and SELECT?

INSERT
-> Adds data.

SELECT
-> Reads data.

-----------------------------------------

Q2. Difference between SELECT * and
SELECT name,email?

SELECT *
Returns every column.

SELECT name,email
Returns only specified columns.

-----------------------------------------

Q3. What does WHERE do?

Filters rows.

-----------------------------------------

Q4. Difference between AND and OR?

AND
Every condition must be TRUE.

OR
At least one condition must be TRUE.

-----------------------------------------

Q5. What does NOT do?

Reverses a condition.

NOT TRUE -> FALSE

NOT FALSE -> TRUE

=========================================================
SUMMARY
=========================================================

INSERT
✔ Add new rows

SELECT
✔ Read data

SELECT column
✔ Read specific columns

WHERE
✔ Filter rows

AND
✔ Every condition true

OR
✔ At least one condition true

NOT
✔ Reverse a condition

These commands are used in almost every SQL query you
will write.
=========================================================