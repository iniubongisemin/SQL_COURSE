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