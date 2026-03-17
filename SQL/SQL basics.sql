-- DDL
-- Create database
create database data_analyst;

-- use - used to switch or select the database
use data_analyst;

-- show databases -- used to see all databases in the schema
show databases;

-- create table
create table inno(id int, name varchar(30), age decimal(5,2), course char(2), doj date);

-- show tables
show tables;

-- detailed description about table
desc inno;

-- drop
drop table inno;
drop database data_analyst;

-- alter
-- add
alter table inno add gamil varchar(30);
-- drop
alter table inno drop column gamil;
-- modify
alter table inno modify column course varchar(20);
-- rename
alter table inno rename column course to branch;
alter table inno rename to innomatics;

show tables;

-- DML
-- Insert
insert into innomatics values(1001, "Alice", 25, "DS", "2026-01-26");

-- DQL SELECT
select * FROM innomatics;
select name from innomatics;
select age from innomatics
where age < 25;

insert into innomatics values (1002, "Bob", 23, "DA", "2025-01-23"),
							(1003, "Charlie", 33, "CSE", "2025-08-25");
                            
-- explicit method
insert into innomatics (name, age, branch) values("David", 35, "ECE");
insert into innomatics (name, age, branch) values("Eva", 24, "EEE"),
												("Fairy", 21, "DS");

-- DDL TRUNCATE
truncate table innomatics;

SET SQL_SAFE_UPDATES = 0;

-- DML UPDATE
update innomatics 
set id=1004 
where name="David";

-- Delete
delete from innomatics where id=1004;

-- constraints
-- not null
create table students(id int not null);
show tables;
insert into students values(1001), (1002);
select * from students;
desc students;
drop table students;

-- unique
create table students(id int not null, name varchar(20) unique);
insert into students values(1001, "Alice"), (1002, "Alice");

-- primary key
create table students(id int not null, name varchar(20) unique, phone int primary key);
insert into students values(1001, "Teja", 9550000), (1002, "Giri", 9551111);
select * from students;
desc students;

-- auto increment
create table x(id int auto_increment primary key, name varchar(20) unique);
insert into x(name) values('Swathi');
select * from x;
insert into x(name) values('Teja');

-- check table
create table students(id int not null,
					name varchar(20) unique,
                    phone char(10) primary key,
                    age int check(age>=18));
select * from students;
insert into students values(1001, "Giri", 35353535, 18);

-- default
create table students(id int not null,
					name varchar(20) unique,
                    phone char(10) primary key,
                    age int check(age>=18),
                    country char(5) default "India");
insert into students values(1001, "Teja", 35353535, 25, default), (1002, "Giri", 74859652, 35, "USA");
select * from students;
insert into students(id, name, phone, age) values(1003, "Noobitha", 45126396, 42);

-- where
-- names who's age is greater than 32
Select name, age 
from data_analyst.students
where age > 32;

Select * from train;

-- names who belongs to pclass 3?
select Name
from data_analyst.train
where pclass=3;

-- names who's tiket price is greater than 200
select Name
from data_analyst.train
where Fare > 200;

-- names who's age is less than 16
select Name
from data_analyst.train
where Age < 16;

-- Logical
-- Names of students who belongs to country India and age is greater than 30?
select name from data_analyst.students
where country="India" and age >30;

Select * from train;

-- Names of the female passengers who belongs to embark Q.
select name from data_analyst.train
where Sex = 'female' and Embarked = 'Q';

-- Names of male passerngers who's fare is less than Rs.30.
select name from data_analyst.train
where Sex = 'male' and Fare < 30;

-- Names of the male passengers who's age is greater than 60 and only belongs to pclass2.
select name from data_analyst.train
where Sex = 'male' and Age > 60 and Pclass = 2;

-- OR
-- Names of the female passengers or who belongs to embark Q.
select name from data_analyst.train
where Sex = 'female' or  Embarked = 'Q';

-- Names of male passengers or fare is less than Rs.30.
select name from data_analyst.train
where Sex = 'male' or Fare < 30;

-- Names of the male passengers or who's age is greater than 60 or only belongs to pclass2.
select name from data_analyst.train
where Sex = 'male' or Age > 60 or Pclass = 2;

-- Not
select name, sex from train where not sex = 'male';

-- limit operator
select name from train where age < 16 limit 3;

-- in
select * from train 
where age in (24,35,20,70) 
order by age asc 
limit 5;

select * from train
where Embarked in ("S", "R");

-- between
select name from train
where age between 35 and 45;

-- Order by
select * from train order by age;
select * from train order by age desc limit 5 offset 5;

-- Like operator
select name from train where name like 's%';
select name from train where name like '%a';
select name from train where name like '%or%';
select name from train where name like '%_r%';
select name from train where name like 'a_%';
select name from train where name like 'a__%';
select name from train where name like 'a%r';

-- group by
-- aggregate
-- 1. count
select count(*) from data_analyst.innomatics;
select count(id) from innomatics;
select count(distinct pclass) from train;
select count(distinct Sex) from train;

-- 2. Sum
select sum(fare) from train;
select sum(Survived) from train;

-- 3. Min
select min(age) from train;
select min(Fare) from train;

-- 4. Max
select max(age) from train;
select max(Fare) from train;

-- 5. Avg
select avg(Fare) from train;
select avg(Age) from train;

-- group by
select * from data_analyst.employees;
select department, avg(salary) as avg_salary from employees group by department;
select pclass, max(Fare) as max_fare from data_analyst.train group by Pclass;

-- having clause
select pclass, max(Fare) as max_fare from data_analyst.train 
group by Pclass 
having max_fare > 70;

select department, avg(salary) as avg_salary from employees
group by department
having avg_salary > 60000.00;

SELECT salary, COUNT(*) AS num_employees
FROM employees
GROUP BY salary;