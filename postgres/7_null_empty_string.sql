DROP TABLE IF EXISTS shazan.value_examples;


CREATE TABLE shazan.value_examples (
    id SERIAL PRIMARY KEY,
    nickname TEXT,
    bio TEXT,
    score INTEGER


);

INSERT INTO shazan.value_examples (nickname , bio, score)
VALUES 
    --- nickname is null
    (NULL , 'Learning postgres' , 10),
    ('' , 'Backend engineer' , 12),
    ('shazan' , '' , 0),
    ('priya', NULL , NULL);

SELECT * FROM shazan.value_examples;

SELECT * FROM shazan.value_examples WHERE nickname is NULL;

SELECT * FROM shazan.value_examples WHERE bio is NULL;

SELECT * FROM shazan.value_examples WHERE score is NULL;

SELECT * FROM shazan.value_examples WHERE score = 0;

SELECT * FROM shazan.value_examples WHERE nickname is NOT NULL;