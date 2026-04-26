Create table employees (id int, 
						name varchar(20), 
                        department varchar(20), 
                        age int, 
                        salary decimal(8,2));

                        
INSERT INTO employees (id, name, department, age, salary) VALUES
(1, 'Alice', 'HR', 28, 45000.00),
(2, 'Bob', 'IT', 35, 70000.00),
(3, 'Charlie', 'Sales', 30, 52000.00),
(4, 'David', 'Finance', 45, 80000.00),
(5, 'Eva', 'Admin', 22, 40000.00),
(6, 'Frank', 'IT', 38, 65000.00),
(7, 'Grace', 'HR', 26, 48000.00),
(8, 'Hannah', 'Sales', 29, 51000.00),
(9, 'Ian', 'Finance', 50, 82000.00),
(10, 'Jane', 'IT', 24, 47000.00),
(11, 'Karl', 'Admin', 31, 39000.00),
(12, 'Liam', 'Sales', 42, 55000.00),
(13, 'Mona', 'Finance', 34, 60000.00),
(14, 'Nina', 'IT', 27, 43000.00),
(15, 'Oscar', 'HR', 40, 53000.00),
(16, 'Paul', 'Sales', 23, 41000.00),
(17, 'Quinn', 'IT', 37, 62000.00),
(18, 'Rachel', 'Admin', 33, 46000.00),
(19, 'Steve', 'Finance', 39, 75000.00),
(20, 'Tina', 'HR', 25, 50000.00);

select * from employees;

-- Q1. Retreive all employees who are older than 35.
select name, age from employees where age > 35;

-- 2. Find employees with a salary less than or equal to 45000.
select name, salary from employees where salary >= 45000;

-- 3. List employees whose age is exactly 25.
select name, age from employees where age = 25;

-- 4. Find employees older than 30 and working in the 'Finance' department.
select name, department from employees where age > 30 and department = "Finance";

-- 5. Find employees who work in the 'IT' or 'Sales' department.
select name, department from employees where department = "IT" or department = "Sales";

-- 6. Get all employees whose age is not 40.
select name, age from employees where not age = 40;

-- 7. Find employees whose salary is between 45000 and 60000.
select name, salary from employees where salary between 45000 and 60000;

-- 8. Retrieve employees whose age is not between 30 and 45.
select name, age from employees where not age between 30 and 45;

-- 9. Get all employees whose department is either 'HR', 'Admin', or 'Finance'.
select name, department from employees where department in ("HR", "Admin", "Finance");

-- 10. List the top 3 highest-paid employees.
select name, salary from employees order by salary desc limit 3;

-- 11. Get the 5 youngest employees in the company.
select name, age from employees order by age asc limit 5;

-- 12. Skip the first 5 employees and display the next 5 based on id order.
select name id, name from employees order by id limit 5 offset 5;

-- 13. Find employees who do not work in the 'Sales' department.
select name, department from employees where not department = 'Sales';

-- 14. Get employees with salary greater than 60000 or age less than 26.
select name, age, salary from employees where salary > 60000 or age < 26;

-- 15. Display all employees sorted by salary in descending order
select name, salary from employees order by salary desc;
