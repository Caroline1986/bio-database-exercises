USE employees;

# each department along with the name of the current manager for that department.
SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager'
FROM employees as e
         JOIN dept_manager as de
              ON de.emp_no = e.emp_no
         JOIN departments as d
              ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01'
#   Find the name of all departments currently managed by women.
  AND gender = 'f'
ORDER BY d.dept_name;

# Find the current salary of all current managers.
SELECT d.dept_name AS 'Department Name',
       CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager',
       s.salary AS salary
FROM employees as e
         JOIN dept_manager as de
              ON de.emp_no = e.emp_no
         JOIN departments as d
              ON d.dept_no = de.dept_no
         JOIN salaries s
              on de.emp_no = s.emp_no
WHERE de.to_date > CURDATE()
  AND s.to_date > CURDATE()
ORDER BY d.dept_name;

SELECT CONCAT(e.first_name, ' ', e.last_name)   AS 'Employee Name',
       d.dept_name                              as 'Department Name',
       CONCAT(mn.first_name, ' ', mn.last_name) AS 'Manager Name'
FROM employees as e
         JOIN dept_emp as de
              ON e.emp_no = de.emp_no
         JOIN departments d
              ON de.dept_no = d.dept_no
         JOIN dept_manager dm
              ON de.dept_no = dm.dept_no
         JOIN employees mn
              ON dm.emp_no = mn.emp_no
WHERE dm.to_date > CURDATE()
  AND de.to_date > CURDATE()
ORDER BY d.dept_name;



