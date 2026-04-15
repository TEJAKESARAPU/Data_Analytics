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

-- One to One relation
-- Table A: Users
Create table users (
	UserID INT primary key,
    Username varchar(50));
    
-- Insert vales into users
insert into users (UserID, Username) values(1, 'Alice'), (2, 'Bob');

-- Table B: UserProfiles
Create table UserProfiles (
	ProfileID INT primary key,
    UserID INT unique,
    Bio Text,
    foreign key (userID) references users(UserID));

-- Insert vales into userprofiles
insert into UserProfiles(ProfileID, USerID, Bio)
values (101, 1, 'Software engineer from NY'), (102,2, 'Graphic designer from LA');

select * from users;
desc userprofiles;
select * from userprofiles;

select 
	u.UserID, 
    u.UserName, 
    p.Bio from 
    users u Join 
    UserProfiles p On u.UserID = p.UserID;
    
-- one to many (1:m)
-- Tbale A: Customers
create table customers (
	CustomerID INT primary key,
    CustomerName Varchar(50));
-- Insert into customers
insert into customers (CustomerID, CustomerName) 
values (1, 'John Doe'), (2, 'Jane Smith');
-- Tbale B: Orders
create table Orders (
	OrderID INT primary key,
    OrderDate Date,
    CustomerID int,
    foreign key (CustomerID) references Customers(CustomerID));
-- insert values into Orders
insert into Orders (OrderID, OrderDate, CustomerID)
values (1001, '2025-09-15', 1),
	(1002, '2025-09-16', 1),
    (1003, '2025-09-17', 2);
    
select * from Customers;
select * from Orders;
desc Orders;

select
	c.CustomerID,
    c.CustomerName,
    o.OrderID,
    o.OrderDate
    from Customers c;
    
-- many to many
-- Table A: Students
Create table students (
	StudentID INT primary key,
    StudentName VARCHAR(50)
);

-- Table B: Course
Create table Courses (
	CourseID INT primary key,
    CourseName Varchar(50)
);

-- Junction Table: Entollments
Create table Enrollment (
	StudentID int,
    CourseID INT,
    EnrollmentDate date, 
    primary key (StudentID, CourseID),
    foreign key (StudentID) references students(StudentID),
    foreign key (CourseID) references Courses(CourseID)
);
select * from Enrollment;

-- insert into students
insert into students (StudentID, StudentName)
values (1, 'Teja'), (2, 'Giri'), (3, 'Tara');

-- insert into courses
insert into courses (CourseID, CourseName)
values (101, 'Maths'), (102, 'Physics'), (103, 'Computer Science');

-- insert into Enrollments
insert into enrollment (StudentID, CourseID, EnrollmentDate)
values
(1, 101, '2025-09-01'),
(1, 103, '2025-09-01'),
(2, 101, '2025-09-03'),
(2, 102, '2025-09-03'),
(3, 103, '2025-09-04');

select
	s.StudentName,
    c.CourseName,
    e.EnrollmentDate
from
	enrollment e
Join students s ON e.StudentID = s.StudentID
JOIN courses c ON e.CourseID = c.CourseID
order by s.StudentName;

-- SQL joins

create table stu(sid int primary key, sname varchar(20));
insert into stu values (1, 'Alice'), (2, 'Bob'), (3, 'Charlie'), (4, 'David');
select * from stu;

create table cour (sid int primary key, cid int);
insert into cour values (1, 101), (2, 102), (3, 103), (5 , 104);
select * from cour;

-- inner join
select s.sid, s.sname, c.cid 
from stu as s 
inner join cour as c on s.sid = c.sid;

-- left join
select s.sid, s.sname, c.cid from stu as s left join cour as c on s.sid = c.sid;

-- right join
select s.sid, s.sname, c.cid from stu as s right join cour as c on s.sid = c.sid;

