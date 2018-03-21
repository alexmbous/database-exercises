USE employees;

SELECT * FROM employees;

# Show each department along with the name of the current manager for that department.
SELECT d.dept_name AS 'Department Name',
  CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager'
FROM employees AS e
  JOIN dept_manager AS dm
    ON dm.emp_no = e.emp_no
  JOIN departments AS d
    ON d.dept_no = dm.dept_no
WHERE dm.to_date LIKE "9999%"
ORDER BY d.dept_name;

# Find the name of all departments currently managed by women.
SELECT d.dept_name AS 'Department Name',
  CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager'
FROM employees AS e
  JOIN dept_manager AS dm
    ON dm.emp_no = e.emp_no
  JOIN departments AS d
    ON d.dept_no = dm.dept_no
WHERE dm.to_date LIKE "9999%"
      AND e.gender = 'F';

# Find the current titles of employees currently working in the Customer Service department.
SELECT t.title AS 'Title', COUNT(t.title)
FROM titles AS t
  JOIN dept_emp AS de
    ON de.emp_no = t.emp_no
WHERE de.dept_no = 'd009'
      AND de.to_date LIKE '9999-%'
      AND t.to_date LIKE '9999-%'
GROUP BY t.title;

# Find the current salary of all current managers.
SELECT d.dept_name AS 'Department',
  CONCAT(e.first_name, ' ', e.last_name) AS 'Name',
  s.salary AS 'Salary'
FROM employees AS e
  JOIN dept_manager AS dm
    ON dm.emp_no = e.emp_no
  JOIN departments AS d
    ON d.dept_no = dm.dept_no
  JOIN salaries AS s
    ON s.emp_no = e.emp_no
WHERE dm.to_date LIKE '9999-%'
      AND s.to_date LIKE '9999-%';


#Bonus Find the names of all current employees, their department name, and their current manager's name.

#         NEED HELP WITH THIS

SELECT   d.dept_name AS 'Department Name',
  CONCAT(mortals.first_name, ' ', mortals.last_name) AS 'Name',
  CONCAT(mgmt.first_name,' ',mgmt.last_name) AS 'Manager Name'
FROM employees AS mortals
  JOIN dept_emp AS emp
    ON mortals.emp_no = emp.emp_no
  JOIN departments AS d
    ON emp.dept_no = d.dept_no
  JOIN dept_manager AS dm
    ON emp.dept_no = dm.dept_no
  JOIN employees mgmt
    ON emp.emp_no = mgmt.emp_no
WHERE emp.to_date LIKE '9999-%'
    ;


