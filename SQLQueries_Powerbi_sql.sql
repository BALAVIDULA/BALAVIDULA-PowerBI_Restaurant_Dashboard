select * from pizza_sales

-- Total Revenue for all pizza orders
select sum(total_price) as Total_Revenue from pizza_sales

-- Average order value
select sum(total_price) / count(distinct order_id) as Avg_Order_Value from pizza_sales

-- Total quantity of pizza sold (sum)
select sum(quantity) as Total_Pizza_Sold from pizza_sales

-- Total number of orders 
select count(distinct order_id) as Total_Orders from pizza_sales

-- Average pizza's per order (in decimal point)
select cast(cast(sum(quantity) as decimal(10,2)) 
/ cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) as Avg_Pizzas_Per_order from pizza_sales



-- CHARTS

select * from pizza_sales

-- Daily trend for Total Orders 
select datename(DW, order_date) as order_day, count(distinct order_id) as Total_orders
from pizza_sales
group by datename(dw, order_date)

-- Montly trend for Total Orders
select datename(month, order_date) as Month_Name, count(distinct order_id) as Total_Orders
from pizza_sales
group by datename(month, order_date)
order by Total_Orders DESC

select * from pizza_sales

-- pERCENTAGE OF SALES BY PIZZA CATEGORY (for monnth Jan)

select pizza_category, sum(total_price) as Total_Sales,  sum(total_price) * 100 / 
(select sum(total_price) from pizza_sales) as Percentage_of_sales
from pizza_sales 
where month(order_date) = 1
group by pizza_category

-- Percentage of sales by Pizza size

select pizza_size, cast(sum(total_price) as decimal(10,2)) as Total_Sales,  cast(sum(total_price) * 100 / 
(select sum(total_price) from pizza_sales) as decimal(10,2)) as Percentage_of_sales
from pizza_sales 
where datepart(quarter, order_date)=1
group by pizza_size
order by Percentage_of_sales DESC

-- Top 5 best sellers by revenue, total quantity & total orders

select top 5 pizza_name, sum(total_price) as Total_Revenue from pizza_sales
group by pizza_name
order by Total_Revenue DESC

-- Top 5 best sellers with respect to quantity by revenue, total quantity & total orders

select top 5 pizza_name, sum(total_price) as Total_Revenue from pizza_sales
group by pizza_name
order by Total_Revenue ASC

-- Bottom 5 best sellers by revenue, total quantity & total orders

select top 5 pizza_name, sum(quantity) as Total_Quantity from pizza_sales
group by pizza_name
order by Total_Quantity DESC

select top 5 pizza_name, sum(quantity) as Total_Pizzas_Sold
from pizza_sales
where month(order_date) = 8
group by pizza_name
order by sum(quantity) ASC





