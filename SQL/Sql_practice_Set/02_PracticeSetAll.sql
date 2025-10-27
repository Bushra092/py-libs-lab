-- ## **Basic LIMIT / ORDER BY**

-- . List the first 5 employees ordered by `emp_id` ascending.
select * from hr order by emp_id asc limit 5;

-- . Show the 10 most recently hired employees (`hire_date` descending).
select * from hr order by hire_date desc limit 10;


-- . Display the top 3 oldest employees (`age` descending).
select * from hr order by age desc limit 3;

select * from hr;

-- ### **LIMIT with OFFSET (Pagination)**

-- . Show employees 6–10 ordered by `emp_id`.
select * from hr limit 5 offset 5 ;

-- . Paginate employees in the HR department, 2 per page, page 2.
select * from hr ;

-- . Display employees 11–20 ordered by `hire_date` ascending.
select * from hr order by hire_date asc limit 10 offset 10;


-- ### **ORDER BY with Multiple Columns**

-- . List employees ordered first by `department` ascending, then by `age` descending, limit 10.
select * from hr order by department asc, age desc limit 10;

-- . Show employees ordered by `location_state` ascending and `hire_date` descending, limit 15.
select * from hr order by location_city asc, hire_date desc limit 15;


-- ### **Conditional + Pagination**

-- . List employees in IT or Sales departments, ordered by `hire_date` descending, limit 5, offset 5.
select * from hr
 where department in ('Sales','Engineering') 
order by hire_date asc limit 5 offset 5;

select * from hr;
-- . Show employees whose first name starts with “A” or “B”, ordered by `last_name` ascending, limit 5.
select * from hr
where first_name like 'A%' or  first_name like 'B%'
order by last_name asc limit 5;


-- ### **BONUS Challenge**

-- 11. Paginate employees by `department` with 3 per page:

-- * Page 1: `LIMIT 3 OFFSET 0`
select * from hr order by department limit 3 offset 0;

-- * Page 2: `LIMIT 3 OFFSET 3`
select * from hr order by department limit 3 offset 3;

-- * Page 3: `LIMIT 3 OFFSET 6`
select * from hr order by department limit 3 offset 6;

-- . List active employees (`termdate IS NULL`) ordered by `age` ascending, limit 5, offset 5.
SET sql_mode = '';
ALTER TABLE hr MODIFY termdate VARCHAR(20);


UPDATE hr
SET termdate = NULL
WHERE termdate = '0000-00-00';

ALTER TABLE hr MODIFY termdate DATE;
select count(*) from hr where termdate is null;

select * from hr where termdate is null order by age asc limit 5 offset 5; 