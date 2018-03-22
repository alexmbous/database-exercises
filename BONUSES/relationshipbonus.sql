USE employees;
-- ================================= RELATIONSHIP DRILLS

-- concat the max salaries of the first two employees
SELECT salary , CONCAT( first_name,' ', last_name)
FROM employees AS e
LIMIT 2;

-- get current manager name of Sales department (use subqueries)


-- get all senior engineers in customer service department


-- get all first and last names of current Sales department employees


-- get the name of the employee with the highest salary



-- ================================= RELATIONSHIP BONUSES

-- what is the most common birthday in the company? least common?



-- what is the average salary of managers by department?



-- how many employees currently work in each department?



-- what is the average salary for each department?



-- what was the average salary in the 80s? By department?



-- how many times (on average) do employees switch titles?



-- how many times (on average) do employees get a raise?



-- what is the highest paying job title historically for women and men? For women only? For men only?



-- does the older halve of current employees make more or less than the younger halve?



-- list the oldest current employees by title in each department



-- list the 5 historically lowest paid managers




-- EXTRA HARD BONUS --

-- what employees were hired during the year Nevermind was released and after?


-- (you will need to use the codeup_test_db and employees db)
