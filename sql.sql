CREATE TABLE employees (
emp_id INT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR(100) NOT NULL,
department VARCHAR(50),
job_title VARCHAR(60),
salary DECIMAL(10,2),
hire_date DATE,
birth_date DATE,
phone VARCHAR(20),
city VARCHAR(50),
country VARCHAR(50),
is_active CHAR(1)
);
INSERT INTO employees VALUES
(1,  'Alice',  'Smith',    'alice.smith@gmail.com', 'IT',        'Software Engineer',    85000.00,'2019-03-15','1990-06-20','555-1001','New York',     'USA','Y'),
(2,  'Bob',    'Johnson',  'bob.j@yahoo.com',       'HR',        'HR Manager',           72000.00,'2020-07-01','1985-11-05','555-1002','Chicago',      'USA','Y'),
(3,  'Carol',  'Williams', 'carol.w@gmail.com',     'Finance',   'Accountant',           65000.00,'2018-01-10','1992-03-14','555-1003','Houston',      'USA','Y'),
(4,  'David',  'Brown',    'david.b@outlook.com',   'IT',        'DevOps Engineer',      90000.00,'2021-05-20','1988-09-25','555-1004','Los Angeles',  'USA','Y'),
(5,  'Emma',   'Jones',    'emma.j@gmail.com',      'Marketing', 'Marketing Lead',       78000.00,'2017-11-30','1991-07-08','555-1005','Phoenix',      'USA','Y'),
(6,  'Frank',  'Garcia',   'frank.g@yahoo.com',     'Sales',     'Sales Representative', 55000.00,'2022-02-14','1994-02-28','555-1006','Philadelphia', 'USA','N'),
(7,  'Grace',  'Martinez', 'grace.m@gmail.com',     'IT',        'QA Engineer',          68000.00,'2020-09-01','1993-12-01','555-1007','San Antonio',  'USA','Y'),
(8,  'Henry',  'Davis',    'henry.d@outlook.com',   'Finance',   'Financial Analyst',    76000.00,'2019-06-15','1989-04-17','555-1008','San Diego',    'USA','Y'),
(9,  'Isla',   'Wilson',   'isla.w@gmail.com',      'HR',        'Recruiter',            60000.00,'2021-10-05','1995-08-22','555-1009','Dallas',       'USA','Y'),
(10, 'Jack',   'Moore',    'jack.m@yahoo.com',      'Marketing', 'SEO Specialist',       58000.00,'2023-01-09','1997-01-15','555-1010','San Jose',     'USA','Y'),
(11, 'Karen',  'Taylor',   'karen.t@gmail.com',     'Sales',     'Sales Manager',        82000.00,'2016-04-20','1984-05-30','555-1011','Austin',       'USA','Y'),
(12, 'Liam',   'Anderson', 'liam.a@outlook.com',    'IT',        'Data Scientist',       95000.00,'2020-11-15','1987-10-10','555-1012','Jacksonville', 'USA','Y'),
(13, 'Mia',    'Thomas',   'mia.t@gmail.com',       'Finance',   'Tax Consultant',       71000.00,'2022-06-01','1993-06-15','555-1013','Columbus',     'USA','Y'),
(14, 'Noah',   'Jackson',  'noah.j@yahoo.com',      'IT',        'System Admin',         80000.00,'2018-08-25','1990-02-14','555-1014','Charlotte',    'USA','N'),
(15, 'Olivia', 'White',    'olivia.w@gmail.com',    'HR',        'HR Assistant',         50000.00,'2023-03-20','1998-09-05','555-1015','Indianapolis', 'USA','Y'),
(16, 'Paul',   'Harris',   'paul.h@outlook.com',    'Marketing', 'Content Writer',       52000.00,'2021-07-10','1996-11-20','555-1016','San Francisco','USA','Y'),
(17, 'Quinn',  'Clark',    'quinn.c@gmail.com',     'Sales',     'Sales Representative', 56000.00,'2022-09-15','1995-04-11','555-1017','Seattle',      'USA','Y'),
(18, 'Rachel', 'Lewis',    'rachel.l@yahoo.com',    'Finance',   'Budget Analyst',       73000.00,'2019-12-01','1991-01-30','555-1018','Denver',       'USA','Y'),
(19, 'Sam',    'Robinson', 'sam.r@gmail.com',       'IT',        'Cloud Architect',     105000.00,'2017-05-22','1986-07-19','555-1019','Nashville',    'USA','Y'),
(20, 'Tina',   'Walker',   'tina.w@outlook.com',    'HR',        'Training Manager',     69000.00,'2020-03-08','1988-12-03','555-1020','Baltimore',    'USA','Y'),
(21, 'Uma',    'Hall',     'uma.h@gmail.com',       'Marketing', 'Brand Manager',        77000.00,'2018-10-17','1990-08-25','555-1021','Louisville',   'USA','N'),
(22, 'Victor', 'Young',    'victor.y@yahoo.com',    'Sales',     'Sales Director',       98000.00,'2015-02-10','1980-03-07','555-1022','Portland',     'USA','Y');

