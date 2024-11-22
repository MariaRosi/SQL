select *
from Sales.Orders

-- COUNT
-- total number of Orders
select
	count(*) as TotalOrders
from Sales.Orders

-- total number of Orders
-- Add OrderId and OrderDate
select
	OrderID,
	OrderDate,
	count(*) over() as TotalOrders
from Sales.Orders

-- total number of Orders
-- total number of orders for each customer
-- Add OrderId and OrderDate
select
	OrderID,
	OrderDate,
	CustomerID,
	count(*) over(partition by CustomerID) as TotalOrders,
	count(*) over() as TotalOrdersByCustomer
from Sales.Orders

-- total number of customers
-- display all the details as well
select
	*,
	count(*) over() as TotalCustomers
from Sales.Customers

-- total number of customers
-- total number of scores for the customers
-- display all the details as well
select
	*,
	count(*) over() as TotalCustomers,
	count(Score) over() as TotalScores
from Sales.Customers


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
where checkPK > 1

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
from Sales.Orders



-- find the percentage contribution of each product's sales to total sales
select
	orderID,
	OrderDate,
	productID,
	Sales,
	sum(Sales) over() as TotalSales,
	round(cast (Sales as float) / sum(Sales) over() * 100, 2) as PercentSales
from Sales.Orders