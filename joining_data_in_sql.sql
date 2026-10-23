-- YOUR FIRST JOIN
-- 1. Begin by selecting all columns from the cities table, using the SQL shortcut that selects all.
SELECT *
FROM cities
-- 2. > Perform an inner join with the cities table on the left and the countries table on the right; you do not need to alias tables here.
--    > Join ON the country_code and code columns, making sure you identify them with the correct table.
SELECT * 
FROM cities
-- Inner join to countries
INNER JOIN countries
-- Match on country codes
ON cities.country_code = countries.code;
-- 3. Select name fields (with alias) and region 
SELECT cities.name AS city, countries.name AS country, countries.region
FROM cities
INNER JOIN countries
ON cities.country_code = countries.code;

-- JOINING WITH ALIASED TABLES
-- Select fields with aliases
SELECT c.code AS country_code, name, e.year, e.inflation_rate
FROM countries AS c
-- Join to economies (alias e)
INNER JOIN economies AS e
-- Match on code field using table aliases
ON e.code = c.code

-- USING IN ACTION
SELECT c.name AS country, l.name AS language, official
FROM countries AS c
INNER JOIN languages AS l
-- Match using the code column
USING(code)

-- INSPECTING A RELATIONSHIP
-- 1. Select country (aliased) from countries
SELECT name AS country
FROM countries

-- 2. Select country and language names (aliased)
SELECT c.name AS country, l.name AS language
-- From countries (aliased)
FROM countries AS c
-- Join to languages (aliased)
INNER JOIN languages AS l
-- Use code as the joining field with the USING keyword
USING(code);

-- Select country and language name (aliased)
SELECT c.name AS country, l.name AS language
-- From countries (aliased)
FROM countries AS c
-- Join to languages (aliased)
INNER JOIN languages AS l
-- Use code as the joining field with the USING keyword
USING(code)
-- Filter for the Bhojpuri language
WHERE l.name = 'Bhojpuri';

-- JOINING MULTIPLE TABLES
-- 1. Select relevant fields
SELECT c.name, p.fertility_rate
-- Inner join countries and populations, aliased, on code
FROM populations AS p
INNER JOIN countries AS c
ON c.code = p.country_code;

-- 2. Select fields
SELECT name, e.year, fertility_rate, e.unemployment_rate
FROM countries AS c
INNER JOIN populations AS p
ON c.code = p.country_code
-- Join to economies (as e)
INNER JOIN economies as e
-- Match on country code
ON e.code = p.country_code;

-- CHECKING MULTI-TABLE JOINS
SELECT name, e.year, fertility_rate, unemployment_rate
FROM countries AS c
INNER JOIN populations AS p
ON c.code = p.country_code
INNER JOIN economies AS e
ON c.code = e.code
-- Add an additional joining condition such that you are also joining on year
	AND e.year = p.year;