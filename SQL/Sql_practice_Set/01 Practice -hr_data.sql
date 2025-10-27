-- SQL Practice Assignment – HR Dataset
SELECT * FROM hr;

-- 1. Filter by Specific Departments (IN)
-- List first_name, last_name, and department of employees who work in 'Human Resources','Engineering',Sales, IT, or HR.
select first_name, last_name, department
 FROM hr
where department in ('Sales','IT', 'HR');
-- where department in ('Human Resources','Engineering');


-- 2. Filter by Multiple States (IN)
-- List emp_id, first_name, location_state for employees located in 'Youngstown','Akron','Canton'
select emp_id, first_name, location_city
FROM hr
where location_city in ('Youngstown','Akron','Canton');

-- 3. Filter by Age Range (BETWEEN)
-- List first_name, last_name, and age of employees between 25 and 35 years old.
select first_name, last_name,  age
FROM hr
where age between 25 and 35;

-- 4. Filter by Hire Date Range (BETWEEN)
-- List first_name, last_name, and hire_date of employees hired between 2018-01-01 and 2022-12-31.
select first_name, last_name, hire_date
from hr
where hire_date between '2018-01-01' and '2022-12-31' ;

-- 5. Name Pattern Matching (LIKE)
-- List first_name and last_name of employees whose first_name starts with “A”.
select first_name, last_name
from hr
where first_name like "A%" ;

-- 6. Job Title Pattern (LIKE)
-- List first_name, last_name, and jobtitle of employees whose job titles contain “Manager”.
SELECT first_name, last_name, jobtitle 
from hr
where jobtitle like "%Manager%";

-- 7. Check for Missing Termination Dates (IS NULL)
-- List first_name, last_name, department of employees who are still active (termdate is NULL).
update hr
set termdate = null
where termdate =  '0000-00-00';

select first_name, last_name, department
from hr
where termdate is null OR termdate = CAST('0000-00-00' AS DATE);

-- 8. Check for Missing Birthdates or Race (IS NULL)
-- List emp_id, first_name, last_name where birthdate or race is missing (NULL).
select emp_id, first_name, last_name
from hr
where age is null  OR race IS NULL;


-- 9. Combine Filters (IN + BETWEEN + LIKE + IS NULL)

-- List emp_id, first_name, department, age of employees who:
-- Are in HR or IT ['Human Resources', 'Engineering']
-- Age between 25 and 40
-- First name starts with “A”
-- Are still active (termdate IS NULL)
select emp_id, first_name, department, age ,termdate
From hr
where department in('Human Resources', 'Engineering')
and age between 25 and 40
and first_name like 'A%';

-- 10. Combine Multiple Filters with States
-- List first_name, last_name, location_city, location_state for employees:
-- Located in CA, TX, or NY (IN)
-- Hired between 2019-01-01 and 2023-01-01 (BETWEEN)
-- Job title contains “Analyst” (LIKE)
-- Active employees (termdate IS NULL)
select first_name, last_name, location_city, location_state, termdate
From hr
where hire_date between '2019-01-01' and '2023-01-01'
and jobtitle like '%Analyst%' 
and location_city in('Youngstown','Akron')
limit 1;