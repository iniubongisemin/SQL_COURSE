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