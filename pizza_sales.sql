
SELECT
	*
FROM
	pizza_sales
	limit 48620;

--total revenue
SELECT
	CAST(SUM(TOTAL_PRICE) AS DECIMAL(10, 2)) AS TOTAL_REVENUE
FROM
	PIZZA_SALES;

--average order value
SELECT
	CAST(
		SUM(TOTAL_PRICE) / COUNT(DISTINCT ORDER_ID) AS DECIMAL(10, 2)
	) AS AVG_ORDER_VALUE
FROM
	PIZZA_SALES;

--total pizzas sold
SELECT
	SUM(QUANTITY) AS TOTAL_PIZZAS_SOLD
FROM
	PIZZA_SALES;

--total orders
SELECT
	COUNT(DISTINCT ORDER_ID) AS TOTAL_ORDERS
FROM
	PIZZA_SALES;

--average pizzas per order
select cast(sum(quantity)/count(distinct order_id) as decimal(10,2))as avg_pizzas_per_order
from pizza_sales;

--percentage of sales by pizza category
select pizza_category,cast(sum(total_price)*100/(select sum(total_price) from pizza_sales) as decimal(10,2))
as pct_of_sales_by_category from pizza_sales
group by pizza_category
order by pct_of_sales_by_category desc;


--percentage of sales by pizza size
select pizza_size,cast(sum(total_price)*100/(select sum(total_price) from pizza_sales)as
decimal(10,2))as pct_of_sales_by_category
from pizza_sales
group by pizza_size
order by pct_of_sales_by_category desc;

--total pizzas sold by pizza category
select pizza_category,sum(quantity)as total_sold
from pizza_sales
group by pizza_category
order by total_sold desc;

--top 5 pizzas by revenue
select pizza_name,sum(total_price)as total_revenue
from pizza_sales
group by pizza_name
order by total_revenue desc
limit 5;

--bottom 5 pizzas bu revenue
select pizza_name,sum(total_price)as total_revenue
from pizza_sales
group by pizza_name
order by total_revenue asc
limit 5;

--top 5 pizzas by quantity
select pizza_name,sum(quantity)as total_pizzas_sold
from pizza_sales
group by pizza_name
order by total_pizzas_sold desc
limit 5;

--bottom 5 pizzas by quantity
select pizza_name,sum(quantity)as total_pizzas_sold
from pizza_sales
group by pizza_name
order by total_pizzas_sold asc
limit 5;

--top 5 pizzas by total orders
select pizza_name,count(distinct order_id)as total_orders
from pizza_sales
group by pizza_name
order by total_orders desc
limit 5;


--bottom 5 pizzas by total orders
select pizza_name,count(distinct order_id)as total_orders
from pizza_sales
group by pizza_name
order by total_orders asc
limit 5;
