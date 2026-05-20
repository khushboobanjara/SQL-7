-- window function perform a calculation on multiple rows and gives the calculated output

use shadidb;

select * from employees;

select avg(salary) from employees;

select   emp_id, name, salary, avg(salary)  over() from employees;

select   emp_id, name, salary, max(salary)  over(), avg(salary) over() from employees;

select   emp_id, name, salary, max(salary)  over(), avg(salary) over() , salary- avg(salary)  over() as diff from employees;

select  emp_id, name, count(*) over(), 
max(salary) over(), min(salary) over() , avg(salary) over(), 
sum(salary) over(),
concat( round((salary/sum(salary) over()) *100 ),'%')  from employees;

select emp_id, name, salary, sum(salary) over(order by salary) from employees;

-- partition by
-- it is used to combine similar values
use shadidb;
select *, sum(salary) over(partition by department) , sum(salary) over() from employees;

select *, sum(salary) over(partition by name) , sum(salary) over() from employees;

select *, sum(salary) over(partition by manager_id) , sum(salary) over() from employees;

select *, sum(salary) over(partition by department order by salary) , sum(salary) over() from employees;

select name,department, salary, sum(salary) over(partition by department), 
(salary /sum(salary) over(partition by department))*100 from employees;


create database windowsdb;
use windowsdb;
drop database windowsdb;

-- ============================================
--  Create the employees table
-- ============================================
CREATE TABLE employees (
  emp_id    INT,
  name      VARCHAR(50),
  dept      VARCHAR(30),
  salary    INT,
  hire_year INT
);
 
-- ============================================
--  Insert sample data (12 employees)
-- ============================================
INSERT INTO employees VALUES
  (1,  'Alice',   'IT',      90000, 2019),
  (2,  'Bob',     'IT',      75000, 2020),
  (3,  'Charlie', 'IT',      82000, 2018),
  (4,  'Diana',   'HR',      68000, 2021),
  (5,  'Eve',     'HR',      72000, 2019),
  (6,  'Frank',   'HR',      65000, 2022),
  (7,  'Grace',   'Sales',   55000, 2020),
  (8,  'Henry',   'Sales',   60000, 2021),
  (9,  'Iris',    'Sales',   58000, 2021),
  (10, 'Jack',    'Finance', 95000, 2017),
  (11, 'Karen',   'Finance', 88000, 2018),
  (12, 'Leo',     'Finance', 91000, 2020);

select * from employees;

select *, sum(salary) over(partition by hire_year) from employees;

select *, sum(salary) over(partition by hire_year order by salary) from employees;

select *, sum(salary) over(partition by dept order by hire_year) from employees;

select * , avg(salary) over (partition by dept),
case
    when salary >avg(salary) over(partition by dept) then 'Above avg salary'
    else 'less than eng salary'
    end as messege
from employees;

-- window function 
-- 1. row number

select *, row_number() over() from employees;

select *, row_number() over(order by salary) from employees;

select *, row_number() over(order by emp_id) from employees;

select *, row_number() over(partition by dept) from employees;

-- 2. rank()

select *, rank() over() from employees;

select *, rank() over(order by salary desc) from employees;

select *, rank() over(partition by dept order by salary desc) from employees;

select *, dense_rank() over(order by salary) from employees ;

select *, rank() over(partition by dept order by salary) from employees;/


 
 select* from employees as e where salary = (select max(salary) from employees where dept = e.dept);
 
 -- max
 select * from 
 (select * , max(salary) over(partition by dept) as deptSalary from employees) as trh
 where salary=deptSalary;
 
 select * from 
(select * , rank() over(partition by dept order by salary desc) as rnk from employees) as temp
where rnk = 1;


-- second highest , second lowest 
select * from 
(select * , dense_rank() over(order by salary desc) as rnk1 from employees ) as t
where rnk1=2;


-- 4th lowest salary 
select * from 
(select * , dense_rank() over(order by salary) as rnk1 from employees ) as t
where rnk1=4;

select min(salary) from employees;
select *, dense_rank() over(order by salary asc)  from employees;