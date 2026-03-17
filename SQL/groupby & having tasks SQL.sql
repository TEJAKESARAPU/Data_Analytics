-- group by
-- 1. How many passengers were there in each passenger class (Pclass)?
select Pclass, count(*) as number_of_passengers from data_analyst.train group by Pclass;

-- 2. What is the average age of passengers in each gender(Sex) group?
select Sex, avg(Age) as avg_age from train group by Sex;

-- 3. How many survived (Survived = 1) and how many did not (Survived = 0)?
select Survived, count(*) as no_of_survived from train group by survived;

-- 4. What is the total fare paid by each passenger class (Pclass)?
select Pclass, max(Fare) from train group by Pclass;

-- 5. List all passengers whose age is between 20 and 30.
select PassengerId, Name, Age from train where Age between 20 and 30;

-- 6. Show the number of passengers by embarkation port (Embarked).
select embarked, count(PassengerId) from train group by Embarked;

-- 7. What is the average fare for passengers in classes 1, 2, and 3?
select Pclass, avg(Fare) as avg_fare from train group by Pclass;

-- 8. Show all passengers where Sex is either 'male' or 'female'.
select PassengerId, Name, Sex from train where Sex = 'male' or Sex = 'female';  

-- 9. Find the number of male and female passengers who survived.
select Sex, count(Survived) as no_of_survived from train group by Sex;

-- 10. Show the top 5 passengers who paid the highest fare.
select PassengerId, Name, Fare from train order by Fare Desc limit 5;

-- 11. Show the 5 passengers with the lowest fare, skipping the first two.
select PassengerId, Name, Fare from train order by Fare asc limit 5 offset 2;

-- 12. List the names of passengers who paid a fare between 100 and 200.
select Name, Fare from train where fare between 100 and 200;

-- 13. List all passengers who embarked from either 'C' or 'Q'.
select * from train where Embarked = 'C' or Embarked = 'Q';

-- 14. Count how many passengers were older than 50.
select count(age) as passengers_older_than_50 from train where age > 50;

-- 15. Show the average age of passengers for each combination of Pclass and Sex.
select Pclass, Sex, avg(age) as avg_age from train group by Pclass, Sex;



-- having
-- 1.Show the number of passengers in each class (Pclass) who survived, only if more than 50 passengers survived in that class.
select Pclass, count(Pclass) as passengers_survived from train group by Pclass having passengers_survived > 50;

-- 2.List genders (Sex) where the average age of passengers is greater than 30.
select Sex, avg(Age) from train group by Sex having avg(Age) > 30;

-- 3.Show the count of passengers grouped by embarkation port (Embarked) only if the count is greater than 100.
select Embarked, count(Embarked) as no_of_passengers from train group by Embarked having count(Embarked) > 100;

-- 4.Show the total fare collected per class (Pclass), but only include classes with total fare over 5000.
select Pclass, sum(Fare) as total_fare from train group by Pclass having total_fare > 5000;

-- 5.Show the number of passengers per gender who did not survive, but only include groups with more than 100 deaths.
select Sex, count(*) as deaths from train where Survived = 0 group by Sex having count(*) > 100;