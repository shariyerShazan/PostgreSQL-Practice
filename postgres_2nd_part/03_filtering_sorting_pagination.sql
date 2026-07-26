/*
===============================================================================
Topic      : Advanced Filtering (Part-1)
File       : 03_filtering_sorting_pagination.sql
Part       : 1
Schema     : shazan
Database   : PostgreSQL
===============================================================================

Topics Covered

1. LIKE Pattern Matching
2. ILIKE (PostgreSQL)
3. Wildcards (% and _)
4. IN
5. NOT IN
6. BETWEEN

===============================================================================
TABLE SETUP
===============================================================================

If you already have the table, you can skip this section.
*/

DROP TABLE IF EXISTS shazan.accounts;

CREATE TABLE shazan.accounts(
    id SERIAL PRIMARY KEY,
    full_name TEXT NOT NULL,
    email TEXT UNIQUE,
    age INT,
    country TEXT,
    salary NUMERIC(10,2),
    is_active BOOLEAN DEFAULT TRUE
);

/*
===============================================================================
SAMPLE DATA
===============================================================================
*/

INSERT INTO shazan.accounts
(full_name,email,age,country,salary,is_active)
VALUES
('John Doe','john@gmail.com',25,'USA',55000,TRUE),
('Alice Johnson','alice@gmail.com',30,'Canada',70000,TRUE),
('Bob Smith','bob@gmail.com',21,'USA',45000,FALSE),
('Charlie Brown','charlie@gmail.com',28,'UK',62000,TRUE),
('David Wilson','david@gmail.com',35,'Australia',80000,TRUE),
('Emma Watson','emma@gmail.com',27,'UK',90000,TRUE),
('Michael Jordan','michael@gmail.com',40,'USA',120000,FALSE),
('Sophia Taylor','sophia@gmail.com',23,'Canada',52000,TRUE),
('Daniel Lee','daniel@gmail.com',31,'Singapore',75000,TRUE),
('Olivia Davis','olivia@gmail.com',29,'Australia',68000,FALSE);

SELECT * FROM shazan.accounts;


/*
===============================================================================
1. LIKE PATTERN MATCHING
===============================================================================

Concept
-------------------------------------------------------------------------------

LIKE searches text using patterns.

Instead of matching an exact value,
LIKE lets us search partially.

Without LIKE

WHERE full_name = 'John Doe'

This ONLY finds:

John Doe

---------------------------------------------

With LIKE

WHERE full_name LIKE 'John%'

Can find

John Doe
John Smith
Johnny
Johnson

because they all START with "John".

Syntax

SELECT *
FROM table
WHERE column LIKE 'pattern';

===============================================================================
WILDCARDS
===============================================================================

LIKE becomes powerful because of wildcards.

There are two wildcards.

1. %

2. _

Let's understand both.
*/


/*
===============================================================================
2. % Wildcard
===============================================================================

% means

ZERO
ONE
or
MANY characters.

Think of % as

"Anything can be here."

Examples

'J%'

Starts with J

-----------------------------------

'%son'

Ends with son

-----------------------------------

'%ohn%'

Contains "ohn"

-----------------------------------

'%'

Everything

===============================================================================
*/


-- Starts with John

SELECT *
FROM shazan.accounts
WHERE full_name LIKE 'John%';


-- Ends with son

SELECT *
FROM shazan.accounts
WHERE full_name LIKE '%son';


-- Contains "son"

SELECT *
FROM shazan.accounts
WHERE full_name LIKE '%son%';


-- Email ends with gmail.com

SELECT *
FROM shazan.accounts
WHERE email LIKE '%gmail.com';


-- Country starts with A

SELECT *
FROM shazan.accounts
WHERE country LIKE 'A%';


/*
===============================================================================
3. _ Wildcard
===============================================================================

_ represents EXACTLY ONE character.

Not zero.

Not many.

Exactly ONE.

Example

A_

Matches

AB
AC
AX

Does NOT match

A
ABC

----------------------------------------

Suppose names

Tom
Tim
Tam
Team

LIKE 'T_m'

Matches

Tom
Tim
Tam

Does NOT match

Team

because Team has 4 letters.

===============================================================================
*/


-- Three-letter names starting with B

SELECT *
FROM shazan.accounts
WHERE full_name LIKE 'B__%';

/*
Explanation

B

__

means

At least two characters after B.

Examples

Bob Smith

Matches

Because Bob has exactly

B o b

then more characters.

*/


-- Countries with exactly two letters

SELECT *
FROM shazan.accounts
WHERE country LIKE '__';

