select * from employeedemographics;

select count(*) from employeedemographics;

select * from employeedemographics
where age < 35;

select * from employeedemographics
where age between 30 and 32;

select * from employeedemographics
where age in(30,32);

select * from employeedemographics
where FirstName LIKE '%M%';

select * from employeedemographics
order by age, firstname desc;

select * from employeesalary;

select *
from employeesalary
order by Salary desc limit 1,1;

select dem.EmployeeID, FirstName, LastName, Age, JobTitle, Salary
from employeedemographics as dem
join employeesalary as sal
on sal.EmployeeID = dem.EmployeeID
order by Salary desc;

select Gender, max(age)
from employeedemographics as dem
join employeesalary as sal
on sal.EmployeeID = dem.EmployeeID
group by Gender;

select FirstName, 
LEFT(FirstName, 4),
RIGHT(FirstName, 4),
SUBSTRING(Gender, 2,2)
from employeedemographics;

select FirstName, LOCATE('an', FirstName)
from employeedemographics;

select FirstName, LastName,
CONCAT(FirstName , ' ' , LastName) as FullName
from employeedemographics;

select FirstName, LastName, Age,
CASE
	WHEN Age < 30 THEN 'Young'
    WHEN Age BETWEEN 30 AND 35 THEN 'Middle Age'
    WHEN Age > 35 THEN 'Old'
END as Age_Bracket
from employeedemographics;

SELECT * FROM employeedemographics;

ALTER TABLE employeedemographics
ADD COLUMN dept_id INT AFTER Gender;

ALTER TABLE employeesalary
ADD COLUMN dept_id INT AFTER Salary;


UPDATE employeedemographics
SET dept_id = 111
WHERE EmployeeId IN(1003);

SELECT * FROM employeesalary;
UPDATE employeesalary
SET dept_id = 1
WHERE EmployeeId = 1001;

select * from employeedemographics
where dept_id in
(select dept_id
from employeesalary);

select * from employeedemographics
where EmployeeID in
	(select EmployeeID
	from employeesalary
    where dept_id = 1);
    
select JobTitle, avg(salary)
from employeesalary
group by JobTitle;

select 
	Gender, 
    avg(Age) as avg_age, 
    min(Age) as min_age, 
    max(Age) as max_age,
    count(Age) as count_age
from employeedemographics
group by Gender;


select avg(max_age)
from
	(select 
		Gender, 
		avg(Age) as avg_age, 
		min(Age) as min_age, 
		max(Age) as max_age,
		count(Age) as count_age
	from employeedemographics
    group by Gender ) as temp_table;
    
select dem.FirstName, dem.LastName, Gender, avg(Salary) as avg_salary
from  employeedemographics as dem
join employeesalary as sal
on dem.EmployeeID = sal.EmployeeID
group by dem.FirstName, dem.LastName, Gender;

select dem.FirstName, dem.LastName, Gender, avg(Salary) over(partition by Gender) as avg_salary
from  employeedemographics as dem
join employeesalary as sal
on dem.EmployeeID = sal.EmployeeID;

select dem.EmployeeID, dem.FirstName, dem.LastName, Gender, Salary,
ROW_NUMBER() OVER(PARTITION BY Gender order by Salary desc) as row_num,
RANK() OVER(PARTITION BY Gender order by Salary desc) as rank_num,
DENSE_RANK() OVER(PARTITION BY Gender order by Salary desc) as dense_rank_num
from employeedemographics as dem
join employeesalary as sal
on dem.EmployeeID = sal.EmployeeID;

