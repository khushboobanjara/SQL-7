create database const_db;

select database();

use const_db;

-- DDL (Data Defination Language) create

create table test1( id int, age int );

create table if not exists test1( id int, age int );

-- DML(Data Manipulation Language) insert
insert into test1 values(101, 32), (102,null), (101,23);

select * from test1;
drop table test2;

-- constaits are the rules which are applied to the table column to prevent invalid data entry 

-- Not Null Constraint
create table test2( id int, age int not null );
insert into test2 values (101, 32);
insert into test2 values (102,null);
select * from test2;

-- Unique Constraint
create table test3( id int unique, age int not null);
insert into test3 values (101, 32);
insert into test3 values (101,13);

-- Default Constraint
create table if not exists test4( id int default 100, age int );
insert into test4(age) values(20);
select * from test4;

create table if not exists test5( id int primary key, age int );
insert into test5 values(80,22);
select * from test5;

-- primary key(Composite key) Constraint
create table if not exists test6( id int, age int, salary int,primary key(id,age) );
insert into test6 values(1,22,500000),(2,40,20000),(1,51, 600000),(3,50,1000);
select * from test6;
desc test6;

-- Check Constraint
create table if not exists test7( id int, age int check(age>18) );
insert into test7 values(1,51),(3,50);
insert into test7 values(1,15),(3,50);
select * from test7;

-- Foreign Key Constraint
create table student(id int, name varchar(20),cname varchar(20),
foreign key (cname) references sclass(cname));
insert into student values(1,'Naina','10'),(2,'abhi',10);

create table class(cname varchar(20) primary key);
insert into class values(10),(8),(9);

select * from class;
select * from student;
-- DCL(Data Control Language)

drop table class;