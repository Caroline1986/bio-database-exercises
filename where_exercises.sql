USE employees;

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya','Maya');

SELECT *
FROM employees
WHERE last_name LIKE 'E%';

SELECT *
FROM employees
# WHERE hire_date BETWEEN'1990-01-01' AND '1999-12-31';
WHERE hire_date LIKE '199%';

SELECT *
FROM employees
WHERE birth_date LIKE '%-12-25';

# exercise part 2
SELECT *
FROM employees
WHERE first_name = 'Irena'
    OR first_name = 'Vidya'
    OR first_name = 'Maya';

SELECT * FROM employees
WHERE (first_name = 'Irena'
    OR first_name = 'Vidya'
    OR first_name = 'Maya')
  AND gender = 'M';

#  starts OR ends with 'E'
SELECT *
FROM employees
WHERE last_name LIKE 'E%'
   OR last_name LIKE '%E';

#  starts AND ends with 'E'
SELECT *
FROM employees
WHERE last_name LIKE 'E%E';

SELECT *
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
AND birth_date LIKE '%-12-25';

SELECT *
FROM employees
WHERE last_name LIKE '%q%'
AND last_name NOT LIKE '%qu%';