
select * from dbo.order_details;
select * from dbo.orders;
select * from dbo.pizza_types;
select * from dbo.pizzas;

------------------------------------------------------------
 -- Basic:
-- Retrieve the total number of orders placed.
select
	count(order_id) as TotalOrders
from dbo.orders;

-- Calculate the total revenue generated from pizza sales.
select
	od.pizza_id,
	od.quantity,
	p.price,
	od.quantity * p.price as TotalPrice
from dbo.order_details as od
inner join dbo.pizzas p
on od.pizza_id = p.pizza_id;

select
	sum(
		od.quantity * p.price
	) as TotalRevenue
from dbo.order_details as od
inner join dbo.pizzas p
on od.pizza_id = p.pizza_id;

-- Identify the highest-priced pizza.
select top 1
	pt.name as PizzaName,
	p.price as PizzaPrice
from dbo.pizza_types as pt
inner join dbo.pizzas as p
on pt.pizza_type_id = p.pizza_type_id
order by p.price desc;


with cte as
(
	select
		pt.name as PizzaName,
		p.price as PizzaPrice,
		RANK() over(order by p.price desc) as rn
	from dbo.pizza_types as pt
	inner join dbo.pizzas as p
	on pt.pizza_type_id = p.pizza_type_id
)
select
	PizzaName,
	PizzaPrice
from cte
where rn = 1;

-- Identify the most common pizza size ordered.
select
	p.size as 'Pizza Size',
	count(distinct od.order_id) as 'Number of Orders',
	sum(od.quantity) as 'Total Quantity'
from dbo.order_details as od
inner join dbo.pizzas as p
on od.pizza_id = p.pizza_id
group by size
order by count(distinct od.order_id) desc;

-- List the top 5 most ordered pizza types along with their quantities.

select top 5
	pt.name PizzaType,
	sum(od.quantity) as TotalQuantity
from dbo.order_details as od
join dbo.pizzas as p on od.pizza_id = p.pizza_id
join dbo.pizza_types as pt on p.pizza_type_id = pt.pizza_type_id
group by pt.name
order by sum(od.quantity) desc;

----------------------------------------------------------------------------------
-- Intermediate:
-- Join the necessary tables to find the total quantity of each pizza category ordered.
select
	pt.category,
	sum(od.quantity) as TotalQuantity
from dbo.pizza_types pt
join dbo.pizzas as p
	on pt.pizza_type_id = p.pizza_type_id
join dbo.order_details od
	on od.pizza_id = p.pizza_id
group by pt.category
order by sum(od.quantity) desc;


-- Determine the distribution of orders by hour of the day.
select
	datepart(hour, time) as DayHour,
	count(order_id) as TotalOrders
from dbo.orders
group by datepart(hour, time)
order by TotalOrders desc;


-- Find the category-wise distribution of pizzas.
select
	category,
	count(pizza_type_id)
from dbo.pizza_types
group by category;


-- Group the orders by date and calculate the average number of pizzas ordered per day.
with cte as
(
	select
		o.date as DayDate,
		sum(od.quantity) as TotalOrders
	from dbo.orders as o
	join order_details as od
		on o.order_id = od.order_id
	group by o.date
)
select
	avg(TotalOrders) as AvgOrdersPerDay
from cte;


select
	avg(TotalOrders) as AvgOrdersPerDay
from
(
	select
		o.date as DayDate,
		sum(od.quantity) as TotalOrders
	from dbo.orders as o
	join order_details as od
		on o.order_id = od.order_id
	group by o.date
) t;



-- Determine the top 3 most ordered pizza types based on revenue.
select top 3
	pt.name as PizzaType,
	sum(od.quantity * p.price) as TotalRevenue
from dbo.order_details as od
join dbo.pizzas as p
	on od.pizza_id = p.pizza_id
join dbo.pizza_types as pt
	on p.pizza_type_id = pt.pizza_type_id
group by pt.name
order by TotalRevenue desc;