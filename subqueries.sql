-- SEMI JOIN
-- 1. Select country code for countries in the Middle East
SELECT code
FROM countries
WHERE region = 'Middle East';

-- 2. Select unique language names
SELECT DISTINCT name
FROM languages
-- Order by the name of the language
ORDER BY name ASC;

-- 3.
SELECT DISTINCT name
FROM languages
-- Add syntax to use bracketed subquery below as a filter
WHERE code IN 
    (SELECT code
    FROM countries
    WHERE region = 'Middle East')
ORDER BY name;

-- DIAGNOSING PROBLEMS USING ANTI JOIN
-- 1. Select code and name of countries from Oceania
SELECT code, name
FROM countries
WHERE continent = 'Oceania';

-- 2.
SELECT code, name
FROM countries
WHERE continent = 'Oceania'
-- Filter for countries not included in the bracketed subquery
AND code NOT IN
    (SELECT code
    FROM currencies);

-- SUBQUERIES INSIDE WHERE
-- 1. Select average life_expectancy from the populations table
SELECT AVG(life_expectancy)
FROM populations
-- Filter for the year 2015
WHERE year = 2015;

-- 2.
SELECT *
FROM populations
WHERE year = 2015
-- Filter for only those populations where life expectancy is 1.15 times higher than average
  AND life_expectancy > 1.15 * 
  (SELECT AVG(life_expectancy)
   FROM populations
   WHERE year = 2015);

-- WHERE DO PEOPLE LIVE?
-- Select relevant fields from cities table
SELECT name, country_code, urbanarea_pop 
FROM cities
-- Filter using a subquery on the countries table
WHERE name IN
    (SELECT capital
    FROM countries  
    ORDER BY urbanarea_pop DESC);