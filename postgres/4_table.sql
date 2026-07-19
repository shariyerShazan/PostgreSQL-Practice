-- DB -> SCHEMA -> TABLE -> ROWS

CREATE SCHEMA IF NOT EXISTS student_schema;


DROP TABLE IF EXISTS student_schema.students;

CREATE TABLE student_schema.students (
    -- it's auto incremental integer value. 
    -- searial means it's like 1,2,3,....., 100, so on
    -- primary key mean it's alaway unique.
    id SERIAL PRIMARY KEY,


    -- text string data. 
    -- not null mean. this colum is required. 
    -- sql will reject if the name value is not present.
    name TEXT NOT NULL,


    -- two student can't use same email
    email TEXT NOT NULL UNIQUE,

    -- it's take just integer value.
    age INT,
 
    -- timestamp store data in time format.
    -- default mean's if you dont give any value. then it's take now()
    created_at TIMESTAMP DEFAULT NOW()

);

INSERT INTO student_schema.students(name, email, age)
VALUES 
   ('Shariyer', 'shariyer@gmail.com', 21),
   ('Priya' , 'priya@atiya.com' , 23);

SELECT * FROM student_schema.students;