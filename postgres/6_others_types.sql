

DROP TABLE IF EXISTS shazan.app_events;


CREATE TABLE shazan.app_events (

    -- UUID
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    event_name TEXT NOT NULL,

    -- JSON_B
    metadata JSONB DEFAULT '{}',

    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO shazan.app_events (event_name, metadata) 
VALUES 
     ('register', '{"name" : "shazan" , "email" : "shazan@gmail.com" , "password" : "shazan123"}'),
     ('login', '{ "email" : "shazan@gmail.com" , "password" : "shazan123"}');

SELECT * FROM shazan.app_events;

SELECT
   event_name ,
   metadata ->> 'email' AS email
FROM shazan.app_events
WHERE  metadata ? 'email';