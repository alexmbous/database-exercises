USE employees;

-- Write a query to get the average salary current managers make by gender
-- M 79350.60
-- F 75690.00

SELECT gender AS 'Gender', avg(salary) AS 'Average Salary'
FROM employees AS e
  JOIN dept_manager AS dm
    ON dm.emp_no = e.emp_no
  JOIN salaries AS s
    ON dm.emp_no = s.emp_no
WHERE dm.to_date LIKE '9999%'
      AND s.to_date LIKE '9999%'
GROUP BY gender;
;


-- Write a query to get the avg salary managers historically make by gender
-- M 72810.94
-- F 62037.21

SELECT gender AS 'Gender', avg(salary) AS 'Average Salary'
FROM employees AS e
  JOIN dept_manager AS dm
    ON dm.emp_no = e.emp_no
  JOIN salaries AS s
    ON dm.emp_no = s.emp_no
GROUP BY gender;
;


-- get avg salary for all current employees by gender
-- M 72044.66
-- F 71963.57

SELECT gender AS 'Gender', avg(salary) AS 'Average Salary'
FROM employees AS e
  JOIN salaries AS s
    ON e.emp_no = s.emp_no
WHERE to_date LIKE '9999%'
      AND s.to_date LIKE '9999%'
GROUP BY gender;
;



-- get avg historic salary for all employees by gender
-- M 63842.25
-- F 63750.17

SELECT e.gender AS 'Gender', avg(salary) AS 'Average Salary'
FROM employees AS e
  JOIN salaries AS s
    ON e.emp_no = s.emp_no
GROUP BY e.gender;
;
