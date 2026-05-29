CREATE DATABASE company_db;
USE company_db;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    city VARCHAR(50),
    manager_id INT,
    hire_date DATE
);

INSERT INTO employees VALUES
(101,'Rahul','HR',90000,'Delhi',NULL,'2020-01-10'),
(102,'Aman','HR',60000,'Mumbai',101,'2021-03-15'),
(103,'Priya','IT',50000,'Delhi',101,'2022-05-20'),
(104,'Anjali','IT',75000,'Jaipur',101,'2021-07-18'),
(105,'Rohit','Finance',45000,'Mumbai',102,'2023-02-11'),
(106,'Sneha','HR',85000,'Delhi',101,'2020-09-25'),
(107,'Karan','Finance',40000,'Pune',104,'2022-01-30'),
(108,'Meera','IT',95000,'Jaipur',104,'2019-11-14'),
(109,'Vikas','Sales',70000,'Delhi',102,'2021-12-05'),
(110,'Neha','Sales',30000,'Pune',104,'2023-06-22'),
(111,'Arjun','HR',65000,'Mumbai',101,'2020-08-19'),
(112,'Simran','Sales',72000,'Delhi',109,'2022-10-01'),
(113,'Tina','Finance',55000,'Jaipur',102,'2021-04-12'),
(114,'Yash','IT',100000,'Mumbai',104,'2018-03-17'),
(115,'Pooja','Finance',48000,'Delhi',104,'2023-01-08');

-- 1. Find total salary department wise.
select department, sum(salary) as total_salary from employees group by department;

-- 2. Find average salary department wise.
select department, avg(salary) as avg_salary from employees group by department;

-- 3. Find maximum salary department wise.
select department, max(salary) as min_salary from employees group by department;

-- 4. Find minimum salary department wise.
select department, min(salary) as min_salary from employees group by department;

-- 5. Count employees in each department.
select department, count(emp_id) as total_emp from employees group by department;

-- 6. Show departments having more than 2 employees.
select department, count(*) as total_emp from employees group by department 
having count(*)>2;

-- 7. Show departments where average salary is greater than 60000.
select department, avg(salary) as avg_salary from employees group by department
having avg(salary)>60000;

-- 8. Find cities having more than 2 employees.
select city, count(*) from employees group by city having count(*)>2;

-- 9. Find cities where total salary exceeds 150000.
select city, sum(salary) from employees group by city having sum(salary)>150000;

-- 10. Show cities where average salary is less than 55000.
select city, avg(salary) from employees group by city having avg(salary)<55000;

-- 11. Find managers handling more than 2 employees.
select manager_id, count(*) as number_of_emp from employees group by manager_id having count(*)>2;

-- 12. Show managers whose team salary exceeds 200000.
select manager_id, sum(salary) as team_salary from employees group by manager_id having sum(salary)>200000;

-- 13. Find departments where maximum salary is above 90000.
select department,max(salary) from employees group by department having max(salary)>90000;

-- 14. Show departments where minimum salary is below 40000.
select department,min(salary) from employees group by department having min(salary)<40000;

-- 15. Find departments having exactly 2 employees.
select department, count(*) from employees group by department having count(*)=2;

-- 16. Show cities where employee count is exactly 3.
select city, count(*) from employees group by city having count(*)=3;

-- 17. Find departments where total salary is greater than 180000.
select department, sum(salary) from employees group by department having sum(salary)>180000;

-- 18 Show departments where average salary is between 50000 and 80000.
select department, avg(salary) from employees group by department having avg(salary) between 50000 and 80000;

-- 19. Find cities where highest salary is above 85000.
select city, max(salary) from employees group by city having max(salary)>85000;

-- 20. Show managers whose team average salary is above 65000.
select manager_id, avg(salary) as team_avg from employees group by manager_id having avg(salary)>65000;

-- 21. Find departments where salary difference (MAX(salary)-MIN(salary)) is greater than 30000.
select department  from employees group by department having  (MAX(salary)-MIN(salary))>30000;

-- 22. Show hire years having more than 2 employees.
select year(hire_date),count(*) from employees group by year(hire_date) having count(*)>2;

-- 23. Find hire years where average salary is above 60000.
select year(hire_date),avg(salary) from employees group by year(hire_date) having AVG(salary)>60000;

-- 24. Show cities where total salary is less than 100000.
select city, SUM(salary) from employees group by city having SUM(salary)<100000;

-- 25. Find departments where all employees earn above 45000.
select department from employees group by department having min(salary)>45000;
