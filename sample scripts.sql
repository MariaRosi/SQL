show tables;
desc sales;
select * from sales;
select Customers,Amount, Amount/Boxes as 'Amount PerBoxes' from sales;

select * from sales
where amount > 10000
order by amount desc;

select * from sales
where GeoID = 'G1'
order by PID,Amount desc;

select * from sales
where GeoID between 'G1' and 'G2'
order by PID,Amount desc;

select * from sales
where Amount > 10000 and year(SaleDate) = 2022
order by Amount desc;

select * from sales
where Boxes between 1 and 10
order by Amount desc;

select SaleDate, Amount, weekday(SaleDate) as 'Date Of Week'
from sales
where weekday(SaleDate) = 4;

select SaleDate,Amount,
	case when Amount > 1000 then 'Under 1K'
		 when Amount > 5000 then 'Under 5K'
         when Amount > 10000 then 'Under 10K'
		 else '10k or More'
    end as 'Amount Category'
from sales;


select * from people;
select * from people
where Team in ('Delish','Jucies')
order by Team;

select * from people
where Salesperson like 'B%';
