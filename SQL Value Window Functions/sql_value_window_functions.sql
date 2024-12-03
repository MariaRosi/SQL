-- LAG , LEAD
-- month over month performance by finding the percentage change
-- in sales between the current and previous months
select * from Sales.Orders

select
	*,
	round(cast((CurrentMonthSales - PreviousMonthSales) as FLOAT)/PreviousMonthSales * 100, 2) as MoM_ChangePercentage
from
(
	select
		month(OrderDate) as OrderMonth,
		sum(Sales) as CurrentMonthSales,
		lag(sum(Sales)) over(order by month(OrderDate)) as PreviousMonthSales
	from Sales.Orders
	group by month(OrderDate)
) t;

select
	*,
	round(cast
	((CurrentMonthSales - PreviousMonthSales) as FLOAT)/PreviousMonthSales * 100, 2
	) as MoM_ChangePercentage
from
(
	select
		month(OrderDate) as OrderMonth,
		sum(Sales) as CurrentMonthSales,
		lag(sum(Sales)) over(order by month(OrderDate)) as PreviousMonthSales
	from Sales.OrderInfo
	group by month(OrderDate)
) t;

select * from Sales.MonthlySales;

-- using inner query
select
	*,
	MonthSales - PreviousMonthSales as SalesDifference
from
(
	select
		month(SaleDate) as SalesMonth,
		sum(Sales) as MonthSales,
		lag(sum(Sales), 1, 0) over(order by month(SaleDate)) as PreviousMonthSales
	from Sales.MonthlySales
	group by month(SaleDate)
) t;

-- using cte
with MonthlyTotalSales as
(
	select
		month(SaleDate) as SalesMonth,
		sum(Sales) as MonthSales
	from Sales.MonthlySales
	group by month(SaleDate)
)
select
	*,
	lag(MonthSales, 1, 0) over(order by SalesMonth) as PreviousMonthSales,
	MonthSales - lag(MonthSales, 1, 0) over(order by SalesMonth) as SalesDifference
from MonthlyTotalSales;

-- LEAD
select
	CustomerID,
	avg(
		datediff(day,OrderDate,NextOrderDate)
	) as NextOrderDaysGapAvg,
	rank() over(order by coalesce(avg(
		datediff(day,OrderDate,NextOrderDate)), 999999)) as CustOrderFrequencyRank
from
(
	select
		CustomerID,
		OrderDate,
		LEAD(OrderDate) over(partition by CustomerID order by OrderDate) as NextOrderDate
	from 
	Sales.Orders
) t
group by CustomerID;

-----------------------------------------------------------------------------------------
-- FIRST_VALUE , LAST_VALUE

select
	OrderDate,
	OrderID,
	ProductID,
	Sales,
	first_value(Sales) over(partition by ProductId order by Sales) as LowestSales,
	last_value(Sales) over(partition by ProductId order by Sales
						   rows between current row and unbounded following) as HighestSales
from 
Sales.Orders;

select 
    SaleDate,
	month(SaleDate) as SaleMonth,
	Sales,
	first_value(Sales) over(partition by month(SaleDate) order by SaleDate) as FirstSaleOfMonth,
	last_value(Sales) over(partition by month(SaleDate) order by SaleDate
	                       rows between unbounded preceding and unbounded following) as LastSaleOfMonth
from 
Sales.MonthlySales;


