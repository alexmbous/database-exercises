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

#Using the GROUP BY clause
#GROUP BY follows the same syntax as ORDER BY.


#SELECT column FROM table GROUP BY column_name [ASC|DESC];
#However, GROUP BY returns only the unique occurrences of the column specified.


SELECT DISTINCT first_name
FROM employees;
#Should get the same results as:


SELECT first_name
FROM employees
GROUP BY first_name;
#you can also specify ASC and DESC after columns named in the clause like so:


SELECT first_name
FROM employees
GROUP BY first_name DESC;
#We can also use multiple columns:


SELECT last_name, first_name
FROM employees
GROUP BY last_name, first_name;
#The above query will show us all of the unique combinations of first and last names, grouped by thier last name sorted alphebetically, and within each last name group, sorted by first name.

#Any column(s) that appear in the SELECT should also be in the GROUP BY clause.

#Aggregate Functions
#The functions we have seen so far look at data in a single column or possibly across an entire row. An aggregate function works with data across all the rows in our result. There are many aggregate functions listed in the MySQL documentation page. COUNT() is the most commonly used, and that is the one we will be taking a look at.

#COUNT
#The COUNT() function will return the number of non-null expression values in a result. You will commonly see it written as COUNT(*). For example, if we wanted to see how many rows were in our employees table total, we would run:


SELECT COUNT(*) FROM employees;
#If we were only concerned about the values in a given column, we can pass that to the COUNT() function:


SELECT COUNT(first_name)
FROM employees
WHERE first_name NOT LIKE '%a%';
#This query will return a count of all first names that do not have an a in them from the employees table. The result should be 118195. If for some reason an employee's first name was NULL, it would not be counted here.

#Using GROUP BY with Aggregate Functions
#We can combine our use of aggregate functions with the GROUP BY clause to produce more meaningful results.

#If we want to find out how many unique first names that do not contain an 'a', we know we can use a GROUP BY, but we can also combine this with the aggregate COUNT function to find how many employees have each unique last name:


SELECT first_name, COUNT(first_name)
FROM employees
WHERE first_name NOT LIKE '%a%'
GROUP BY first_name;
#This query will output each unique first name without an 'a', as well as the number of employees with that first name. Notice also that this query returns 500 results. While there are 118,195 employees with a first name that did not have the letter a, there are only 500 unique first names that do not have an 'a' in them.

#Take the query below as another example:


SELECT hire_date, COUNT(*)
FROM employees
GROUP BY hire_date
ORDER BY COUNT(*) DESC
LIMIT 10;
#This will show us the 10 most common hire dates for employees.

#The COUNT() function will be the one you used most frequently, but there are many others such as SUM(), AVG(), MIN() and MAX(). There are even functions that do statistical analysis like STDDEV() and VARIANCE(). Using aggregates can save a lot of tedious looping and arithmetic on your end.
