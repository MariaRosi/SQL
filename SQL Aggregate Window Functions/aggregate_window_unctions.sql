select *
from Sales.Orders;

-- COUNT
-- total number of Orders
select
	count(*) as TotalOrders
from Sales.Orders;

-- total number of Orders
-- Add OrderId and OrderDate
select
	OrderID,
	OrderDate,
	count(*) over() as TotalOrders
from Sales.Orders;

-- total number of Orders
-- total number of orders for each customer
-- Add OrderId and OrderDate
select
	OrderID,
	OrderDate,
	CustomerID,
	count(*) over(partition by CustomerID) as TotalOrders,
	count(*) over() as TotalOrdersByCustomer
from Sales.Orders;

-- total number of customers
-- display all the details as well
select
	*,
	count(*) over() as TotalCustomers
from Sales.Customers;

-- total number of customers
-- total number of scores for the customers
-- display all the details as well
select
	*,
	count(*) over() as TotalCustomers,
	count(Score) over() as TotalScores
from Sales.Customers;


-- find duplicates
select
	*
from Sales.OrdersArchive

select *
from
(
	select
		*,
		count(*) over(partition by OrderID) checkPK
	from Sales.OrdersArchive
)t
where checkPK > 1;

----------------------------------------------------------------------------------
-- SUM

-- total sales across all orders
-- total sales for each product
-- provide order id and order date
select
	orderID,
	OrderDate,
	productID,
	Sales,
	sum(Sales) over() as TotalSales,
	sum(Sales) over(partition by productID) as TotalSalesByProduct
from Sales.Orders;



-- find the percentage contribution of each product's sales to total sales
select
	OrderID,
	OrderDate,
	ProductID,
	Sales,
	sum(Sales) over () as TotalSales,
	round(cast(Sales as float)/ sum(Sales) over () * 100, 2) as PercentSales
from Sales.Orders;

-------------------------------------------------------------------------------
-- AVG
-- avg sales across all products
-- avg sales per product
select
	OrderID,
	OrderDate,
	ProductID,
	Sales,
	avg(Sales) over() as AvgSales,
	avg(Sales) over(partition by ProductID) as AvgSalesPerProduct
from Sales.Orders;

-- coalesce
select
	*,
	FirstName + ' ' + coalesce(LastName, '') as FullName,
	coalesce(Score, 0) as CustScore,
	avg(Score) over() as AvgScore,
	avg(coalesce(Score, 0)) over() as AvgScoreExcludingNull
from Sales.Customers;

select
	*,
	FirstName + ' ' + coalesce(LastName, '') as FullName,
	coalesce(Score, 0) as CustScore,
	avg(Score) over() as AvgScore,
	avg(coalesce(Score, 0)) over() as AvgScoreExcludingNull
from Sales.CustInfo;

-- find all the orders where sales are higher than the average sales across all orders
select *
from
(
	select
		OrderID,
		OrderDate,
		ProductID,
		Sales,
		avg(Sales) over() as AvgSales
	from Sales.Orders
) t
where Sales > AvgSales;

-------------------------------------------------------------------------------------------
-- MIN & MAX
--  find the max and min Sales for all orders
--  find the max and min Sales for orders by Product
select
	OrderID,
	OrderDate,
	ProductID,
	Sales,
	max(Sales) over() as MaxSales,
	min(Sales) over() as MinSales,
	max(Sales) over(partition by ProductID) as MaxSalesByProduct,
	min(Sales) over(partition by ProductID) as MinSalesByProduct
from Sales.Orders;

-- show the employes with highest salary
select
*
from
(
	select 
	*,
	max(Salary) over() as HighestSalary
	from Sales.Employees
) t
where Salary = HighestSalary;

-- moving sum of Sales for each Product over time
select
	OrderID,
	OrderDate,
	ProductID,
	Sales,
	sum(Sales) over(partition by ProductID) as TotalSalesByProduct,
	sum(Sales) over(partition by ProductID order by OrderDate) as RunningSalesByProduct
from Sales.Orders;

select
	OrderID,
	OrderDate,
	ProductID,
	Sales,
	sum(Sales) over(
	                partition by ProductID
					) as TotalSalesByProduct,
	sum(Sales) over(
					partition by ProductID 
					order by OrderDate 
					rows between current row and 1 following
					) as RollingSalesByProduct
from Sales.Orders;

select
	OrderID,
	OrderDate,
	ProductID,
	Sales,
	sum(Sales) over(partition by ProductID
	               ) as TotalSalesByProduct,
	sum(Sales) over(partition by ProductID
	                order by OrderDate
					) as RunningSalesByProduct,
	sum(Sales) over(partition by ProductID
	                order by OrderDate
	                rows between 2 preceding and current row
				   ) as RollingSalesByProduct
from Sales.Orders;


select
	OrderID,
	OrderDate,
	ProductID,
	Sales,
	sum(Sales) over(partition by ProductID
	               ) as TotalSalesByProduct,
	sum(Sales) over(partition by ProductID
	                order by OrderDate
					) as RunningSalesByProduct,
	sum(Sales) over(partition by ProductID
	                order by OrderDate
	                rows between 1 preceding and current row
				   ) as RollingSalesByProduct
from Sales.OrderInfo;
