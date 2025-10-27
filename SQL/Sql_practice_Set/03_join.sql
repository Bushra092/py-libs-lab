-- **Combining Tables**

-- **INNER JOIN** – return matching rows only
-- **LEFT JOIN** – return all rows from left table + matching from right
-- **RIGHT JOIN** – return all rows from right table + matching from left
-- **FULL OUTER JOIN** – combine all rows
-- **Multiple Joins** – join more than 2 tables


-- Data set ib MySQL80 -> `sql_prac_ai`
-- Table Creation 
CREATE TABLE employees (
  emp_id INT,
  emp_name VARCHAR(50),
  dept_id INT,
  city_id INT
);

INSERT INTO employees VALUES
(1, 'Aisha', 101, 1),
(2, 'Rahul', 102, 2),
(3, 'Fatima', 103, 3),
(4, 'John', NULL, 2),
(5, 'Sneha', 104, NULL);

CREATE TABLE departments (
  dept_id INT,
  dept_name VARCHAR(50)
);

INSERT INTO departments VALUES
(101, 'HR'),
(102, 'Finance'),
(103, 'IT'),
(105, 'Marketing');

CREATE TABLE cities (
  city_id INT,
  city_name VARCHAR(50)
);

INSERT INTO cities VALUES
(1, 'Mumbai'),
(2, 'Delhi'),
(3, 'Pune'),
(4, 'Chennai');


CREATE TABLE projects (
  proj_id INT,
  emp_id INT,
  proj_name VARCHAR(50)
);

INSERT INTO projects VALUES
(1, 1, 'HR Dashboard'),
(2, 2, 'Budget Tracker'),
(3, 3, 'Website Revamp');


-- ________________________ 7. Practice Questions ________________________
select * from employees;
select * from departments;
select * from cities;

-- INNER JOIN
-- Show employee names and their department names.
select * from employees e
inner join departments d on e.dept_id = d.dept_id;

-- Show employee names and city names where both match.
select * from employees e
inner join cities c on e.city_id = c.city_id;

-- LEFT JOIN
-- Show all employees and their department names, even if not assigned.
select * from employees e
left join departments d on e.dept_id = d.dept_id;

-- Show all employees and their city names, even if city_id is NULL.
select * from employees e
left join cities c on e.city_id = c.city_id;

-- RIGHT JOIN
-- Show all departments and employees (if any).
select * from employees e
right join departments d on d.dept_id = e.dept_id; 

-- Show all cities and employees living there (if any).
select * from employees e
right join cities c on e.city_id = c.city_id;

-- FULL OUTER JOIN not exist in mysql (use left UNION right )
-- FULL OUTER JOIN = LEFT JOIN + RIGHT JOIN
-- Combine employees and departments to see all from both sides.
select * from employees e
left join departments d on e.dept_id = d.dept_id
union
select * from employees e
right join departments d on e.dept_id = d.dept_id;

-- Combine employees and cities showing full data.
select * from employees e
left join cities c on e.city_id = c.city_id
UNION
select * from employees e
right join cities c on e.city_id = c.city_id;

-- MULTIPLE JOINS
-- Show employee name, department name, and city name together.
select emp_name, dept_name, city_name
from employees e 
join departments d on e.dept_id=d.dept_id
join cities c on c.city_id = e.city_id;

-- Show only those employees who have both department and city details.
-- Same as above

-- Show All employee name, department name, and city name together.
select emp_name, dept_name, city_name
from employees e 
left join departments d on e.dept_id=d.dept_id
left join cities c on c.city_id = e.city_id;


-- 📘 Next Step (Practice Challenge)

-- Then write:
-- Show employee name, project name, and department name.
-- Show all employees even if they have no project.
-- Show all projects, even if no employee is assigned.
-- Show all employees, projects, and departments together.