/*
Current data

USA

Canada

UK

Australia

Only

UK

matches.
*/


/*
===============================================================================
4. ILIKE (PostgreSQL)
===============================================================================

LIKE is case-sensitive.

'john'

is NOT

'John'

-----------------------------------------

PostgreSQL provides

ILIKE

which ignores case.

This is PostgreSQL-specific.

Examples

LIKE

John

!=

john

-----------------------------------------

ILIKE

John

==

john

===============================================================================
*/


-- Works only if exact case matches

SELECT *
FROM shazan.accounts
WHERE full_name LIKE 'john%';


-- Ignores case

SELECT *
FROM shazan.accounts
WHERE full_name ILIKE 'john%';


-- Search emails

SELECT *
FROM shazan.accounts
WHERE email ILIKE '%GMAIL.COM';


/*
===============================================================================
5. IN
===============================================================================

Concept

Instead of writing

country='USA'
OR country='Canada'
OR country='UK'

we can simply use

IN

Syntax

WHERE column IN(value1,value2,...)

Cleaner

Shorter

Recommended

===============================================================================
*/


SELECT *
FROM shazan.accounts
WHERE country IN
('USA','Canada');


SELECT *
FROM shazan.accounts
WHERE age IN
(21,25,30);


SELECT *
FROM shazan.accounts
WHERE full_name IN
('John Doe','Emma Watson');


/*
Equivalent query

country='USA'
OR
country='Canada'

Same result.

IN is simply shorter.
*/


/*
===============================================================================
6. NOT IN
===============================================================================

Concept

Return rows that are NOT inside the list.

Example

NOT IN

USA
Canada

returns

UK
Australia
Singapore

===============================================================================
*/


SELECT *
FROM shazan.accounts
WHERE country NOT IN
('USA','Canada');


SELECT *
FROM shazan.accounts
WHERE age NOT IN
(21,23,25);


/*
===============================================================================
7. BETWEEN
===============================================================================

Concept

BETWEEN checks whether a value falls inside a range.

Syntax

WHERE column BETWEEN min AND max

It includes BOTH endpoints.

Example

BETWEEN 20 AND 30

means

>=20

AND

<=30

===============================================================================
*/


-- Age between 20 and 30

SELECT *
FROM shazan.accounts
WHERE age BETWEEN 20 AND 30;


-- Salary between 60000 and 90000

SELECT *
FROM shazan.accounts
WHERE salary BETWEEN 60000 AND 90000;


-- Alphabetical range

SELECT *
FROM shazan.accounts
WHERE full_name
BETWEEN 'D' AND 'M';


/*
Equivalent Query

WHERE age >=20
AND age <=30

Same result.

BETWEEN is easier to read.

===============================================================================
PRACTICE
===============================================================================

Try writing these yourself.

1.
Find users whose names start with A.

-------------------------------------

2.
Find emails ending with gmail.com.

-------------------------------------

3.
Find countries starting with C.

-------------------------------------

4.
Find users from

USA

or

Australia.

-------------------------------------

5.
Find users NOT from UK.

-------------------------------------

6.
Find users aged

25

30

35

using IN.

-------------------------------------

7.
Find users aged between

25

35.

-------------------------------------

8.
Find salaries between

50000

80000.

-------------------------------------

9.
Find names containing

son.

-------------------------------------

10.
Find users whose email starts with

m.

===============================================================================
INTERVIEW QUESTIONS
===============================================================================

Q1. Difference between LIKE and = ?

=

matches exact value.

LIKE

matches patterns.

-------------------------------------

Q2. What does % mean?

Zero, one, or many characters.

-------------------------------------

Q3. What does _ mean?

Exactly one character.

-------------------------------------

Q4. Difference between LIKE and ILIKE?

LIKE

Case-sensitive.

ILIKE

Case-insensitive.

(PostgreSQL only.)

-------------------------------------

Q5. Why use IN instead of multiple OR conditions?

Cleaner.

Shorter.

More readable.

-------------------------------------

Q6. Is BETWEEN inclusive?

Yes.

BETWEEN 20 AND 30

includes

20

and

30.

===============================================================================
SUMMARY
===============================================================================

LIKE
✔ Pattern matching

ILIKE
✔ Case-insensitive pattern matching

%
✔ Zero or many characters

_
✔ Exactly one character

IN
✔ Match one value from a list

NOT IN
✔ Exclude a list of values

BETWEEN
✔ Match values inside an inclusive range

In Part-2 we'll learn:

• IS NULL
• IS NOT NULL
• ORDER BY
• LIMIT
• OFFSET
• Pagination
===============================================================================
```



----!