select *from employees;

-- quation 
select emp_id,first_name,last_name, job_title, salary
from employees
where is_active='Y'
and department='IT';

 
-- 1 quastion 
select emp_id, first_name, last_name, department,salary
from employees
where salary between 65000 and 85000;

-- 2 quastion 
select * from employees 
where department='IT'or department = 'finance';

-- 3 quastion 
select *from employees 
where last_name like '%son'; 

-- 4 quastion 
select emp_id ,upper(first_name) as fisrt_name_upper, lower(last_name) as last_name_lower,salary
from employees 
where department='Finanece';

-- quastion 5
select emp_id ,first_name, length(first_name), department 
from employees
where length(first_name)>4;  

-- quastion 6 
select emp_id, concat(first_name,' ', last_name) as full_name, length(first_name)+ length(last_name) as full_name_length, department
 from employees
where department='Marketing';

-- quation 7
select emp_id, first_name, last_name, hire_date, year(hire_date) as hire_year, timestampdiff(year, hire_date,curdate()) as year_ago
from employees;

-- quation 8
select emp_id, first_name, last_name, salary, round(salary, -4), mod(salary,10000) as remainder 
from employees
where department='IT';

-- quation 9
select emp_id, first_name, last_name, email from employees
where email like '%outloo%';

-- quation 10
select emp_id, first_name, last_name, hire_date, datediff('2026-04-28', hire_date) as days_employeed
from employees
where datediff('2026-04-28', hire_date) > 2000 ;
s
-- quation 11
select emp_id, first_name, last_name, email, substring_index(email, '@',1) as username 
from employees
where department='HR';

-- quation 12
select first_name, department, salary 
from employees
where department not in ('IT','Finance') and salary not between 60000 and 80000;

-- quation 13
select emp_id, first_name, last_name, email, upper(substring_index(email, '@',1)) as username_upper, length(substring_index(email, '@',1))
as username_length
from employees;

-- quation 14
select emp_id, first_name, birth_date, timestampdiff(year, birth_date, curdate()) as age , salary, department
from employees
where is_active='Y'
and timestampdiff(year, birth_date, curdate()) between 30 and 38
and salary>65000;
 
 
select * from employees;
select salary from employees where department='Finance';

select sum(salary) from employees where department='Finance';

select sum(salary) , count(salary) from employees where department='IT';


-- group by is used to group similar values together  so we can perform operation
select department from employees group by department;

select department, count(department) from employees group by department;

select department, sum(salary), avg(salary) from  employees group by department;

select job_title , count(job_title)from employees group by job_title;

use sakila;
select * from payment;

-- from the total amount ammount and avg ammount , find the total transection done by cous_id 2 and 5
-- find the avg ammount spend 2005 

select sum(amount), avg(amount) from payment;

select customer_id , count(customer_id) from payment where customer_id=2 or customer_id=5;


-- find total transection done by each customer id
select customer_id , count(payment_id) from payment group by customer_id;  

-- now also get the totall trancsection and the total amount spend after customer id 3 
select customer_id, count(payment_id) from payment where customer_id>=3 group by customer_id;

use sakila;

CREATE TABLE sales (
    id INT PRIMARY KEY AUTO_INCREMENT,
    region VARCHAR(50),
    product VARCHAR(50),
    sales_person VARCHAR(50),
    amount DECIMAL(10,2),
    sale_date DATE
);

INSERT INTO sales (region, product, sales_person, amount, sale_date) VALUES
('North', 'Laptop', 'Amit', 55000, '2025-01-05'),
('North', 'Mobile', 'Amit', 20000, '2025-01-06'),
('South', 'Laptop', 'Ravi', 60000, '2025-01-07'),
('East', 'Tablet', 'Suman', 15000, '2025-01-08'),
('West', 'Laptop', 'Neha', 58000, '2025-01-09'),

