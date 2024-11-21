select * from orders_data;

select *
from orders_data
where sales > (select avg(sales) from orders_data);

with avg_sales as
(
select avg(sales) as avg_sal
from orders_data
)
select *
from orders_data
inner join avg_sales on sales > avg_sal;


with average_sales (avg_sal) as
(
	select avg(sales) from orders_data
)
select *
from orders_data o, average_sales a
where o.sales > a.avg_sal;


with total_sales (region, total_sales_per_region) as
(
	select 
	region,
	sum(sales)
	from orders_data
	group by region
),
average_sales (avg_sales) as
(
	select avg(total_sales_per_region)
    from total_sales
)
select *
from total_sales as ts
join average_sales as avs
on ts.total_sales_per_region > avs.avg_sales

