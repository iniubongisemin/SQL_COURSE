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

-- THIS IS A LEFT JOIN RIGHT?
-- 1.
SELECT 
    c1.name AS city,
    code,
    c2.name AS country,
    region,
    city_proper_pop
FROM cities AS c1
-- Perform an inner join with cities as c1 and countries as c2 on country code
INNER JOIN countries as c2
ON c1.country_code = c2.code
ORDER BY code DESC;

-- 2.
SELECT 
	c1.name AS city, 
    code, 
    c2.name AS country,
    region, 
    city_proper_pop
FROM cities AS c1
-- Join right table (with alias)
LEFT JOIN countries AS c2
ON c1.country_code = c2.code
ORDER BY code DESC;

-- BUILDING ON YOUR LEFT JOIN
-- 1.
SELECT name, region, gdp_percapita
FROM countries AS c
LEFT JOIN economies AS e
-- Match on code fields
USING(code)
-- Filter for the year 2010
WHERE year = 2010;

-- 2. Select region, and average gdp_percapita as avg_gdp
SELECT region, AVG(gdp_percapita) AS avg_gdp
FROM countries AS c
LEFT JOIN economies AS e
USING(code)
WHERE year = 2010
-- Group by region
GROUP BY c.region;

-- 3. 
SELECT region, AVG(gdp_percapita) AS avg_gdp
FROM countries AS c
LEFT JOIN economies AS e
USING(code)
WHERE year = 2010
GROUP BY region
-- Order by descending avg_gdp
ORDER BY avg_gdp DESC
-- Return only first 10 records
LIMIT 10;

-- IS THIS RIGHT?
-- Modify this query to use RIGHT JOIN instead of LEFT JOIN
SELECT countries.name AS country, languages.name AS language, percent
FROM languages
RIGHT JOIN countries
USING(code)
ORDER BY language;

-- COMPARING JOINS
-- 1. SELECT name AS country, code, region, basic_unit
FROM countries
-- Join to currencies
LEFT JOIN currencies
USING (code)
WHERE region = 'North America' 
	OR name IS NULL
ORDER BY region;

-- 2. 
SELECT name AS country, code, region, basic_unit
FROM countries
-- Join to currencies
LEFT JOIN currencies
USING (code)
WHERE region = 'North America' 
	OR name IS NULL
ORDER BY region;

-- 3.
SELECT name AS country, code, region, basic_unit
FROM countries
-- Join to currencies
INNER JOIN currencies
USING (code)
WHERE region = 'North America' 
	OR name IS NULL
ORDER BY region;

-- CHAINING FULL JOINS
SELECT 
	c1.name AS country, 
    region, 
    l.name AS language,
	basic_unit, 
    frac_unit
FROM countries AS c1 
-- Full join with languages (alias as l)
FULL JOIN languages AS l 
USING (code)
-- Full join with currencies (alias as c2)
FULL JOIN currencies AS c2
USING (code)
WHERE region LIKE 'M%esia';

-- HISTORIES AND LANGUAGES
-- 1.
SELECT c.name AS country, l.name AS language
-- Inner join countries as c with languages as l on code
FROM languages AS l
INNER JOIN countries AS c
ON l.code = c.code
WHERE c.code IN ('PAK','IND')
	AND l.code in ('PAK','IND');

-- 2.
SELECT c.name AS country, l.name AS language
FROM countries AS c        
-- Perform a cross join to languages (alias as l)
CROSS JOIN languages AS l
WHERE c.code IN ('PAK','IND')
	AND l.code IN ('PAK','IND');

-- CHOOSING YOUR JOIN
SELECT 
	c.name AS country,
    region,
    life_expectancy AS life_exp
FROM countries AS c
-- Join to populations (alias as p) using an appropriate join
LEFT JOIN populations AS p 
ON c.code = p.country_code
-- Filter for only results in the year 2010
WHERE year = 2010
-- Sort by life_exp
ORDER BY life_exp
-- Limit to five records
LIMIT 5;

-- COMPARING A COUNTRY TO ITSELF
-- 1. Select aliased fields from populations as p1
SELECT 
    p1.country_code,
    p1.size AS size2010,
    p2.size AS size2015
-- Join populations as p1 to itself, alias as p2, on country code
FROM populations AS p1
INNER JOIN populations AS p2
ON p1.country_code = p2.country_code;

-- 2.
SELECT 
	p1.country_code, 
    p1.size AS size2010, 
    p2.size AS size2015
FROM populations AS p1
INNER JOIN populations AS p2
ON p1.country_code = p2.country_code
WHERE p1.year = 2010
-- Filter such that p1.year is always five years before p2.year
    AND p1.year = p2.year - 5;