('North', 'Tablet', 'Amit', 12000, '2025-01-10'),
('South', 'Mobile', 'Ravi', 22000, '2025-01-11'),
('East', 'Laptop', 'Suman', 50000, '2025-01-12'),
('West', 'Tablet', 'Neha', 14000, '2025-01-13'),
('North', 'Laptop', 'Amit', 57000, '2025-01-14'),

('South', 'Tablet', 'Ravi', 13000, '2025-01-15'),
('East', 'Mobile', 'Suman', 21000, '2025-01-16'),
('West', 'Laptop', 'Neha', 61000, '2025-01-17'),
('North', 'Mobile', 'Amit', 19000, '2025-01-18'),
('South', 'Laptop', 'Ravi', 62000, '2025-01-19'),

('East', 'Tablet', 'Suman', 16000, '2025-01-20'),
('West', 'Mobile', 'Neha', 23000, '2025-01-21'),
('North', 'Tablet', 'Amit', 11000, '2025-01-22'),
('South', 'Mobile', 'Ravi', 25000, '2025-01-23'),
('East', 'Laptop', 'Suman', 52000, '2025-01-24'),

('West', 'Tablet', 'Neha', 13500, '2025-01-25'),
('North', 'Laptop', 'Amit', 59000, '2025-01-26'),
('South', 'Tablet', 'Ravi', 12500, '2025-01-27'),
('East', 'Mobile', 'Suman', 20500, '2025-01-28'),
('West', 'Laptop', 'Neha', 60000, '2025-01-29'),

('North', 'Mobile', 'Amit', 21000, '2025-01-30'),
('South', 'Laptop', 'Ravi', 63000, '2025-01-31'),
('East', 'Tablet', 'Suman', 17000, '2025-02-01'),
('West', 'Mobile', 'Neha', 24000, '2025-02-02'),
('North', 'Tablet', 'Amit', 12500, '2025-02-03'),

('South', 'Mobile', 'Ravi', 26000, '2025-02-04'),
('East', 'Laptop', 'Suman', 54000, '2025-02-05'),
('West', 'Tablet', 'Neha', 15000, '2025-02-06'),
('North', 'Laptop', 'Amit', 61000, '2025-02-07'),
('South', 'Tablet', 'Ravi', 14000, '2025-02-08');
use sakila;
select * from sales;

-- total sales 
select sum(amount) as total from sales;

-- mobile total sales
select sum(amount) as mobile_total_sales from sales where product = 'Mobile';

--  quation 
select sum(amount), avg(amount)
from sales 
where region = 'North' and  (product = 'Mobile' or product = 'Laptop');

--


select max(amount), min(amount) 
from sales where month(sale_date)=2;

-- 1 
select region, sum(amount) from sales group by region;

-- 2
select sales_person, avg(amount) from sales group by sales_person;

-- 3
select product, sum(amount) as total_amount
from sales
where sales_person != 'amit'
group by product;
 
-- 4
select count(sales_person),sales_person from sales
 where amount>10000 group by sales_person;
 
-- 5
select sum(amount), avg(amount), max(amount), region , product 
from sales group by product, region ;

-- 6
select sum(amount) from sales 
where count(product) group by product; 

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID VARCHAR(50) NOT NULL,
    Category VARCHAR(50) CHECK (Category IN ('Electronics', 'Home', 'Apparel')),
    OrderDate DATE,
    OrderValue DECIMAL(10,2)
);
INSERT INTO Orders (OrderID, CustomerID, Category, OrderDate, OrderValue) VALUES
(1001, 'C201', 'Electronics', '2024-01-05', 12500),
(1002, 'C203', 'Apparel', '2024-01-07', 3200),
(1003, 'C205', 'Home', '2024-01-10', 5800),
(1004, 'C201', 'Electronics', '2024-01-15', 8900),
(1005, 'C207', 'Apparel', '2024-01-18', 2100),
(1006, 'C210', 'Home', '2024-01-22', 4700),
(1007, 'C203', 'Electronics', '2024-02-01', 15300),
(1008, 'C212', 'Apparel', '2024-02-05', 1800),
(1009, 'C205', 'Home', '2024-02-08', 6200),
(1010, 'C214', 'Electronics', '2024-02-12', 9400),
(1011, 'C207', 'Apparel', '2024-02-17', 2900),
(1012, 'C210', 'Electronics', '2024-02-20', 11000),
(1013, 'C212', 'Home', '2024-03-01', 3500),
(1014, 'C201', 'Apparel', '2024-03-05', 4100),
(1015, 'C214', 'Home', '2024-03-10', 7800);

select * from Orders;


