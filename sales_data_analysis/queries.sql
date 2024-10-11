select *
from orders_data
order by sales desc
limit 5;

select *
from orders_data
where region = 'Central';

select *
from orders_data
where quantity <= 4
order by quantity desc;

select *
from orders_data
where order_date > '2018-12-05';

select *
from orders_data
where region = 'Central'
and
category = 'technology';

select *
from orders_data
where region = 'Central'
and
category = 'technology'
and
quantity > 2;

select *
from orders_data
where region = 'Central'
or
category = 'technology';

select *
from orders_data
where (region = 'Central'
or
category = 'technology')
and
quantity > 5
order by quantity desc;

select *
from orders_data
where quantity between 3 and 5
order by quantity desc;

select *
from orders_data
where quantity IN (3,4,5)
order by quantity desc;

select *
from orders_data
where city IN ('Los Angeles', 'New York City')
order by quantity desc;

select *
from orders_data
where customer_name LIKE 'A%';

select *
from orders_data
where customer_name LIKE '%n';

select *
from orders_data
where customer_name LIKE '%n%';

select *
from orders_data
where customer_name LIKE '_e%';

select *
from orders_data
where customer_name LIKE '_a%'
or
customer_name LIKE '_e%';

select sum(sales) as total_sales
from orders_data;

select min(sales) as min_sales
from orders_data;

select max(sales) as max_sales
from orders_data;

select avg(sales) as avg_sales
from orders_data;

select sum(sales) / count(*) as avg_sales
from orders_data;

select distinct category
from orders_data;

select distinct category,city
from orders_data;


select count(distinct city), count(distinct category)
from orders_data;

select category, sum(Sales) as category_sales
from orders_data
group by category;

select category, region, sum(Sales) as category_sales
from orders_data
group by category, region;

select city, sum(sales) as city_sales
from orders_data
where region = 'West'
group by city
having city_sales > 1000;


select *
from returns_data;

select *
from orders_data as od
inner join returns_data as rd
on od.order_id = rd.order_id;

select category, sum(sales) as category_sales
from orders_data as od
inner join returns_data as rd
on od.order_id = rd.order_id
group by category
order by category_sales desc;

select category, return_reason, sum(sales) as return_sales
from orders_data as od
inner join returns_data as rd
on od.order_id = rd.order_id
group by category, return_reason
order by category, return_sales desc;


select *
from orders_data as od
inner join returns_data as rd
on od.order_id = rd.order_id
where return_reason = 'Wrong Items'
and
city = 'Los Angeles';

select *
from orders_data as od
left join returns_data as rd
on od.order_id = rd.order_id;

select *
from orders_data as od
right join returns_data as rd
on od.order_id = rd.order_id;

select distinct return_reason
from returns_data;

select *,
case when return_reason = 'Wrong Item' then 'Wrong Items'
	 else return_reason
end as return_reason_new
from returns_data;

select *,
case when profit < 0 then 'loss'
	 when profit < 50 then 'less profit'
     when profit < 100 then 'medium profit'
     else 'high profit'
end as profit_bucket
from orders_data;

select *,
case when profit < 0 then 'loss'
	 when profit between 1 and 49 then 'less profit'
     when profit between 50 and 99 then 'medium profit'
     else 'high profit'
end as profit_bucket
from orders_data;

select *,
length(customer_name) as cust_name_len,
left(order_id, 2) as order_country,
right(order_id, 6) as order_number,
substring(order_id, 4, 4) as order_year,
replace(product_id, 'FUR', 'FURNITURE') as product_id_new
from orders_data;

select 
left(order_date, 4) as order_year,
sum(sales) as total_sales
from orders_data
group by order_year
order by total_sales;

select order_id,
order_date,
extract(year from order_date) as order_year,
extract(month from order_date) as order_month,
extract(day from order_date) as order_day
from orders_data;

select order_id,
order_date,
year(order_date) as order_year,
quarter(order_date) as order_quarter,
month(order_date) as order_month,
monthname(order_date) as order_month_name,
day(order_date) as order_day
from orders_data



-- from -> join --> where -> group by -> having -> select -> order by -> limit

