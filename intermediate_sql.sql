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

-- USING WHERE WITH NUMBERS
-- 1. Select film_id and imdb_score with an imdb_score over 7.0
SELECT film_id, imdb_score
FROM reviews
WHERE imdb_score > 7.0;

-- 2. Select film_id and facebook_likes for ten records with less than 1000 likes 
SELECT film_id, facebook_likes
FROM reviews
WHERE facebook_likes < 1000
LIMIT 10;

-- 3. Count the records with at least 100,000 votes
SELECT COUNT(num_votes) as films_over_100K_votes
FROM reviews
WHERE num_votes > 100000;

-- Using WHERE with text
-- Count the Spanish-language films
SELECT COUNT(language) as count_spanish
FROM films
WHERE language = 'Spanish';

-- Using AND
-- 1. Update the query to see all German-language films released after 2000
SELECT title, release_year
FROM films
WHERE release_year < 2000
AND language = 'German';

-- 2. Update the query to see all German-language films released after 2000
SELECT title, release_year
FROM films
WHERE release_year > 2000
	AND language = 'German';

-- 3. Select all records for German-language films released after 2000 and before 2010
SELECT * 
FROM films
WHERE release_year > 2000 AND release_year < 2010 AND language = 'German'; 

-- Using AND


-- Using OR
-- Find the title and year of films from the 1990 or 1999
SELECT title, release_year
FROM films
WHERE release_year = 1990 OR release_year = 1999;

