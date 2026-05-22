-- Display all employee records. 
select * from employees;

-- Show only employee names and salaries.
select first_name, salary from employees ;

-- Find employees whose salary is greater than 50000.
select * from employees where salary > 50000;

-- Display employees from New York.
select * from employees where city = 'New York';

-- Show employees whose department is HR.
select * from employees where department = 'HR';

-- Find employees with salary between 30000 and 70000.
select * from employees where salary between 30000 and 70000;

-- Display unique department names.
select Distinct department from employees;

-- Show employees whose name starts with A.
select * from employees where first_name like 'A%';

-- Find employees whose city is either Mumbai or Pune.
select * from employees where city in ('Mumbai', 'Pune'); 

-- Display employees whose salary is NULL.
select * from employees where salary is null;

-- Display employees sorted by salary in ascending order.
select * from employees order by salary;

-- Sort employees by salary in descending order.
select* from employees order by salary desc;

-- Display employees sorted first by department, then by salary.
select * from employees order by department , salary;

-- Show top 5 highest-paid employees.
select * from employees order by salary desc limit 5;   

-- Show the employee with the lowest salary.
select * from employees order by salary asc;

-- Count total employees in each department.
select department, count(*) from employees group by department ;

-- Find average salary department-wise.
select department, avg(salary) from employees group  by department ;

-- Count employees city-wise.
select city, count(*) from employees group by city;

-- Find departments having more than 5 employees.
select department, count(*) from employees
group by department having count(*) > 5;   

-- Find average salary greater than 60000 department-wise.
select department , avg(salary) from employees group by department 
having avg(salary)>60000;  

-- Display employee name with department name.
select emp.emp_name, dept.dept_name 
from employees as emp
join departments as dept
on emp.dept_id= dept.dept_id;

-- Show all employees even if department is missing.
select emp.emp_name , dept.dept_name 
from employees as emp
left join departments as dept
on dept.dept_id = emp.dept_id; 

-- Show all departments even if no employee exists.
select emp.emp_name , dept.dept_name 
from employees as emp 
right join departments as dept
on dept.dept_id = emp.dept_id; 

-- Find employees working in IT department.
select emp.emp_name , dept.dept_name from employees as emp
join departments as dept on dept.dept_id = emp.dept_id
where dept.dept_name = 'IT';  

-- Display total employees in each department.
select dept.dept_name, count(*) as total_emp from employees as emp
join departments as dept on dept.dept_id = emp.dept_id
group by dept.dept_name; 

-- Find employees earning more than department average salary.
select salary from employees where salary> (select avg(salary) from employees );

-- Show employee name, department name, and salary.
select emp.emp_name, dept.dept_name, emp.salary from employees as emp
join departments as dept on dept.dept_id = emp.dept_id;

-- Find departments with no employees.
select dept.dept_name, emp.emp_name from employees as emp 
right join departments as dept on dept.dept_id = emp.dept_id;    

-- Find employees earning more than average salary.
select avg(salary) from employees ;

select * from employees where salary>
     (select avg(salary) from employees);
     
-- Find second highest salary.
select max(salary)  from employees;      -- first highest salary nikalta hai 

select max(salary) from employees where salary<       -- first highest se choti or baki emp se badi salary nikal kr dega 
    (select max(salary) from employees);

-- Find employees working in the same department as Rahul.

select department from employees where first_name = 'Alice';

select * from employees where department = 
     (select department from employees where first_name = 'Alice');
     
-- Find highest salary in each department.
select department , max(salary) from employees group by department;
      
-- Find employees who earn the maximum salary.
select max(salary) from employees ;

select * from employees where  salary = 
    (select max(salary) from employees) ;
    
-- Find departments whose average salary is greater than overall average salary.
select avg(salary) from employees ;

select department, avg(salary) from employees group by department having avg(salary) > 
     (select avg(salary) from employees);
     
-- Find employees who are not working in HR.
select * from employees where department not in ('HR');
select * from employees;

-- Find third highest salary.
select max(salary) from employees where salary < 
    (select max(salary) from employees where salary < (select max(salary) from employees )) ;

-- Find employees whose salary is equal to minimum salary.

select * from employees where salary = 
     (select min(salary) from employees);
     
-- Find departments having highest number of employees.

-- Find duplicate employee names.
select first_name, count(*) from employees group by first_name
having count(*)>1;
select * from employees;

-- Find employees hired in last 30 days.
select emp_id, first_name,current_date() - interval 30 day from employees
where current_date() - interval 30 day;

-- Find employees with highest salary in each city.
select max(salary) from employees ;

select * from employees 
where  salary In ( select max(salary) from employees group by city);

use joindb;
select * from customers;
select * from orders;
select * from restaurants;

-- 1. Find customer name and restaurant name for every order. 
select c.customer_name, r.restaurant_name from customers as c
join orders as o on c.customer_id = o.customer_id
join restaurants as r on r.restaurant_id = o.restaurant_id;

-- 2. Find customers who paid using UPI.
select c.customer_name, o.payment_method from customers as c  
join orders as o on o.customer_id = c.customer_id

-- 4. Add one customer with no orders and find all customers with their order ids.

where o.payment_method = 'UPI';