-- full outer join
select s.sid, s.sname, c.cid from stu as s left join cour as c on s.sid = c.sid
Union
select s.sid, s.sname, c.cid from stu as s right join cour as c on s.sid = c.sid;

create table employees(empid varchar(20), empname varchar(20), salary int, deptid varchar(10) primary key);
insert into employees values("E1", "Alice", 20000, "D1"), ("E2", "Bob", 2400, "D2"), ("E3", "Charlie", 450000, "D3"), 
							("E4", "David", 36000, "D4"), ("E5", "Eva", 45000, "D6");
                            
select * from employees;

create table department (deptname varchar(20), deptid varchar(20), foreign key (deptid) references employees(deptid));
insert into department(deptname, deptid) values("HR", "D1"), ("Sales", "D2"), ("HR", "D3"), ("IT", "D4"), ("AD", "D6");
select * from department;

-- set operations
create table A(sid int, sname varchar(10));
insert into A values (1, 'ALice'), (2, 'Bob'), (3, 'Charlie');
create table B(sid int, sname varchar(10));
insert into b values (1, 'ALice'), (5, 'Bob'), (4, 'David');

-- union
select * from A
UNION
select * from B;

-- union all
select * from A
UNION ALL
select * from B;

-- intersect
select * from A
intersect
select * from B;

-- except
select * from A
except
select * from B;

-- Sting functions
-- upper()
select upper (CustomerName) from data_analyst.customers;
-- lower()
select lower (CustomerName) from data_analyst.customers;
-- length
select length (CustomerName) as len_name from customers;
-- concat
select concat (CustomerName,'-', CustomerID) as Customer_Name_ID from data_analyst.customers; /* "-" -> delimiter */
-- substring
select substring(CustomerName, 1,7) from customers;
-- trim()
select trim('    Teja     ') as trimed_name;
select trim(CustomerName) from customers;

-- Math function
select abs(-45) as abs;
select profit, abs(profit) as newabprofit from coffee;
select round(450.3521, 2) as round;
select sales, round(sales) as new from samplesuperstore;
select ceil(32.4);
select floor(32.4);
select * from coffee;
select mod(11,3);
select power(2,3);
select sqrt(4);
select profit,sqrt(profit) as newpro from coffee;

-- conditional functions
select * from coffee;
-- numerical column
select market, profit,
case when profit > 90 and profit < 100 then "High"
	when profit >= 100 then "Excelent"
    else "Low" end as profit_Category from coffee
order by profit;

select empid, salary,
case when salary < 35000 then 'Low Salary'
	when salary < 70000 then 'Medium Salary'
    else 'High Salary' end as salary_category from data_analyst.employees
order by empid;

alter table coffee rename column `Product Type` to product_type;

select product, product_type,
case when product_type like "Coffee%" then "Faaahhhhh"
	when product_type like "Tea%" then "Teyyagundi"
    when product_type like "Espresso%" then "Sai Ram Sai Ram"
    else "Edokati esedam le" end as new_type from coffee;
    
-- Date and Time Functions
-- 1. Now() - current date and time
SELECT NOW() as current_datetime;

-- 2. CURDATE() - Current date
SELECT CURDATE() as currentdate;

-- 3. CURTIME() - current time
SELECT curtime() as currenttime;

create table employy (
	id int primary key,
    name varchar(100) not null,
    salary decimal(10, 2),
    department varchar(50),
    doj DATE, -- Date of Joining
    dob DATE  -- Date of Birth
);

insert into employy (id, name, salary, department, doj, dob) values 
(1001, 'ALice Johnson',75000.00, 'Engineering', '2020-03-15', '1990-07-12'),
(1002, 'Bob Smith', 60000.00, 'Marketing', '2019-06-01', '1985-11-23'),
(1003, 'Carol Lee', 82000.50, 'Finance', '2021-01-20', '1992-04-30'),
(1004, 'DAvid Kim', 55000.00, 'Human Resources', '2018-09-10', '1988-12-08'),
(1005, 'Eva Patel', 90000.00, 'Engineering', '2022-07-11', '1991-03-18');

