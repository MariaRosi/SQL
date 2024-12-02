-- ROW_NUMBER, RANK, DENSE_RANK
-- rank the orders based on sales

select
	OrderID,
	ProductID,
	OrderDate,
	Sales,
	row_number() over(order by Sales desc) as SalesRankWithRowNumber,
	rank() over(order by Sales desc) as SalesRankWithRank,
	dense_rank() over(order by Sales desc) as SalesRankDenseRank
from Sales.Orders;



select
	OrderID,
	Sales,
	row_number() over(order by Sales desc) as WithRowNumber,
	rank() over(order by Sales desc) as WithRank,
	dense_rank() over(order by Sales desc) as WithDenseRank
from Sales.OrderInfo;





-- top 2 highest sales for each product
select
*
from
(
	select
		OrderID,
		ProductID,
		Sales,
		row_number() over(partition by ProductID order by Sales desc) as RN
	from Sales.Orders
) t
where RN in(1,2);

-- lowest 2 customers based on their total sales
select
*
from
(
	select
		CustomerID,
		sum(Sales) TotalSalesByCUstomer,
		row_number() over(order by sum(Sales)) as CustRank
	from 
	Sales.Orders
	group by CustomerID
) t
where CustRank <= 2;

-- find the duplicates
select
*
from
(
	select
		row_number() over(partition by OrderID order by CreationTime desc) as RN,
		*
	from
	Sales.OrdersArchive
) t
where RN > 1

--------------------------------------------------------------------------------------
-- NTITLE
-- segment all sales into 3 categories - high, medium, low
select
	*,
	case when Bucket = 1 then 'High'
		 when Bucket = 2 then 'Medium'
		 when Bucket = 3 then 'Low'
	end as Categories
from
(
	select
		OrderID,
		Sales,
		ntile(3) over(order by Sales) as Bucket
	from
	Sales.Orders
) t;

-- segment total sales per customer into 3 categories - high, medium, low
select
	*,
	case when Bucket = 1 then 'High'
		 when Bucket = 2 then 'Medium'
		 when Bucket = 3 then 'Low'
	end as Categories
from
(
	select
		CustomerID,
		sum(Sales) as TotalSalesByCustomer,
		ntile(3) over(order by sum(Sales)) as Bucket
	from
	Sales.Orders
	group by CustomerID
) t;

select
	*,
	case when SalaryBand = 1 then 'High Salary'
	     when SalaryBand = 2 then 'High-Medium Salary'
	     when SalaryBand = 3 then 'Low-Medium Salary'
	     else 'Low Salary'
	end as SalaryCategory
from
(
	select
		*,
		ntile(4) over(order by Salary desc) as SalaryBand
	from
	Sales.EmployeeInfo
) t

----------------------------------------------------------------
-- CUME_DIST, PERCENT_RANK
-- find the products that fall within highest 40% of the prices

select * from Sales.Products

select
	*,
	concat(PriceRank * 100, '%')as PriceRankPercentage
from
(
	select 
		*,
		cume_dist() over(order by Price DESC) as PriceRank
	from Sales.Products
) t
where PriceRank <= 0.4


select
	*,
	concat(PriceRank * 100, '%')as PriceRankPercentage
from
(
	select 
		*,
		percent_rank() over(order by Price DESC) as PriceRank
	from Sales.Products
) t
where PriceRank <= 0.4
