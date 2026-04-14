Select * from train;

-- Q1. Find all passengers who were younger than 18.
select name, age from train where age < 18;

-- Q2. List all passengers who paid a fare greater than 50.
select name, Fare from train where Fare > 50;

-- Q3. Get passengers who were in 1st or 2nd class.
select name, Pclass from train where Pclass between 1 and 2;

-- Q4. Retrieve all female passengers who survived.
select name from train where Sex = 'Female' and Survived = 1;

-- Q5. List passengers who were either children (age < 18) or paid a fare more than 100.
select name from train where Age < 18 or Fare > 100;

-- Q6. Find all passengers who embarked from 'C'(Cherbourg) and in 3rd class.
select name from train where Embarked = 'C' and Pclass = 3;

-- Q7. Find passengers who are NOT male (i.e., female or other).
select name from train where not Sex = 'male'; 

-- Q8. Get passengers aged between 20 and 40 inclusive.
select name from train where Age between 20 and 40;

-- Q9. Find all passengers who had more than 20 siblings/spouses aboard and paid less than 20 fare.
select name from train where SibSp > 20 and Fare < 20;

