CREATE TABLE df_orders (
    order_id int primary key,
    order_date DATE,
    ship_mode VARCHAR(20),
    segment VARCHAR(20),
    country VARCHAR(20),
    city VARCHAR(20),
    state VARCHAR(20),
    postal_code VARCHAR(20),
    region VARCHAR(20),
    category VARCHAR(20),
    sub_category VARCHAR(20),
    product_id VARCHAR(50),
    cost_price DECIMAL(7, 2),
    list_price DECIMAL(7, 2),
    quantity INT,
    discount_percent DECIMAL(5, 2),
    discount DECIMAL(7, 2),
    sale_price DECIMAL(7, 2),
    profit DECIMAL(7, 2)
);

select * from df_orders;

-- find top 10 highest revenue generating products
select product_id,
sum(sale_price) as sale_price_per_product
from df_orders
group by product_id
order by sale_price_per_product desc
limit 10;

-- find top 5 highest selling products in each region
with cte_region_product_sales as
(
	select region,
	product_id,
	sum(sale_price) as sale_price_per_region_per_product
	from df_orders
	group by region, product_id
)
select * from 
(
	select *,
    row_number() over(partition by region order by sale_price_per_region_per_product desc) as rn
	from cte_region_product_sales
) A
where rn <= 5;


-- find month over month growth comparison for 2022 and 2023 sales eg: jan 2022 vs jan 2023
with cte_sale_per_year_per_month as 
(
	select year(order_date) as order_year,
	month(order_date) as order_month,
	sum(sale_price) as sales
	from df_orders
	group by order_year, order_month
)
select order_month,
sum(case
		when order_year=2022 then sales
		else 0
	end) as 2022_sales,
sum(case
		when order_year=2023 then sales
		else 0
	end) as 2023_sales
from cte_sale_per_year_per_month
group by order_month
order by order_month;



-- for each month which category has the highest sale
with cte as
(
	select category,
	date_format(order_date, '%Y-%m') as order_year_month,
	sum(sale_price) as sales
	from df_orders
	group by category, order_year_month
)
select *
from 
(
	select *,
	row_number() over(partition by category order by sales) as rn
	from cte
) A
where rn = 1




