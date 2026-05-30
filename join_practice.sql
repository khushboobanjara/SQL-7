CREATE DATABASE join_practice;
USE join_practice;

-- Employees Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    salary INT,
    city VARCHAR(50),
    manager_id INT
);

-- Departments Table
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

-- Insert into departments
INSERT INTO departments VALUES
(1,'HR','Delhi'),
(2,'IT','Bangalore'),
(3,'Finance','Mumbai'),
(4,'Sales','Pune');

-- Insert into employees
INSERT INTO employees VALUES
(101,'Rahul',1,90000,'Delhi',NULL),
(102,'Aman',1,60000,'Mumbai',101),
(103,'Priya',2,50000,'Delhi',101),
(104,'Anjali',2,75000,'Jaipur',101),
(105,'Rohit',3,45000,'Mumbai',102),
(106,'Sneha',1,85000,'Delhi',101),
(107,'Karan',3,40000,'Pune',104),
(108,'Meera',2,95000,'Jaipur',104),
(109,'Vikas',4,70000,'Delhi',102),
(110,'Neha',4,30000,'Pune',104),
(111,'Arjun',1,65000,'Mumbai',101),
(112,'Simran',4,72000,'Delhi',109),
(113,'Tina',3,55000,'Jaipur',102),
(114,'Yash',2,100000,'Mumbai',104),
(115,'Pooja',3,48000,'Delhi',104);

select * from  employees;
select * from departments;

-- Show employee names with their department names.
select e.emp_name , d.dept_name from employees as e join departments as d
on e.dept_id = d.dept_id;

select*from employees;
select* from departments;

-- Show employee names and department locations.
select e.emp_name,d.location from employees as e join departments as d
on d.dept_id = e.dept_id;

-- Find employees working in IT department.
select e.emp_name, d.dept_name from employees as e join departments as d
on e.dept_id = d.dept_id where d.dept_name = 'IT';

-- Show employees whose department location is Mumbai.
select e.emp_name, d.location from employees as e join departments as d
on e.dept_id = d.dept_id where d.location = 'Mumbai';

-- Display employee name, salary, and department name.
select emp_name, e.salary, d.dept_name from employees as e join departments as d
on d.dept_id = e.dept_id;

-- Find employees earning more than 70000 with their department names.
select emp_name, e.salary, d.dept_name from employees as e join departments as d
on d.dept_id = e.dept_id where e.salary>70000;

-- Show all employees from HR department.
select e.emp_name,d.dept_name from employees as e join departments as d
on d.dept_id = e.dept_id where d.dept_name = 'HR';

-- Find employees whose city and department location are same.
select e.emp_name,e.city, d.location from employees as e join departments as d
on d.dept_id = e.dept_id where e.city = d.location;

-- Show department names along with employee count.
select d.dept_name, count(*) from employees as e join departments as d
on d.dept_id = e.dept_id group by d.dept_name;

-- Find total salary department wise with department names.
select d.dept_name,sum(salary) as total_salary from employees as e join departments as d
on d.dept_id = e.dept_id group by d.dept_name;

-- Show average salary of each department.
select d.dept_name,avg(salary) as avg_salary from employees as e join departments as d
on d.dept_id = e.dept_id group by d.dept_name;

-- Find highest salary in each department.
select d.dept_name,max(salary) as max_salary from employees as e join departments as d
on d.dept_id = e.dept_id group by d.dept_name;

-- Show employees working in departments located in Bangalore.
select emp_name, d.dept_name from employees as e join departments as d
on d.dept_id = e.dept_id where d.location = 'Bangalore';

-- Find employees whose department is Sales.
select emp_name, d.dept_name from employees as e join departments as d
on d.dept_id = e.dept_id where d.dept_name = 'Sales';

-- Show department names having more than 3 employees.
select d.dept_name,count(*) from employees as e join departments as d
on d.dept_id = e.dept_id group by d.dept_name having count(*)>3;

-- Show departments where average salary is greater than 60000.
select d.dept_name,avg(salary) from employees as e join departments as d
on d.dept_id = e.dept_id group by d.dept_name having avg(salary)>60000;

-- Show employee names along with their department locations.
select e.emp_name,d.location from employees as e join departments as d
on d.dept_id = e.dept_id;

-- Display employee name, department name, and city in ascending order of department name.
select e.emp_name,d.dept_name ,e.city from employees as e join departments as d
on d.dept_id = e.dept_id order by d.dept_name;

-- Find the number of employees working in each department location.
select d.dept_name,d.location ,count(*) from employees as e join departments as d
on d.dept_id = e.dept_id group by d.dept_name, d.location;

-- Show department names where at least one employee belongs to Jaipur city.
select distinct d.dept_name,e.city from employees as e join departments as d
on d.dept_id = e.dept_id where city= 'Jaipur';

-- Display employees belonging to departments whose location is Bangalore or Mumbai.
select e.emp_name from employees as e join departments as d
on d.dept_id = e.dept_id where d.location in ('Bangalore', 'Mumbai');

-- Show department names and the count of employees living in Delhi.
select d.dept_name,count(*) from employees as e join departments as d
on d.dept_id = e.dept_id where city = 'Delhi' group by d.dept_name ;

-- Find department-wise maximum salary along with department name.
select d.dept_name,min(salary) from employees as e join departments as d
on d.dept_id = e.dept_id group by d.dept_name ;