select * from employy;

-- 1. YEAR(date) / MONTH(date) / DAY(date) -- Extract year, month or day
Select name, Year(dob) as birth_year, MONTH(doj) as join_month, DAY(dob) as birth_day
from employy;

-- 2. Extract(part from date) - extract specific part of a date
select name, EXTRACT(Year from dob) as birth_year, extract(Day from dob) as birth_day from employy;

-- 3.DATE_FORMAT (date, format) - format a date
select name, DATE_FORMAT(doj, '%W, %M, %d, %Y') as formatted_join_date
from employy;

-- DATEDIFF(date1, date2) - Difference in days
select name, doj, datediff(curdate(), doj) as days_since_joining from employy;

-- windows function
create table sts (
	emp_id int primary key,
    name varchar(50),
    dept_id int,
    salary decimal (10,2),
    hire_date date
);

insert into sts values 
(1, 'Alice', 10, 60000, '2020-01-15'),
(2, 'Bob', 10, 75000, '2019-03-10'),
(3, 'Charlie', 20, 55000, '2021-07-01'),
(4, 'David', 10, 80000, '2018-11-23'),
(5, 'Emma', 20, 58000, '2022-05-17'),
(6, 'Frank', 20, 72000, '2020-09-12'),
(7, 'Grace', 10, 60000, '2021-04-30'),
(8, 'Gracy', 10, 60000, '2023-04-30'),
(9, 'Grac', 10, 59000, '2021-04-30');

select * from sts;

-- row number
select name, dept_id, salary,
	row_number() over (partition by dept_id order by salary desc) as row_num
from sts;

-- rank
select name, dept_id, salary,
	rank() over (partition by dept_id order by salary desc) as rank_num from sts;
 
-- Sub Quries 
select empname, salary from employees
where salary > (select avg(salary) from employees);

select name, salary from sts
where salary > (select avg(salary) from sts);

-- multiple row/column subquery
create database DA1;
use DA1;

create table employees (emp_id int, emp_name varchar(50), dept_id int);
insert into employees values (1, 'Alice', 10), (2, 'Bob', 20), (3, 'Charlie', 10), (4, 'David', 30), (5, 'Eve', 10);
select * from employees;

create table department (dept_id int, city varchar(20));
insert into department values(10, 'Mumbai'), (20, 'Delhi'), (30, 'Mumbai');
select * from department;

select emp_name
from employees 
where dept_id IN (select dept_id 
				from department
                where city = 'Mumbai');
                
create table emp (emp_id int not null auto_increment primary key, name varchar(50), salary int not null);
insert into emp values (1, 'Alice', 50000), (2, 'Bob', 30000), (3, 'Carol', 70000), (4, 'Dan', 45000),  (5, 'Eve', 60000);
select * from emp;

-- Find employees who earn MORE than the average salary
select name, salary
from emp
where salary > (select avg(salary) from emp);

-- Find employees who work in Mumbai offices
select emp_name
from employees
where dept_id in (select dept_id
				from department
                where city = 'Mumbai');
                
create table emp_sal (emp_id int not null auto_increment primary key, name varchar(50),dept_id int, salary int not null);
insert into emp_sal values (1, 'Alice',10,  60000), (2, 'Bob',10 ,40000), (3, 'Carol', 20, 75000), (4, 'Dan', 20, 55000),  (5, 'Eve', 10, 50000);
select * from emp_sal;

-- Find employees earning more than their OWN department's average
select e1.name, e1.salary
from emp_sal e1
where e1.salary > (
		select avg(e2.salary)
        from emp_sal e2
        where e2.dept_id = e1.dept_id);
        
