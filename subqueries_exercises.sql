USE employees;

# Find all the employees with the same hire date as employee 101010 using a sub-query. 69 Rows
      SELECT
        concat(e.first_name, ' ', e.last_name) AS 'Employee Name',
        e.hire_date
      FROM employees AS e
      WHERE e.hire_date IN (SELECT e.hire_date
                            FROM employees e
                            WHERE e.emp_no = 101010);


#Find all the titles held by all employees with the first name Aamod. 314 total titles, 6 unique titles

      SELECT
        t.title AS 'Employee title',
        count(*) AS 'How many Employees'
      FROM titles AS t
      WHERE t.emp_no IN (SELECT e.emp_no
                         FROM employees AS e
                         WHERE e.first_name = 'Aamod')
      GROUP BY t.title;


# Find all the current department managers that are female.

      SELECT
        first_name AS 'First Name',
        last_name  AS 'Last Name'
      FROM employees
      WHERE gender = 'F' AND emp_no
                               IN (SELECT emp_no
                                   FROM dept_manager
                                   WHERE to_date > CURDATE());

#BONUS
# Find all the department names that currently have female managers.
      SELECT
        d.dept_name AS 'Departments with Female Managers'
      FROM departments AS d
      WHERE d.dept_no IN
            (SELECT dm.dept_no
             FROM dept_manager AS dm
             WHERE dm.to_date = '9999-01-01'
                   AND dm.emp_no IN
                       (SELECT e.emp_no
                        FROM employees AS e
                        WHERE e.gender = 'F'))
      GROUP BY d.dept_name;

# Find the first and last name of the employee with the highest salary.

      SELECT first_name, last_name, salary
      FROM employees
        JOIN salaries
          ON salaries.emp_no = employees.emp_no
      WHERE salary in (
        SELECT max(salary)
        FROM salaries
      );
