
select
	SalesCategory,
	sum(Sales) as TotalSalesPerCategory
from
(
	select
		OrderId,
		Sales,
		case when Sales > 50 then 'High'
			 when Sales > 20 then 'Medium'
			 else 'Low'
		end as SalesCategory
	from Sales.Orders
) t
group by SalesCategory
order by TotalSalesPerCategory desc;

select 
	*,
	case when Gender = 'F' then 'Female'
		 when Gender = 'M' then 'Male'
		 else 'Not Available'
	end as GenderText
from Sales.Employees;

select
	CustomerId,
	FirstName,
	LastName,
	Country,
	case when Country = 'Germany' then 'DE'
		 when Country = 'USA' then 'US'
		 else 'N/A'
	end as CountryInShort
from Sales.Customers;

select
	CustomerId,
	FirstName,
	LastName,
	Country,
	case Country
		 when 'Germany' then 'DE'
		 when 'USA' then 'US'
		 else 'N/A'
	end as CountryInShort
from Sales.Customers;

---------------------------------------------------------------------------------
-- find average scores of Customers and treat NULL as 0

select
	CustomerId,
	FirstName,
	LastName,
	Score,
	avg(
	    case when Score is null then 0
			 else Score
		end
		) over() as AverageScore
from Sales.Customers;
----------------------------------------------------------------------------------------
-- count how many times each customer has made an order with sales greater than 30
select
	CustomerID,
	sum
	(
		case when Sales > 30 then 1
			 else 0
		end
	) as HighSalesCount,
	count(Sales) as TotalSalesCount
from Sales.Orders
group by CustomerID
