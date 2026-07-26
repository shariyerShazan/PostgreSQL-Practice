/*
=========================================================
Topic      : PRIMARY KEY
File       : 01_primary_key.sql
Schema     : shazan
Database   : PostgreSQL
=========================================================

WHAT IS A PRIMARY KEY?

A PRIMARY KEY is a column (or multiple columns) whose value
uniquely identifies every row in a table.

Think of it as a person's National ID or Passport Number.

Example:

Person
-------------------------
Name          NID
-------------------------
Rahim          12345
Karim          54321
Rahim          77777

Notice:
Two people can have the same name.
But two people CANNOT have the same NID.

That's exactly what a Primary Key does.

=========================================================
RULES OF PRIMARY KEY
=========================================================

1. Every row must have a unique value.

    ✔ 1
    ✔ 2
    ✔ 3

    ✘ 1
    ✘ 1

-----------------------------------------

2. NULL is NOT allowed.

    ✔ id = 1
    ✔ id = 2

    ✘ id = NULL

Because the database must always know
which row it is referring to.

-----------------------------------------

3. One table can have only ONE Primary Key.

You may use one column:

    id

Or multiple columns (Composite Primary Key):

    (student_id, course_id)

But only ONE PRIMARY KEY constraint exists.

=========================================================
WHY DO WE NEED PRIMARY KEY?
=========================================================

Without a Primary Key

+------+--------+
| Name | Age    |
+------+--------+
| John | 25     |
| John | 30     |
+------+--------+

Question:

Which John should we update?

Impossible to know.

-----------------------------------------

With Primary Key

+----+------+------+
| id | Name | Age  |
+----+------+------+
| 1  | John | 25   |
| 2  | John | 30   |
+----+------+------+

Now updating becomes easy.

UPDATE table
SET age = 26
WHERE id = 1;

=========================================================
SERIAL
=========================================================

SERIAL automatically generates numbers.

1
2
3
4
5
...

You don't need to insert IDs manually.

=========================================================
CREATE TABLE
=========================================================
*/

DROP TABLE IF EXISTS shazan.primary_key;

CREATE TABLE shazan.primary_key(

    id SERIAL PRIMARY KEY,

    full_name TEXT NOT NULL,

    email TEXT,

    age INT

);

/*
=========================================================
VALID INSERTS
=========================================================

Notice:
We never insert "id".

PostgreSQL generates it automatically.
*/

INSERT INTO shazan.primary_key(full_name,email,age)
VALUES
('John Doe','john@gmail.com',25);

INSERT INTO shazan.primary_key(full_name,email,age)
VALUES
('Alice','alice@gmail.com',30);

INSERT INTO shazan.primary_key(full_name,email,age)
VALUES
('Bob','bob@gmail.com',27);

/*
Current Table

id   full_name    age
-------------------------
1    John         25
2    Alice        30
3    Bob          27
*/

SELECT * FROM shazan.primary_key;


/*
=========================================================
INSERTING CUSTOM ID
=========================================================

You CAN insert your own id.

Only if it doesn't already exist.
*/

INSERT INTO shazan.primary_key
(id,full_name,email,age)
VALUES
(100,'David','david@gmail.com',40);

SELECT * FROM shazan.primary_key;


/*
=========================================================
INVALID CASE 1
Duplicate Primary Key
=========================================================

Expected:

ERROR:
duplicate key value violates unique constraint

Because id = 100 already exists.
*/

-- INSERT INTO shazan.primary_key
-- (id,full_name,email,age)
-- VALUES
-- (100,'Another David','another@gmail.com',50);


/*
=========================================================
INVALID CASE 2
NULL Primary Key
=========================================================

Expected:

ERROR:
null value violates not-null constraint

A Primary Key can never be NULL.
*/

-- INSERT INTO shazan.primary_key
-- (id,full_name,email)
-- VALUES
-- (NULL,'Rahim','rahim@gmail.com');


/*
=========================================================
LOOKUP USING PRIMARY KEY
=========================================================

Primary Keys are mainly used to find a single row.

Fast.

Efficient.

Unique.
*/

SELECT *
FROM shazan.primary_key
WHERE id = 2;


/*
=========================================================
UPDATE USING PRIMARY KEY
=========================================================

Update exactly ONE row.
*/

UPDATE shazan.primary_key
SET age = 31
WHERE id = 2;


/*
=========================================================
DELETE USING PRIMARY KEY
=========================================================

Delete exactly ONE row.
*/

DELETE FROM shazan.primary_key
WHERE id = 3;


/*
=========================================================
FINAL TABLE
=========================================================
*/

SELECT *
FROM shazan.primary_key;


/*
=========================================================
INTERVIEW QUESTIONS
=========================================================

Q1. Can a table have multiple Primary Keys?

Answer:
No.

-----------------------------------------

Q2. Can a Primary Key contain NULL?

Answer:
No.

-----------------------------------------

Q3. Can duplicate values exist?

Answer:
No.

-----------------------------------------

Q4. Is a Primary Key automatically indexed?

Answer:
Yes.

-----------------------------------------

Q5. Does SERIAL mean Primary Key?

Answer:
No.

SERIAL only generates numbers.

PRIMARY KEY provides:

- UNIQUE
- NOT NULL

You can use SERIAL without PRIMARY KEY,
or PRIMARY KEY without SERIAL.

=========================================================
SUMMARY
=========================================================

PRIMARY KEY

✓ Unique
✓ NOT NULL
✓ One per table
✓ Automatically indexed
✓ Identifies every row
✓ Frequently referenced by Foreign Keys

=========================================================
*/