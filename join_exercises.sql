CREATE TABLE roles
(
    id   INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE users
(
    id      INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name    VARCHAR(100) NOT NULL,
    email   VARCHAR(100) NOT NULL,
    role_id INT UNSIGNED DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name)
VALUES ('admin');
INSERT INTO roles (name)
VALUES ('author');
INSERT INTO roles (name)
VALUES ('reviewer');
INSERT INTO roles (name)
VALUES ('commenter');

INSERT INTO users (name, email, role_id)
VALUES ('bob', 'bob@example.com', 1),
       ('joe', 'joe@example.com', 2),
       ('sally', 'sally@example.com', 3),
       ('adam', 'adam@example.com', 3),
       ('jane', 'jane@example.com', null),
       ('mike', 'mike@example.com', null);

INSERT INTO users (name, email, role_id)
VALUES ('bob', 'bob@example.com', 2),
       ('joe', 'joe@example.com', 2),
       ('sally', 'sally@example.com', 2),
       ('jane', 'jane@example.com', null);

SELECT *
FROM users;

SELECT users.name as user_name, roles.name as role_name
FROM users
         JOIN roles ON users.role_id = roles.id;

SELECT u.name as name, u.email, r.name AS 'role'
FROM users AS u
         LEFT JOIN roles AS r ON u.role_id = r.id;

SELECT users.name AS user_name, roles.name AS role_name
FROM users
         RIGHT JOIN roles ON users.role_id = roles.id;

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

#4
# SELECT * FROM departments WHERE dept_name = 'Customer Servive'; -- d009

SELECT t.title AS Title, COUNT(t.emp_no) AS Count
FROM titles AS t
         JOIN dept_emp AS de on t.emp_no = de.emp_no
         JOIN departments AS d ON de.dept_no = d.dept_no
WHERE de.dept_no = 'd009'
  AND t.to_date = '9999-01-01'
  AND de.to_date = '9999-01-01'
GROUP BY t.title;

# Find the current salary of all current managers.
SELECT d.dept_name                            AS 'Department Name',
       CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager',
       s.salary                               AS salary
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