-- 1
select sum(OrderValue), Category from Orders group by Category;

-- 2
select count(category) , Category from Orders group by Category;

-- 3
select Category ,max(OrderValue) from Orders group by Category;

-- 4
select distinct Category from orders; 

-- 5
select distinct CustomerId from orders;

-- 6
select distinct CustomerId, Category from orders;

-- 7
select Category, sum(OrderValue) from orders group by Category;

-- 8
select Category ,count(*) from orders group by Category;

-- 9
select Category, max(OrderValue) from orders group by category;

-- 10
select  Category,CustomerID, count(*) as order_count from orders group by category, CustomerID;

-- 11
select Category, month(orderdate) as Order_month, sum(OrderValue) as Total_revenue 
from orders
group by Category , month(orderdate);

-- 12
select Category, sum(ordervalue) as Total_revenue from orders
group by Category 
having sum(OrderValue)>20000 ;

-- 13
select Customez                                                                                                                                                                                                               0rID, count(*) as Order_count from orders
group by  CustomerID;

-- 14
select CustomerId , Category , sum(ordervalue) as Total_spent from orders
group by CustomerID, Category
having sum(ordervalue)>10000;

-- 15
select Category, count(*) as total_Orders, sum(ordervalue) as total_revenue, 
avg(ordervalue) as avg_order from orders
group by Category
having avg(OrderValue)>5000 ;

-- 16
select CustomerId, count(OrderID) as Order_count, round(avg(ordervalue),2) as avg_ordervalue 
from orders
group by CustomerID
having count(OrderID)>1 and avg(ordervalue)>6000;

-- 17 
select Category, month(orderdate), count(OrderId) as orders, sum(ordervalue) as total_revenue,
avg(ordervalue) as avg_ordervalue from orders
group by Category, month(OrderDate)
having count(OrderID)>1;

-- where cluse is used to filter data on your table where clause can not be apply agregation function 
use sakila;
select * from sales;  

-- having clause used to filter the agregate function having is used with group by 

-- find how many  sales are done by  each person 
select sales_person, count(*) from  sales group by sales_person having count(*)>8;

--  find the total transiction done by each person in the decreasing order

select sales_person ,sum(amount) from sales group by sales_person order by sum(amount) desc;


select sales_person, product , count(amount) from sales group by sales_person, product; 


select * from payment;

select year(payment_date), month(payment_date), sum(amount) from payment group by year(payment_date), month(payment_date);
 
 select sales_person from sales order by sales_person asc;
 
 select floor(avg(rental_id)) from payment;
 
 use sakila;
 select * from employees;
 
 -- if(condition, true statement, false statement)
 
 select first_name, department, salary, if(department='IT', True, False) from employees;
 
 select first_name, department, salary, if(department='IT',salary*1.1, salary*1.05) as salary_bonus
 from employees;
 
 select first_name, department, salary, if(department='IT',salary*1.1, if(department='HR', salary*1.05, salary) ) as salary_bonus
  from employees;
 
 /*
 select column1, column2
 case
     when condition then statement
 end
 from table_name
 
 */
 
 select first_name, department, salary,
 case
     when department='IT' then True
     else 'Non IT'
end  as new_salary 
from employees;
     
select first_name, department, salary,
 case
     when department='IT' or department='HR' then 'Category A'
     else 'Category B'
end  as new_salary 
from employees;

 select first_name, department, salary,
 case
     when department='IT' then salary*1.1
     when department = 'HR' then salary*1.05
     else salaryss
end  as bonus_salary 
from employees;

--  if the hiring date is an employees befor 2020 print the job title +seniar
--  if the year is 2021 then print association

select first_name, department, year(hire_date) ,
case
    when year(hire_date)< 2020 then concat('Seniar',' ',job_title)
    when year(hire_date)>2021 then 'Association'
    else job_title
end as new_job_title
from employees;
    
-- if salary >75000 creat three category name as avg salary , if salary is >85000 high salary , if salary is >100000 stream salary  other wise print the category name as low salary
select first_name,salary , department,
case
    when salary > 100000 then 'extream salary '
    when salary between 100000 and 850000 then 'high salary'

    when salary between 850000 and 750000 then 'average salary'
    
    else 'low salary' 
end as 'new'
    from employees;
    
-- select  the job title 

select job_title,count(job_title),
case
    when count(job_title)=1 then concat(job_title,'position have ', count(job_title), ' person')
	when count(job_title)=2 then concat(job_title,'position have ',count(job_title), ' persons')

end as empoyee_count
from employees  group by job_title;
  




