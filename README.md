# PizzaSales_Dashboard
The Pizza Sales Analytics Dashboard used SQL and Excel to track KPIs like Total Revenue and Pizzas Sold. It featured visualizations on sales trends, categories, and best/worst-sellers, offering actionable insights for business optimization.
## Tools: SQL, Excel
## Data: pizza_sales (4821 rows & 12 Columns)
<a href="https://github.com/SriharshaVarmaC/PizzaSales_Dashboard/blob/main/pizza_sales.csv"> Dataset </a>

- Creating the Report for Queries for Testing
- Connecting Excel to SQL Server
- Data Cleaning
- Data Processing 
- Data Analysis by using the Pivot tables
- Data Visualization
- Dashboard
<a href="https://github.com/SriharshaVarmaC/PizzaSales_Dashboard/blob/main/Dasboard_Pizza.png"> Dashboard </a>
 
# Problem Statement
## KPI's REQUIREMENT
We need to analyze key indicators for our pizza sales data to gain insights into our business performance. Specifically, we want to calculate the following metrics:
1. Total Revenue: The sum of the total price of all pizza orders.
2. Average Order Value: The average amount spent per order, calculated by dividing the
total revenue by the total number of orders.
3. Total Pizzas Sold: The sum of the quantities of all pizzas sold.
4. Total Orders: The total number of orders placed.
5. Average Pizzas Per Order: The average number of pizzas sold per order, calculated by dividing the total number of pizzas sold by the total number of orders.

## CHARTS REQUIREMENT
- We would like to visualize various aspects of our pizza sales data to gain insights and understand key trends. We have identified the following requirements for creating charts:
1. Daily Trend for Total Orders: (Bar Chat with Trend line)
Create a bar chart that displays the daily trend of total orders over a specific time period. This chart will help us identify any patterns or fluctuations in order volumes on a daily basis.
2. Hourly Trend for Total Orders: ()
Create a line chart that illustrates the hourly trend of total orders throughout the day. This chart will allow us to identify peak hours or periods of high order activity.
3. Percentage of Sales by Pizza Category: (Pie Chart)
Create a pie chart that shows the distribution of sales across different pizza categories. This chart will provide insights into the popularity of various pizza categories and their contribution to overall sales.
4. Percentage of Sales by Pizza Size:
Generate a pie chart that represents the percentage of sales attributed to different pizza sizes. This chart will help us understand customer preferences for pizza sizes and their impact on sales.
5. Total Pizzas Sold by Pizza Category:
Create a funnel chart that presents the total number of pizzas sold for each pizza category. This chart will allow us to compare the sales performance of different pizza categories.
6. Top 5 Best Sellers by Tolal Pizzas Sold: (Bar chart)
Create a bar chart highlighting the top 5 best-selling pizzas based on the total number of pizzas sold. This chart will help us identify the most popular pizza options.
7. Bottom 5 Worst Sellers by Total Pizzas Sold: 
Create a bar chart showcasing the bottom 5 worst-selling pizzas based on the total number of pizza sold. This chart will enable us to identify underperforming or less popular pizza options.
 
## SQL Report
<a href="https://github.com/SriharshaVarmaC/PizzaSales_Dashboard/blob/main/SQLQuery_PizzaSales.sql"> SQL Query </a>
 
## KPI
1.	Total Revenue
SELECT SUM(total_price) AS Total_Revenue
FROM pizza_sales

 
2.	Average Order Value
SELECT SUM(total_price)/COUNT(DISTINCT order_id) AS Avg_Order_Value
FROM pizza_sales
 
3.	Total Pizza Sold
SELECT SUM(quatity) AS Total_Pizza_Sold
FROM pizza_sales
  
4.	Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
 
5.	Average Pizza per Order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL (10,2)) AS DECIMAL(10,2)) AS Avg_PizzasPer_Order
FROM pizza_sales
 
## Charts
1.	Daily Trend
SELECT DATENAME(DW,order_date) AS order_day,
COUNT (DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY  DATENAME(DW,order_date)
ORDER BY  DATENAME(DW,order_date)
 

2.	Hourly Trend
SELECT DATEPART(HOUR, order_time) AS order_hour,
COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY DATEPART(HOUR, order_time)
 

3.	Percentage of Sales by Category
--WHERE MONTH(order_date) = 12
--WHERE DATEPART(QUARTER,order_date) = 1
--Whenever using the above code you need to add the same code in Subquery
SELECT pizza_category,CAST(SUM(total_price) AS DECIMAL (10,2)) AS Total_sales, CAST(SUM(total_price)*100 / 
(SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL (10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category
 

4.	Percentage of sales by size
SELECT pizza_size,CAST(SUM(total_price) AS DECIMAL (10,2)) AS Total_sales, CAST(SUM(total_price)*100 / 
(SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL (10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY PCT DESC
 

5.	Total Pizza Sold
SELECT pizza_category, SUM(quantity) AS Total_Pizza_sold
FROM pizza_sales
GROUP BY pizza_category
 

6.	Top 5 Best Seller
SELECT TOP 5 pizza_name,SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) DESC
 

7.	Bottom 5 Worst Selling Pizza
SELECT TOP 5 pizza_name,SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) ASC
 

 
# Dashboard – Excel
<a href="https://github.com/SriharshaVarmaC/PizzaSales_Dashboard/blob/main/Dashboard.xlsx">Excel Sheet</a>

Cleaning the data
- Changing the shortforms 
Ex: L – Large,S – Regular , M – Medium, Xlarge – X-Large and XX-Large
Processing the data
- Creating the day column for day-to-day sales
=TEXT([@[order_date]],"dddd") to get the day name
- Created a column for distinct order as total_order
=1/COUNTIF(B:B,[@[order_id]]) so this formula will see how many time the order is repeating and will sum of 1 for each order id so we get distinct count
Data Analysis
- Total Revenue
Using Pivot table to summarize the sales and data

