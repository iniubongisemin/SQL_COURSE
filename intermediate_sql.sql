SELECT COUNT(film_id) AS count_film_id
FROM reviews;

-- PRACTICE WITH COUNT
-- Count the number of records in the people table
SELECT COUNT(*) AS count_records
FROM people;

-- Count the number of birthdates in the people table
SELECT COUNT(birthdate) AS count_birthdate
FROM people;

-- Count the records for languages and countries represented in the films table
SELECT COUNT(language) AS count_languages, COUNT(country) AS count_countries
FROM films;

-- SELECT DISTINCT
-- Return the unique countries from the films table
SELECT DISTINCT country
FROM films;

-- Count the distinct countries from the films table
SELECT COUNT(DISTINCT country) AS count_distinct_countries
FROM films;

-- DEBUGGING ERRORS
-- Debug this code
SELECT certfication
FROM films
LIMIT 5;

-- -- Corrected query
 code
SELECT certification
FROM films
LIMIT 5;

-- Debug this code
SELECT film_id imdb_score num_votes
FROM reviews;

-- -- Corrected query
 code
SELECT film_id, imdb_score, num_votes
FROM reviews;

-- Debug this code
SELECT COUNNT(birthdate) AS count_birthdays
FROM peeple;

-- -- Corrected query
 code
SELECT COUNT(birthdate) AS count_birthdays
FROM people;

-- Rewrite this query
select person_id, role from roles limit 10

-- Corrected query
SELECT person_id, role 
FROM roles 
LIMIT 10;