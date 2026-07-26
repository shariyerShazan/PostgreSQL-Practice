


/*
===============================================================================
Topic      : Advanced Filtering (Part-2)
File       : 03_filtering_sorting_pagination.sql
Part       : 2
Schema     : shazan
Database   : PostgreSQL
===============================================================================

Topics Covered

1. NULL
2. NOT NULL
3. ORDER BY
4. LIMIT
5. OFFSET
6. Pagination

===============================================================================
WHAT IS NULL?
===============================================================================

Many beginners think NULL means

0
or
'' (empty string)

That is WRONG.

NULL means

"Unknown"

or

"No Value"

Example

Employee

---------------------------------------
Name          Phone Number
---------------------------------------
John          017XXXXXXXX
Alice         NULL
Bob           018XXXXXXXX

Does Alice have phone number = 0 ?

No.

Does Alice have empty string?

No.

The phone number is UNKNOWN.

That is NULL.

===============================================================================
*/


/*
===============================================================================
CREATE SOME NULL VALUES
===============================================================================
*/

INSERT INTO shazan.accounts
(full_name,email,age,country,salary,is_active)
VALUES
('Unknown Salary','unknown@gmail.com',24,'USA',NULL,TRUE),
('No Country','nocountry@gmail.com',27,NULL,65000,TRUE),
('No Email',NULL,30,'Canada',50000,FALSE);

SELECT *
FROM shazan.accounts;


/*
===============================================================================
1. IS NULL
===============================================================================

Concept

Find rows where a column contains NULL.

IMPORTANT

Never use

= NULL

Wrong

Use

IS NULL

Correct

===============================================================================
*/


-- Find users without salary

SELECT *
FROM shazan.accounts
WHERE salary IS NULL;


-- Find users without country

SELECT *
FROM shazan.accounts
WHERE country IS NULL;


-- Find users without email

SELECT *
FROM shazan.accounts
WHERE email IS NULL;


/*
===============================================================================
WRONG EXAMPLE
===============================================================================

This returns NOTHING.

Because NULL cannot be compared using =

Don't do this.

*/

-- WRONG

SELECT *
FROM shazan.accounts
WHERE salary = NULL;


/*
===============================================================================
2. IS NOT NULL
===============================================================================

Concept

Find rows where a value exists.

Syntax

WHERE column IS NOT NULL

===============================================================================
*/


SELECT *
FROM shazan.accounts
WHERE salary IS NOT NULL;


SELECT *
FROM shazan.accounts
WHERE email IS NOT NULL;


SELECT *
FROM shazan.accounts
WHERE country IS NOT NULL;


/*
===============================================================================
3. ORDER BY
===============================================================================

Concept

Without ORDER BY

PostgreSQL returns rows
in an unspecified order.

Never assume the returned order.

If you need sorted data,

use ORDER BY.

Syntax

SELECT *
FROM table
ORDER BY column;

===============================================================================
*/


-- Age ascending (smallest -> largest)

SELECT *
FROM shazan.accounts
ORDER BY age ASC;


/*
ASC

Ascending

1
2
3

A
B
C

10
20
30
*/


-- Age descending (largest -> smallest)

SELECT *
FROM shazan.accounts
ORDER BY age DESC;


/*
DESC

Descending

100
90
80

Z
Y
X
*/


-- Alphabetical names

SELECT *
FROM shazan.accounts
ORDER BY full_name ASC;


-- Highest salary first

SELECT *
FROM shazan.accounts
ORDER BY salary DESC;


/*
===============================================================================
ORDER BY MULTIPLE COLUMNS
===============================================================================

Suppose two users have same country.

Sort by

1. Country

Then

2. Salary

===============================================================================
*/


SELECT *
FROM shazan.accounts
ORDER BY country ASC,
salary DESC;


/*
Meaning

Sort country first.

Inside each country,

sort salary.

Example

Australia

90000

80000

65000

Canada

70000

50000

USA

55000

45000

===============================================================================
4. LIMIT
===============================================================================

Concept

LIMIT tells PostgreSQL

Return ONLY N rows.

Useful when

Showing recent posts

Top products

Latest users

===============================================================================
*/


-- First 5 users

