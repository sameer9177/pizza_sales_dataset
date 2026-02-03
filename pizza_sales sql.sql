select * from pizza_sales
--1. Total Revenue:
select sum(total_price) as total_revenue from pizza_sales

--2 Average Order Value

select (sum(total_price)/count(distinct order_id)) as avg_order
	from pizza_sales

--3 Total Pizzas Sold
select sum(quantity) as total_pizzasold from pizza_sales

--4. Total Orders
select count(distinct order_id) as total_orders from pizza_sales

-- 5 average pizzas per order
select cast(cast(sum(quantity) as decimal (10,2))
/ cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2))
as avg_pizza_per_order
from pizza_sales

---6  Daily Trend for Total Orders
select DATENAME (dw,order_date) as order_day, 
count(distinct order_id) as total_orders
from pizza_sales
group by DATENAME  (DW, order_date)

----7 Monthly Trend for Orders

select DATENAME (MONTH,order_date) as order_month,
count(distinct order_id) as total_order
from pizza_sales
group by DATENAME(MONTH,order_date)

---8 % of Sales by Pizza Category
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category

--9 % of Sales by Pizza Size
select pizza_size, cast(sum(total_price) as decimal (10,2))as total_revenue,
cast(sum(total_price) * 100 / (select sum(total_price)from pizza_sales) as decimal(10,2)) as pct
from pizza_sales
group by pizza_size
order by pizza_size

---10 Total Pizzas Sold by Pizza Category
select pizza_category, sum(quantity) as total_quantity_sold
from pizza_sales
where month(order_date) = 2
group by pizza_category
order by total_quantity_sold desc

--11 Top 5 Pizzas by Revenue
select top 5 pizza_name, sum(total_price) as total_revenue
from pizza_sales
group by pizza_name
order by  total_revenue desc

--12 Bottom 5 Pizzas by Revenue
select top 5 pizza_name, sum(total_price) as total_revenue
from pizza_sales
group by pizza_name
order by total_revenue asc

---13 Top 5 Pizzas by Quantity
select top 5 pizza_name,sum(quantity) as total_pizza_sold
from pizza_sales
group by pizza_name
order by total_pizza_sold desc

----14 Top 5 Pizzas by Quantity
select top 5 pizza_name,sum(quantity) as total_pizza_sold
from pizza_sales
group by pizza_name
order by total_pizza_sold asc

--15 Top 5 Pizzas by Total Orders
select top 5 pizza_name,count(distinct order_id) as total_orders
from pizza_sales
group by pizza_name
order by total_orders desc

--16Bottom 5 Pizzas by Total Orders
select top 5 pizza_name,count(distinct order_id) as total_orders
from pizza_sales
group by pizza_name 
order by total_orders asc





