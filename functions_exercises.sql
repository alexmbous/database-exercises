


USE employees;
#Modify your first query to order by first name. The first result should be Irena Majewski and the last result should be Vidya Schaft.
SELECT first_name, last_name FROM employees WHERE first_name IN ('Irena', 'Vidya' , 'Maya') ORDER BY  first_name;

#Update the query to order by first name and then last name. The first result should now be Irena Acton and the last should be Vidya Zweizig.
SELECT first_name, last_name FROM employees WHERE first_name IN ('Irena', 'Vidya' , 'Maya') ORDER BY  first_name ASC, last_name ASC;


#Change the order by clause so that you order by last name before first name. Your first result should still be Irena Acton but now the last result should be Maya Zyda.
SELECT first_name, last_name FROM employees WHERE first_name IN ('Irena', 'Vidya' , 'Maya') ORDER BY  last_name ASC, first_name ASC;


#Update your queries for employees with 'E' in their last name to sort the results by their employee number. Your results should not change!
SELECT * FROM employees WHERE last_name LIKE '%E%' ORDER BY  emp_no DESC;


#Now reverse the sort order for both queries.
SELECT * FROM employees WHERE last_name LIKE '%E%' ORDER BY  emp_no ASC;


#Change the query for employees hired in the 90s and born on Christmas such that the first result is the oldest employee who was hired last. It should be Khun Bernini.
SELECT * FROM employees WHERE hire_date >= '1990-01-01' && hire_date <= '1999-12-31' AND birth_date LIKE '%-12-25' ORDER BY birth_date, hire_date DESC;



SELECT CONCAT (first_name, last_name) FROM employees WHERE first_name LIKE 'E%' AND first_name LIKE '%E'AND last_name LIKE 'E%' AND last_name LIKE '%E';



#For your query of employees born on Christmas and hired in the 90s, use datediff() to find how many days they have been working at the company (Hint: You will also need to use now() or curdate())
SELECT first_name, last_name, datediff(curdate(), hire_date) FROM employees WHERE hire_date >= '1990-01-01' && hire_date <= '1999-12-31' AND birth_date LIKE '%-12-25' ORDER BY datediff(curdate(), hire_date) DESC;