-- derived table
create table employees (emp_id int, name varchar(50), dept varchar(20), salary int);
insert into employees values (1, 'Alice', 'IT', 60000), (2, 'Bob', 'IT', 40000), (3, 'Carol', 'HR', 75000), (4, 'Dane', 'HR', 55000), (5, 'Eve', 'IT', 50000);
select * from employees;

-- get departments where avg salary is above 50000
select dept, avg_salary
from (select dept, avg(salary) as avg_salary
	from employees
    group by dept) as dept_avg
where avg_salary > 55000;


select dept, avg(salary) as avg_salary
from employees
group by dept
having avg_salary > 55000;

-- stored procedure

DELIMITER //
create procedure sp()
begin
	select name, salary from employees where salary > 60000;
end//
DELIMITER ;

-- call
call sp();

-- spet 1: Create the stored procedure

delimiter //
create procedure GetEmpByDept(IN dept_name varchar(20))
begin
	select name, salary
    from employees
    where dept = dept_name;
end //
delimiter ;

-- Step 2: Call it any time you need
Call GetEmpByDept('IT');

-- Views
create VIEW high_salary_employee as 
select name, salary
from employees
where salary > 70000;

select * from high_salary_employee;

-- CTE (Common table expression)
with low as (
select name, salary
from employees where salary < 45000)
select * from low;

-- Disable Auto commit before doing savepoint
-- create table students
create table students (id int, name varchar(20));

-- insert 1st student
insert into students values (1, 'Alice');

-- Savepoint after Alice
savepoint sp1;

-- insert 2nd student
insert into students values (2, 'Bob');

-- Savepoint after Bob
savepoint sp2;

-- insert 3rd student
insert into students values (3, 'Charlie');

-- Savepoint after Charlie
savepoint sp3;
commit;
select * from students;
rollback to sp1;
rollback to sp3;

CREATE DATABASE inno;
use inno;

CREATE DATABASE inno;
USE inno;

CREATE TABLE EMPLOYEES(
EMPID INT PRIMARY KEY,
EMPNAME VARCHAR(100),
SALARY DECIMAL(10,2)
);

INSERT INTO EMPLOYEES(EMPID,EMPNAME,SALARY)VALUES
(1,'A',50000),(2,'B',60000),(3,'C',55000);
select *from EMPLOYEES;

-- BEFORE TRIGGER(SALARY DECREASE PREVENTION)
DELIMITER //
CREATE TRIGGER TRG_BEFORESALARYCHANGE
BEFORE UPDATE ON EMPLOYEES
FOR EACH ROW
BEGIN
IF NEW.SALARY < OLD.SALARY THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'SALARY CANNOT BE DECREASED!';
END IF;
END;
//
DELIMITER ;

UPDATE EMPLOYEES
SET SALARY = 45000
WHERE EMPID = 1;

UPDATE EMPLOYEES
SET SALARY = 55000
WHERE EMPID = 1;
select *from EMPLOYEES;




CREATE TABLE EMPLOYEEAUDITLOG(
LOGID INT AUTO_INCREMENT PRIMARY KEY,
EMPID INT,
OLDSALARY DECIMAL(10,2),
NEWSALARY DECIMAL(10,2),
CHANGEDAT DATETIME
);
SELECT * FROM EMPLOYEES;

-- AFTER TRIGGER

DELIMITER //
CREATE TRIGGER TRG_AFTERSALARYCHANGE
AFTER UPDATE ON EMPLOYEES
FOR EACH ROW
BEGIN
INSERT INTO EMPLOYEEAUDITLOG(EMPID, OLDSALARY, NEWSALARY, CHANGEDAT)
VALUES(OLD.EMPID, OLD.SALARY, NEW.SALARY, NOW());
END;
//
DELIMITER ; 

UPDATE EMPLOYEES
SET SALARY = 55000
WHERE EMPID = 1;
UPDATE EMPLOYEES
SET SALARY = 75000
WHERE EMPID = 2;

SELECT * FROM EMPLOYEES;
SELECT * FROM EMPLOYEEAUDITLOG;
