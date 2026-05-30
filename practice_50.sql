use datatypedb;
-- Department Table
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);
-- Departments
INSERT INTO departments VALUES
(1,'IT'),
(2,'HR'),
(3,'Sales'),
(4,'Finance');

-- Employees Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT,
    city VARCHAR(50),
    dept_id INT,
    hire_date DATE,
    
    FOREIGN KEY (dept_id)
    REFERENCES departments(dept_id)
);
-- Employees
INSERT INTO employees VALUES
(101,'Rahul',70000,'Delhi',1,'2026-05-01'),
(102,'Aman',50000,'Mumbai',2,'2026-04-15'),
(103,'Anjali',80000,'Delhi',1,'2026-03-10'),
(104,'Priya',45000,'Jaipur',3,'2026-05-20'),
(105,'Rohit',90000,'Delhi',4,'2026-02-01'),
(106,'Aakash',60000,'Pune',1,'2026-05-25');


-- Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);
-- Customers
INSERT INTO customers VALUES
(1,'Raj','Delhi'),
(2,'Neha','Mumbai'),
(3,'Amit','Jaipur');


-- Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_amount DECIMAL(10,2),
    order_date DATE,
    
    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);

-- Orders
INSERT INTO orders VALUES
(201,1,1500,'2026-05-10'),
(202,1,2500,'2026-05-15'),
(203,2,3000,'2026-05-20'),
(204,3,4500,'2026-05-25');

select * from customers;
select * from orders;
select* from departments;
select * from employees;
