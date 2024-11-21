select *
from employeesalary;

select *
from employeedemographics
order by age desc
limit 1, 1;

select left(FirstName,3),
right(LastName, 3),
substring(FirstName, 2,3)
from employeedemographics;


select FirstName,
LastName,
Age,
Case
	when Age <= 30 then 'Young'
    when Age between 31 and 50 then 'old'
    else 'Very Old'
end as Age_Bracket
from employeedemographics;

-- subqueries
select *
from employeesalary
where EmployeeID in
(
	select EmployeeID
    from employeedemographics
    where Gender = 'Female'
);

select JobTitle, avg(Salary)
from employeesalary
group by JobTitle;

select gender,
avg(Salary)
from employeesalary as sal
join employeedemographics dem
on sal.EmployeeID = dem.EmployeeID
group by gender;

-- window function
select dem.FirstName,
dem.LastName,
dem.Gender,
avg(sal.Salary) over(partition by dem.Gender) as AvgSalary
from employeesalary as sal
join employeedemographics dem
on sal.EmployeeID = dem.EmployeeID;

select dem.FirstName,
dem.LastName,
dem.Gender,
sal.Salary,
sum(sal.Salary) over(partition by dem.Gender order by dem.EmployeeID) as Rolling_Total
from employeesalary as sal
join employeedemographics dem
on sal.EmployeeID = dem.EmployeeID;

select dem.FirstName,
dem.LastName,
dem.Gender,
sal.Salary,
row_number() over(partition by dem.Gender order by sal.Salary desc) as rn,
rank() over(partition by dem.Gender order by sal.Salary desc) as ra,
dense_rank() over(partition by dem.Gender order by sal.Salary desc) as dra
from employeesalary as sal
join employeedemographics dem
on sal.EmployeeID = dem.EmployeeID;


-- CTE
with cte_example as
(
	select JobTitle,
	avg(Salary) as avg_sal,
	max(Salary) as max_sal,
	min(Salary) as min_sal
	from employeesalary
	group by JobTitle
)
select avg(avg_sal)
from cte_example;

with cte1 as
(
	select employeeid,
    gender,
    age
    from employeedemographics
    where age > 30
),
cte2 as
(
	select employeeid,
    salary
    from employeesalary
    where salary > 20000
)

select *
from cte1
join cte2
where cte1.employeeid = cte2.employeeid;

-- temporary table
create temporary table salary_over_50
select *
from employeesalary
where salary >= 50000;

select * 
from salary_over_50;

-- stored procedure
delimiter $$
create procedure high_salary()
begin
	select *
	from employeesalary
	where salary >= 50000;
	select *
	from employeesalary
	where salary >= 10000;
end $$

delimiter ;

call high_salary();