SELECT *
FROM shazan.accounts
LIMIT 5;


-- Top 3 highest salaries

SELECT *
FROM shazan.accounts
ORDER BY salary DESC
LIMIT 3;


/*
LIMIT

Only controls

How many rows

are returned.

===============================================================================
5. OFFSET
===============================================================================

Concept

OFFSET skips rows.

Example

OFFSET 5

Skip first 5 rows.

Then return remaining rows.

Usually used together with LIMIT.

===============================================================================
*/


-- Skip first 3 users

SELECT *
FROM shazan.accounts
OFFSET 3;


-- Skip first 3
-- Return next 5

SELECT *
FROM shazan.accounts
LIMIT 5
OFFSET 3;


/*
===============================================================================
6. PAGINATION
===============================================================================

Concept

Pagination means

Instead of loading

1000 rows,

load

10

20

50

at a time.

Example

Google

Page 1

Page 2

Page 3

Amazon

Facebook

LinkedIn

All use pagination.

===============================================================================

Formula

LIMIT page_size

OFFSET (page_number-1)*page_size

===============================================================================
*/


/*
Page 1

10 records

Skip 0
*/

SELECT *
FROM shazan.accounts
LIMIT 10
OFFSET 0;


/*
Page 2

Skip first 10

Return next 10
*/

SELECT *
FROM shazan.accounts
LIMIT 10
OFFSET 10;


/*
Page 3

Skip first 20

Return next 10
*/

SELECT *
FROM shazan.accounts
LIMIT 10
OFFSET 20;


/*
General Formula

Page = 5

Page Size = 20

OFFSET

(5-1)*20

80

LIMIT 20

OFFSET 80

===============================================================================
REAL WORLD EXAMPLE
===============================================================================

Imagine you have

10,000 users.

Without pagination

SELECT *

returns

10,000 rows.

Slow.

Waste of bandwidth.

Bad user experience.

Instead

LIMIT 20

OFFSET 0

Only load

20 users.

When user clicks

Next

LIMIT 20

OFFSET 20

Efficient.

===============================================================================
PRACTICE
===============================================================================

1.
Find users whose salary is NULL.

-------------------------------------

2.
Find users whose country is NOT NULL.

-------------------------------------

3.
Sort users by age (ascending).

-------------------------------------

4.
Sort users by salary (descending).

-------------------------------------

5.
Sort by country then salary.

-------------------------------------

6.
Return first 5 users.

-------------------------------------

7.
Return highest 3 salaries.

-------------------------------------

8.
Skip first 5 users.

-------------------------------------

9.
Return users

11-20.

-------------------------------------

10.
Write pagination query

Page = 4

Page Size = 15

===============================================================================
INTERVIEW QUESTIONS
===============================================================================

Q1.
What is NULL?

Unknown or missing value.

-------------------------------------

Q2.
Can NULL be compared using '='?

No.

Use

IS NULL

or

IS NOT NULL.

-------------------------------------

Q3.
Difference between ASC and DESC?

ASC

Small → Large

A → Z

DESC

Large → Small

Z → A

-------------------------------------

Q4.
What does LIMIT do?

Restricts the number
of returned rows.

-------------------------------------

Q5.
What does OFFSET do?

Skips rows.

-------------------------------------

Q6.
How is pagination implemented?

LIMIT + OFFSET

Example

LIMIT 20
OFFSET 40

-------------------------------------

Q7.
Is ORDER BY required?

No.

But without ORDER BY,

the returned order is not guaranteed.

===============================================================================
SUMMARY
===============================================================================

NULL
✔ Unknown value

IS NULL
✔ Find missing values

IS NOT NULL
✔ Find existing values

ORDER BY ASC
✔ Small → Large

ORDER BY DESC
✔ Large → Small

LIMIT
✔ Restrict returned rows

OFFSET
✔ Skip rows

Pagination
✔ LIMIT + OFFSET

Formula

LIMIT page_size

OFFSET (page_number - 1) * page_size

===============================================================================
NEXT CHAPTER

04_update_delete.sql

Topics

• UPDATE
• DELETE
• RETURNING
• DELETE vs TRUNCATE
• Safe Updates
• Transaction Basics
===============================================================================