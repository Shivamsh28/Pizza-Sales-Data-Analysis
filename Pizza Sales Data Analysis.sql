use pizzadb;
select * from pizza_sales;

---Total Revenue
Select 
		sum(total_price) as Toal_Revenue
from pizza_sales;

---Avg Order Value
select 
		sum(total_price)/count(distinct(order_id)) as Avg_Order_Value
from pizza_sales;

--- Total Pizza Sold
select 
		sum(quantity) as total_pizza_sold
from pizza_sales;

select * from pizza_sales;

---Total Orders
select 
		count(distinct(order_id)) as total_orders
from pizza_sales;

--- Average Pizzas per order:
select 
		* from pizza_sales;

select 
	
	cast(cast(sum(quantity) As decimal(10,2))/cast(count(distinct(order_id)) as decimal(10,2)) as decimal (10,2))as Avg_pizzas_per_order
from pizza_sales;

select * from pizza_sales;
-- Daily Trend of Pizzas

select 
datename(DW,order_date) as order_day,
count(distinct(order_id)) as Total_orders
from pizza_sales	
group by datename(DW,order_date)



--- Monthly Trends for total orders:

select 
DATENAME(MONTH, order_date) as Month_name,
count(distinct(order_id)) as Count_order
from pizza_sales
group by DATENAME(MONTH, order_date)
order by DATENAME(MONTH, order_date);

---Percentage of Sales by Pizza Category:
select * from pizza_sales
select 
		pizza_category,
		sum(total_price)*100/(select sum(total_price) from pizza_sales where month(order_date)='1') as PCT_total_sales,
		sum(total_price) as total_sales
	
from pizza_sales
where month(order_date)='1'
group by pizza_category

---Percentage of sales by pizza size

select 
		pizza_size,
		sum(total_price)*100/(select sum(total_price) from pizza_sales)  as PCT_total_sales,
		sum(total_price) as total_sales
from pizza_sales
group by pizza_size
order by PCT_total_sales desc

---Total Pizza Sold by Pizza Category
select 
		pizza_category,
		sum(total_price) as total_sales
	
from pizza_sales
group by pizza_category

---Top 5 best sellers by Revenue, Total Quantity and Total Orders:
select 
top 5
pizza_name,
sum(total_price) as total_sales
from pizza_sales
group by pizza_name

select 
top 5
pizza_name,
sum(quantity) as total_quantity
from pizza_sales
group by pizza_name
order by total_quantity desc
select * from pizza_sales

select 
top 5
pizza_name,
count(distinct(order_id)) as total_orders
from pizza_sales
group by pizza_name
order by total_orders desc

--- Worst 5 best sellers by Revenue, Total Quantity and Total Orders:

select 
top 5
pizza_name,
sum(total_price) as total_sales
from pizza_sales
group by pizza_name

select 
top 5
pizza_name,
sum(quantity) as total_quantity
from pizza_sales
group by pizza_name
order by total_quantity 
select * from pizza_sales

select 
top 5
pizza_name,
count(distinct(order_id)) as total_orders
from pizza_sales
group by pizza_name
order by total_orders 



		


