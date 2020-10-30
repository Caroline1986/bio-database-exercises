USE employees;

# In your script, use DISTINCT to find the unique titles in the titles table
SELECT DISTINCT title
FROM titles;

# find just the unique last names that start and end with 'E' using GROUP BY.
SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE 'E%E'
GROUP BY last_name;

# Update your previous query to now find unique combinations of first and last name where the last name starts and ends with 'E'.
SELECT DISTINCT last_name, first_name
FROM employees
WHERE last_name LIKE 'E%E'
GROUP BY last_name, first_name;

# Find the unique last names with a 'q' but not 'qu'.
SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE '%q%'
AND last_name NOT LIKE '%qu%';

SELECT last_name
FROM employees
WHERE last_name LIKE '%q%'
  AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

# Add a COUNT() to your results and use ORDER BY to make it easier to find employees whose unusual name is shared with others.
SELECT last_name 'Last Name', COUNT(*) AS "#"
FROM employees
WHERE last_name LIKE '%q%'
  AND last_name NOT LIKE '%qu%'
GROUP BY last_name
ORDER BY COUNT(*) DESC;

SELECT last_name, COUNT(last_name)
FROM employees
WHERE last_name LIKE '%q%'
  AND last_name NOT LIKE '%qu%'
GROUP BY last_name
ORDER BY last_name;

# Use count(*) and GROUP BY to find the number of employees for each gender with those names.
SELECT  COUNT(*) '#', gender
FROM employees
WHERE first_name IN ('Irena', 'Vidya','Maya')
GROUP BY gender
ORDER BY COUNT(*) DESC;

