select *
from Sales.Orders;

-- groupby clause
-- find total sales for each product
select 
	ProductID,
	sum(Sales) as TotalSales
from Sales.Orders
group by ProductID;

----------------------------------------------------------------------------
-- using window function partition by
-- find total sales for each product and add the OrderId and OrderDate
select 
	OrderId,
	OrderDate,
	ProductID,
	sum(Sales) over(partition by ProductID) as SalesByProducts
from Sales.Orders;

-- find total sales across all orders
-- find total sales for each product and add the OrderId and OrderDate
select 
	OrderId,
	OrderDate,
	ProductID,
	Sales,
	sum(Sales) over () as TotalSales,
	sum(Sales) over (partition by ProductID) as SalesByProducts
from Sales.Orders;

-- find total sales across all orders
-- find total sales for each product and add the OrderId and OrderDate
-- find the total sles for each combination of product and order status
select 
	OrderId,
	OrderDate,
	ProductID,
	OrderStatus,
	Sales,
	sum(Sales) over () as TotalSales,
	sum(Sales) over (partition by ProductID) as SalesByProducts,
	sum(Sales) over (partition by ProductID,OrderStatus) as SalesByProductsAndOrderStatus
from Sales.Orders;

--------------------------------------------------------------------------------------------------
-- using window function rank
-- rank based upon sales
-- additional details of OrderID ans OrderDate
select
	OrderId,
	OrderDate,
	Sales,
	rank() over (order by Sales desc) as RankSales
from Sales.Orders;

select
	OrderId,
	OrderDate,
	Sales,
	dense_rank() over (order by Sales desc) as RankSales
from Sales.Orders;

----------------------------------------------------------------------------------------------------
-- using group by and window function
-- rank customer based upon their total sales
select
	CustomerID,
	sum(Sales) as TotalSales,
	rank() over(order by sum(Sales) desc) as CustomerRank
from Sales.Orders
group by CustomerID;

------------------------------------------------------------------------------------------------------
-- window function with frame clause
select 
	OrderId,
	OrderDate,
	ProductID,
	Sales,
	sum(Sales) over(
		partition by ProductID
		order by OrderDate desc
		rows between current row and 2 following
	) as RunningSalesByProducts
from Sales.Orders;
