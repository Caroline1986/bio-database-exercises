USE employees;

# Update your queries for employees whose names start and end with 'E'. Use concat() to combine their first and last name together as a single column in your results.
SELECT emp_no, CONCAT(first_name, ' ', last_name) AS name, birth_date, gender, hire_date
FROM employees
WHERE last_name LIKE 'E%e';

# For your query of employees born on Christmas and hired in the 90s, use datediff() to find how many days they have been working at the company (Hint: You will also need to use now() or curdate()).
SELECT first_name, last_name, DATEDIFF(NOW(), hire_date)
FROM employees
WHERE birth_date LIKE '%-12-25'
  AND (hire_date BETWEEN '1990-01-01' and '1999-12-31')
ORDER BY birth_date, hire_date DESC;
