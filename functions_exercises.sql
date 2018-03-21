USE employees;

#Update your queries for employees whose names start and end with 'E'. Use concat() to combine their first and last name together as a single column in your results.
SELECT CONCAT (first_name,' ', last_name)
FROM employees
WHERE first_name
      LIKE 'E%E'
      AND last_name
          LIKE 'E%E';

#For your query of employees born on Christmas and hired in the 90s, use datediff() to find how many days they have been working at the company (Hint: You will also need to use now() or curdate())
SELECT CONCAT ('NAME: ',first_name,' ', last_name), CONCAT('DAYS SINCE HIRED: ', datediff(curdate(), hire_date))
FROM employees
WHERE hire_date >= '1990-01-01' && hire_date <= '1999-12-31'
      AND birth_date
          LIKE '%-12-25'
ORDER BY datediff(curdate(), hire_date) DESC;
