use datatypedb;
-- DDL 
create table test8(id int, name varchar(30));
insert into test8 values(1,'abhi'), (2,'khushi');
select * from test8;

-- Truncate
truncate test8;   -- Truncate--> data is deleted but the table structure not deleted

-- Drop                      [Drop will delete both structure and table]
drop table test8; -- Drop--> table structure is droped/removed   

-- Alter
alter table test8 add column (salary int);            -- to add the column 
alter table test8 add column (age int default 18);    -- to set default value
alter table test8 drop column salary;                 -- to drop column
alter table test8 rename column salary to salary2;    -- to rename column
alter table test8 add constraint primary key (id);    -- to add constraints
select * from test8;

-- add a column before name column
alter table test8 add city varchar(20) default 'jaipur' after id;
select * from test8;

-- chenge the data type of name column to integer
alter table test8 modify name int;                    -- error 

-- add a not null constraint to name and age column   
alter table test8 modify name varchar(20) not null,
modify city varchar(20) not null;

select database();

select actor_id, first_name from sakila.actor;

create table tushar as                                -- CTAS --> Create Table As Select  
select actor_id, first_name from sakila.actor;
select * from  tushar;

-- Insert
insert into tushar values(1999,'Japan');              -- DML 
select * from  tushar;

set sql_safe_updates = 0;

-- Update
update tushar set first_name = 'Urvashi';             -- DML 
select * from  tushar;

update tushar set first_name = 'Urvashi'
where actor_id = 2;  
select * from  tushar;

-- Delete
delete from tushar             -- Delete --> delete the rows one by one  
where actor_id = 1;
select * from  tushar; 
