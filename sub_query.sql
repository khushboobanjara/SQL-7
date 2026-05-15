--  sub is a the type of query where 
-- this query is also called as nested query
-- jo quetion sabse phle aata h vo inner query me hota h  
-- inner query execute first

create database shadidb;

use shadidb;

create table biodata(id int , name varchar(20), age int);

insert into biodata values(1,'rahul', 28),(2,'anjali',28),(3, 'aishvariya', 40),(4,'naina', 23);

select * from biodata;

select  age from biodata where name='rahul';

select * from biodata where age=28;

select * from biodata where age = (
select  age from biodata where name='rahul');

select max(age) from biodata;

select * from biodata where age = 40;

select * from biodata where age = 
(select max(age) from biodata);

select * from biodata where age = 
(select min(age) from biodata); 

select char_length(name) from biodata where name = 'rahul';

select name from biodata where char_length(name)=5;

select name from biodata where char_length(name)=(
select char_length(name) from biodata where name = 'rahul');

-- type of sub query 
-- single row subquery-> in which  query return only one on group 

use sakila;
select * from film;

-- find the movie name where the rental rate is same for the movie of african egg

select rental_rate from film;

select title from film;

select title, rental_rate from film where rental_rate = 2.99;

select title, rental_rate from film where rental_rate = (
select rental_rate from film where title = 'African Egg');



-- get the movie_id and the movie_name where the rantel_rate is equal to minimum rantal rate
select min(rental_rate) from film;

select film_id , title from film where rental_rate = 0.99;

select film_id , title from film where rental_rate = (select min(rental_rate) from film);

-- get the film_id film_name and duration where the duration is greater than average duration of the movie

select avg(rental_duration) from film;

select film_id, title from film where rental_duration=4.9850;

select film_id, title from film where rental_duration>
(select avg(rental_duration) from film);

-- get the movie id for the movies where the relise year of the movie should be equal to the movie 'alone trip' and the rating shuld be same as of movie 'apollo team'

select rating from film where title = 'alone trip';

select release_year from film;

select * from film where release_year = (select release_year from film where title = 'Alone Trip')
and rating = (select rating from film where title = 'Apollo Team');

-- in multi row sub query if it returns more than 1 row 

use shadidb;
select * from biodata;

select age from biodata where name = 'Anjali' or name = 'Aishvariya';

select * from biodata where  age in ( select age from biodata where name = 'Anjali' or name = 'Aishvariya')
and name!='Rahul';

-- i need to find the name whre the age is not equal to age of anjali and aishvariya 
select * from biodata where  age not in ( select age from biodata where name = 'Anjali' or name = 'Aishvariya')
and name!='Rahul';

-- Create Table
CREATE TABLE Employees (
EMP_ID INT PRIMARY KEY,
NAME VARCHAR(50),
DEPARTMENT VARCHAR(50),
SALARY INT,
MANAGER_ID INT
);
-- Insert Data
INSERT INTO Employees (EMP_ID, NAME, DEPARTMENT, SALARY, MANAGER_ID) VALUES
(101, 'Alice', 'HR', 50000, NULL),
(102, 'Bob', 'IT', 80000, 101),
(103, 'Charlie', 'IT', 75000, 101),
(104, 'Diana', 'Finance', 90000, NULL),
(105, 'Eve', 'HR', 48000, 101),
(106, 'Frank', 'Finance', 95000, 104),
(107, 'Grace', 'IT', 82000, 101);

select * from employees;

select avg(salary) from employees;

select * from employees where salary> (select avg(salary) from employees);

select max(salary) from employees;

select * from employees where salary=( select max(salary)  from employees);

select salary from employees where emp_id = 101;

select * from employees where salary>50000;
select * from employees where salary>(select salary from employees where emp_id = 101);

select min(salary) from employees;

select department from employees where salary=48000;

select * from employees where salary = (select min(salary) from employees);

-- Multi row sub query in multy row sub query multiple rows but one column

select salary from employees where name ='Alice' or name= 'Bob';

select department from employees where salary =50000 or salary = 80000;

select * from employees where department in ( select department  from employees where name ='Alice' or name= 'Bob');


select salary from employees where emp_id=103 or emp_id= 105;

select * from employees where salary not in (select salary from employees where emp_id=103 or emp_id= 105);

-- any operator 

select * from employees where salary> any (select salary from employees where emp_id=103 or emp_id= 107);

select * from employees where salary <any (select salary from employees where emp_id=103 or emp_id= 107);

select * from employees where department = 'HR';

select * from employees where salary > 48000;

select * from employees where salary > any (select salary from employees where department = 'HR');


select * from employees where salary > all (select salary from employees where department = 'HR');

select * from employees where department = 'IT';

select * from employees where salary > all (select salary from employees where department = 'IT');

-- find the employee detail who works in it department and have salary of < salary of 101
-- find the name of a person whoses salary is greater than all the salary of HR or IT department
-- find the find the employee id and the emp_name of the user whose salary is greater than the salary any employees working annder 101
-- find the secod highest salary from the employees

select salary from employees where emp_id = 101  ;

select * from employees where department = 'IT' and salary > any (select salary from employees where emp_id = 101);

select salary from employees where department= 'IT' or department = 'HR';

select * from employees where salary > all (select salary from employees where department= 'IT' or department = 'HR');

select salary from employees where manager_id = 101;

select * from employees where salary > any (select salary from  employees where manager_id = 101);

select max(salary) from employees;

select max(salary) from employees where salary < any(select max(salary) from employees);
select * from employees;
select max(salary) from employees where salary < (select max(salary) from employees);

-- Create Department Table
CREATE TABLE Departments (
    DEPT_ID INT PRIMARY KEY,
    DEPT_NAME VARCHAR(50),
    LOCATION VARCHAR(50)
);

-- Insert Data into Departments Table
INSERT INTO Departments (DEPT_ID, DEPT_NAME, LOCATION) VALUES
(10, 'HR', 'Mumbai'),
(20, 'IT', 'Bangalore'),
(30, 'Finance', 'Delhi');

select * from employees;
select * from departments;

-- when nested query executed more then one time this is called correlated sub query
-- it is also called as

-- corelated sub is a type of sub query where the inner query executed for each value of the outer query
-- inner query also refer to the column of outer query
-- Find employees who work in departments located in Bangalore or Delhi.

select dept_name from departments where location in ('Bangalore','Delhi');

select * from employees where department = any(
    select dept_name from departments where location = 'Bangalore' or location = 'Delhi');

select * from employees where department = any(
    select dept_name from departments where location in ( 'Bangalore' ,'Delhi'));
    
select * from employees where department = 'HR';

select * from employees as e where salary >(
    select avg(salary) from employees where department = e.department);
    
select * from employees;

select max(salary) from employees where department = 'IT';

select * from employees as e where salary =  (
select max(salary) from employees where department = e.department);

select sum(salary) from employees group by department;

select * from employees where department ='IT'; 

select * from employees as e where 70000 <= all(
    select salary from employees where department =e.department)