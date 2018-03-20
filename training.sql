SHOW DATABASES;

USE employees;

SHOW TABLES;

DESCRIBE employees;

SELECT * FROM employees;

SELECT * FROM employees WHERE first_name = 'steve';

SELECT * FROM departments;

# search for employees on hire date of '1985-01-01'
SELECT * FROM employees WHERE hire_date = '1985-01-01';

# search for employees on hire date of '1985-01-01' and an employee number of 110022
SELECT * FROM employees WHERE hire_date = '1985-01-01' and emp_no = 110022;

# search for names that have 'sus' in it.
SELECT first_name FROM employees WHERE first_name LIKE '%sus%';

SELECT * FROM employees WHERE hire_date like '%-01-01';

#To find all the employees between employee number 10026 and 10082:
SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no BETWEEN 10026 AND 10082;

#To find all the employees with the last name of 'Herber', 'Dredge', 'Lipner', and 'Baek':
SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name IN ('Herber', 'Dredge', 'Lipner', 'Baek');

#We can also use comparison operators.
SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name = 'Baek';

SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no < 10026;

SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no <= 10026;

#We can also use IS NULL and IS NOT NULL to see if a value is NULL or not.
SELECT emp_no, title
FROM titles
WHERE to_date IS NOT NULL;

#We can chain together an IN clause with a LIKE clause, or any of the clauses, using AND and OR.
SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name IN ('Herber','Baek')
      AND emp_no < 20000;

#The important thing is that we can chain as many of these as we please together, but it can get messy very quickly.
SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no < 20000
      AND last_name IN ('Herber','Baek')
      OR first_name = 'Shridhar';

#We can force evaluation grouping using ().
SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no < 20000
      AND (
        last_name IN ('Herber','Baek')
        OR first_name = 'Shridhar'
      );


#Find all employees with first names 'Irena', 'Vidya', or 'Maya' — 709 rows (Hint: Use IN).
SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya' , 'Maya');

#Find all employees whose last name starts with 'E' — 7,330 rows.
SELECT * From employees WHERE last_name LIKE 'E%';

#Find all employees hired in the 90s — 135,214 rows.
SELECT * FROM employees WHERE hire_date >= '1990-01-01' && hire_date <= '1999-12-31';

#Find all employees born on Christmas — 842 rows.
SELECT * FROM employees WHERE birth_date LIKE '%-12-25';

#Find all employees with a 'q' in their last name — 1,873 rows.
SELECT * FROM employees WHERE last_name LIKE '%q%';

#Update your query for 'Irena', 'Vidya', or 'Maya' to use OR instead of IN — 709 rows.
SELECT * FROM employees WHERE first_name = 'Irena' or first_name =  'Vidya' or first_name = 'Maya';
#Add a condition to the previous query to find everybody with those names who is also male — 441 rows.
SELECT * FROM employees WHERE  first_name IN ('Irena', 'Vidya' , 'Maya') AND gender = 'M';
#Find all employees whose last name starts or ends with 'E' — 30,723 rows.
SELECT * FROM employees WHERE last_name LIKE 'E%' OR last_name LIKE '%E';
#Duplicate the previous query and update it to find all employees whose last name starts and ends with 'E' — 899 rows.
SELECT * FROM employees WHERE last_name LIKE '%E' AND last_name LIKE 'E%';
#Find all employees hired in the 90s and born on Christmas — 362 rows.
SELECT * FROM employees WHERE hire_date >= '1990-01-01' && hire_date <= '1999-12-31' AND birth_date LIKE '%-12-25';
#Find all employees with a 'q' in their last name but not 'qu' — 547 rows.
SELECT * FROM employees WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';

#~~~~~~~~~~~~~ORDER BY:
SELECT first_name, last_name
FROM employees
ORDER BY last_name;

SELECT first_name, last_name
FROM employees
ORDER BY last_name DESC;

SELECT first_name, last_name
FROM employees
ORDER BY last_name ASC;

SELECT first_name, last_name
FROM employees
ORDER BY last_name DESC, first_name ASC;

#~~~~~~~~~~~~~LIMIT~~~~~~~~~~~
#Using LIMIT
#Generally, a query with a LIMIT clause follows this form:

# BASIC FORMULA: SELECT columns FROM table LIMIT count [OFFSET count];

#The simplest use of the LIMIT clause just specifies a number after the keyword.


SELECT emp_no, first_name, last_name
FROM employees
WHERE first_name LIKE 'M%'
LIMIT 10;
#Adding an OFFSET tells MySQL which row to start with.


SELECT emp_no, first_name, last_name
FROM employees
WHERE first_name LIKE 'M%'
LIMIT 25 OFFSET 50;
#LIMIT and OFFSET are commonly used for pagination, or creating pages of data.


#CONCAT
#The CONCAT() function takes in any number of strings or column names and will concatenate them all together.


SELECT CONCAT('Hello ', 'Codeup', '!');
#Our results will look like:


#+---------------------------------+
#| CONCAT('Hello ', 'Codeup', '!') |
#+---------------------------------+
#| Hello Codeup!                   |
#+---------------------------------+
#LIKE / NOT LIKE
#As we learned earlier, we use WHERE with the LIKE option to find similarities. The % are wildcards.

#We saw this query will select all first names with the letter combination 'sus':


SELECT first_name
FROM employees
WHERE first_name LIKE '%sus%';
# NOT LIKE will return the results that do not match the pattern.


SELECT DISTINCT first_name
FROM employees
WHERE first_name NOT LIKE '%a%';
#This query selects all the first names with out the letter 'a' in them.

#Date and Time Functions
#MySQL offers a wide range of date and time functions. One of the most commonly used is NOW() or its synonymous alias CURRENT_TIMESTAMP().

#NOW
#The NOW() function returns the current time in YYYY-MM-DD HH:MM:SS format.


SELECT NOW();
#CURDATE
#The CURDATE() function returns just the current date with no time information in YYYY-MM-DD format.


SELECT CURDATE();
#CURTIME
#The function CURTIME() returns the time formatted as HH:MM:SS.


SELECT CURTIME();
#UNIX_TIMESTAMP() & UNIX_TIMESTAMP(date)
#The UNIX_TIMESTAMP() function is used to represent time as an integer. It will return the number of seconds since midnight January 1st, 1970. If you pass a date time value to UNIX_TIMESTAMP(), it will give you the number of seconds from the unix epoch to that date.


SELECT CONCAT('Teaching people to code for ', UNIX_TIMESTAMP() - UNIX_TIMESTAMP('2014-02-04'), ' seconds');


