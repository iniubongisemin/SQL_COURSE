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
