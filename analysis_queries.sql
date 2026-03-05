CREATE DATABASE salesforce_pipeline;
USE salesforce_pipeline;

CREATE TABLE opportunities (
opportunity_id INT PRIMARY KEY,
account_name VARCHAR(100),
stage VARCHAR(50),
owner VARCHAR(50),
city VARCHAR(50),
product VARCHAR(50),
amount INT,
close_date date
);

SHOW TABLES;
DESCRIBE opportunities;

#check DATA
SELECT * FROM opportunities
LIMIT 10;

# Revenue by Product
SELECT product, SUM(amount) AS total_revenue
FROM opportunities
GROUP BY product
ORDER BY total_revenue DESC;

# Sales by City
SELECT city, SUM(amount) AS total_sales
FROM opportunities
GROUP BY City
ORDER BY total_sales DESC;


#Pipeline Stage Analysis

SELECT stage, Count(*) AS total_deals
FROM opportunities
GROUP BY stage;

#Top Customers

SELECT account_name, SUM(amount) AS revenue
FROM opportunities
GROUP BY account_name
ORDER BY revenue DESC
LIMIT 5;

#Monthly Sales Trend

SELECT MONTH(close_date) AS month,
SUM(amount) AS monthly_sales
FROM opportunities
GROUP BY MONTH(close_date)
ORDER BY month;

