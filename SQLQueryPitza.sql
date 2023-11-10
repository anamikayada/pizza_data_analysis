SELECT * FROM pizza_sales;



SELECT SUM(total_price) AS Total_Revenue from pizza_sales;


SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS AVERAGE_ORDER_VALUE FROM pizza_sales;

SELECT SUM(quantity) AS TOTAL_PIZZAS_SOLD FROM pizza_sales;


SELECT COUNT(DISTINCT order_id) AS TOTAL_ORDERS FROM pizza_sales;


SELECT CAST(CAST(SUM(quantity) AS DECIMAL (10,2))/ CAST(COUNT(DISTINCT order_id) AS DECIMAL (10,2))AS DECIMAL (10,2)) AS AVERAGE_PIZZAS_PER_ORDER FROM pizza_sales;


SELECT DATENAME(DW,order_date) AS ORDER_DAY,COUNT(DISTINCT order_id) AS TOTAL_NUMBER_ORDER FROM pizza_sales
GROUP BY DATENAME(DW,order_date)

SELECT DATENAME(MONTH,order_date) AS ORDER_MONTH,COUNT(DISTINCT order_id) AS TOTAL_NUMBER_ORDER FROM pizza_sales
GROUP BY DATENAME(MONTH,order_date)
ORDER BY DATENAME(MONTH,order_date) ASC



SELECT DATENAME(MONTH,order_date) AS ORDER_MONTH,COUNT(DISTINCT order_id) AS TOTAL_NUMBER_ORDER FROM pizza_sales
GROUP BY DATENAME(MONTH,order_date)
ORDER BY DATENAME(MONTH,order_date) ASC


--SELECT DATEPART(HOUR,order_date) AS ORDER_MONTH,COUNT(DISTINCT order_id) AS TOTAL_NUMBER_ORDER FROM pizza_sales
--GROUP BY DATEPART(HOUR,order_date) 


SELECT pizza_category ,CAST(sum(total_price)*100 / (SELECT sum(total_price)  FROM pizza_sales) AS DECIMAL (10,2)) AS CATEGORY_WISE_PERCENTAGE 
FROM pizza_sales 
GROUP BY pizza_category;



SELECT pizza_size ,CAST(sum(total_price)*100 / (SELECT sum(total_price)  FROM pizza_sales) AS DECIMAL (10,2)) AS PIZZA_SIZE_WISE_PERCENTAGE 
FROM pizza_sales 
GROUP BY pizza_size;


SELECT pizza_category,COUNT(quantity)  AS TOTAL_PIZZA_SOLD_CATEGORY
FROM pizza_sales
GROUP BY pizza_category


SELECT TOP 5 pizza_name,  CAST(SUM(total_price) AS DECIMAL (10,2)) AS TOTAL_REVENUE
FROM pizza_sales
GROUP BY pizza_name
ORDER BY TOTAL_REVENUE DESC





SELECT TOP 5 pizza_name,  CAST(SUM(total_price) AS DECIMAL (10,2)) AS TOTAL_REVENUE
FROM pizza_sales
GROUP BY pizza_name
ORDER BY TOTAL_REVENUE ASC



SELECT TOP 5 pizza_name, SUM(quantity) AS TOP_5_PIZZA_QUANTITY
FROM pizza_sales
GROUP BY pizza_name
ORDER BY TOP_5_PIZZA_QUANTITY DESC



SELECT TOP 5 pizza_name, SUM(quantity) AS BOTTOM_5_PIZZA_QUANTITY
FROM pizza_sales
GROUP BY pizza_name
ORDER BY BOTTOM_5_PIZZA_QUANTITY ASC




SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS TOP_5_PIZZA_ORDERS
FROM pizza_sales
GROUP BY pizza_name
ORDER BY TOP_5_PIZZA_ORDERS DESC



SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS BOTTOM_5_PIZZA_ORDERS
FROM pizza_sales
GROUP BY pizza_name
ORDER BY BOTTOM_5_PIZZA_ORDERS ASC