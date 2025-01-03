--Data 
SELECT *
FROM [dbo].[pizza_sales]

--Total Revenue
SELECT SUM(total_price) AS Total_Revenue
FROM pizza_sales

--Average Order Value
SELECT SUM(total_price)/COUNT(DISTINCT order_id) AS Avg_Order_Value
FROM pizza_sales

--Total Pizza Sold
SELECT SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales

--Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales

--Average Pizza per Order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL (10,2)) AS DECIMAL(10,2)) AS Avg_PizzasPer_Order
FROM pizza_sales

--------------------------
--CHARTS
-- Daily Trend
SELECT DATENAME(DW,order_date) AS order_day,
COUNT (DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY  DATENAME(DW,order_date)
ORDER BY  DATENAME(DW,order_date)

-- Hourly Trend
SELECT DATEPART(HOUR, order_time) AS order_hour,
COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY DATEPART(HOUR, order_time)

--Percentage of Sales by Category
--WHERE MONTH(order_date) = 12
--WHERE DATEPART(QUARTER,order_date) = 1
--Whenever using the above code you need to add the same code in Subquery
SELECT pizza_category,CAST(SUM(total_price) AS DECIMAL (10,2)) AS Total_sales, CAST(SUM(total_price)*100 / 
(SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL (10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category

--Percentage of Sales by Siza
SELECT pizza_size,CAST(SUM(total_price) AS DECIMAL (10,2)) AS Total_sales, CAST(SUM(total_price)*100 / 
(SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL (10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY PCT DESC

--Total Pizza Sold
SELECT pizza_category, SUM(quantity) AS Total_Pizza_sold
FROM pizza_sales
GROUP BY pizza_category

--Top 5 Best Sellers
SELECT TOP 5 pizza_name,SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) DESC

--Bottom 5 Worst Selling

SELECT TOP 5 pizza_name,SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) ASC
