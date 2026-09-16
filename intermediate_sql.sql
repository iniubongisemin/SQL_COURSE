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
WHERE language = 'German'
	AND release_year > 2000 
	AND release_year < 2010; 

-- Using OR
-- Find the title and year of films from the 1990 or 1999
SELECT title, release_year
FROM films
WHERE release_year = 1990 
	OR release_year = 1999;

-- Find films released after the year 2000
SELECT title
FROM films
WHERE release_date > 2000;

-- Filter the records to include English or Spanish-language films
SELECT title, release_year
FROM films
WHERE (release_year = 1990 OR release_year = 1999)
-- Add a filter to see only English or Spanish-language films
	AND (language = 'English' OR language = 'Spanish');

SELECT title, release_year
FROM films
WHERE (release_year = 1990 OR release_year = 1999)
	AND (language = 'English' OR language = 'Spanish')
-- Filter films with more than $2,000,000 gross
	AND gross > 2000000;


-- Using BETWEEN
-- 1. Select the title and release_year for films released between 1990 and 2000
SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000;

-- 2. Build on your previous query to select only films with a budget over $100 million.
SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000
-- Narrow down your query to films with budgets > $100 million
	AND budget > 100000000;

-- 3. Now, restrict the query to only return Spanish-language films.
SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000
	AND budget > 100000000
-- Restrict the query to only Spanish-language films
	AND language = 'Spanish';

-- 4. Finally, amend the query to include all Spanish-language or French-language films with the same criteria.
SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000
	AND budget > 100000000
-- Amend the query to include Spanish or French-language films
	AND (language = 'Spanish' OR language = 'French');

-- LIKE and NOT LIKE
-- 1. Select the names that start with B
SELECT name
FROM people
WHERE name LIKE 'B%';

-- 2. Select the names of people whose names have 'r' as the second letter.
SELECT name
FROM people
-- Select the names that have r as the second letter
WHERE name LIKE '_r%';

-- Select the names of people whose names don't start with 'A'.
SELECT name
FROM people
-- Select names that don't start with A
WHERE name NOT LIKE 'A%';

-- WHERE IN
-- 1. Find the title and release_year for all films over two hours in length released in 1990 and 2000
SELECT title, release_year
FROM films
WHERE release_year IN (1990, 2000)
    AND duration > 120;

-- 2. Find the title and language of all films in English, Spanish, and French
SELECT title, language
FROM films
WHERE language IN ('English', 'Spanish', 'French');

-- 3. Find the title, certification, and language all films certified NC-17 or R that are in English, Italian, or Greek
SELECT title, certification, language
FROM films
WHERE certification IN ('NC-17', 'R')
    AND language IN ('English', 'Italian', 'Greek');

-- Combining filtering and selecting
-- Count the unique titles
SELECT COUNT(DISTINCT title) AS nineties_english_films_for_teens
FROM films
-- Filter to release_years to between 1990 and 1999
WHERE release_year BETWEEN 1990 AND 1999
-- Filter to English-language films
	AND language = 'English'
-- Narrow it down to G, PG, and PG-13 certifications
	AND certification IN ('G', 'PG', 'PG-13');

-- Practice with NULLs
-- List all film titles with missing budgets
SELECT title AS no_budget_info
FROM films
WHERE budget IS NULL;

-- Count the number of films we have language data for
SELECT COUNT(language) AS count_language_known
FROM films
WHERE language IS NOT NULL;