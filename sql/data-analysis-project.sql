CREATE DATABASE sales_db;
USE sales_db;

CREATE TABLE sales_data (
    Row_ID INT,
    Order_ID VARCHAR(50),
    Order_Date VARCHAR(20),
    Ship_Date VARCHAR(20),
    Ship_Mode VARCHAR(50),
    Customer_ID VARCHAR(50),
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    Postal_Code VARCHAR(20),
    Region VARCHAR(50),
    Product_ID VARCHAR(50),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name VARCHAR(200),
    Sales DECIMAL(10,2)
);

SELECT COUNT(*) FROM sales_data;

SELECT * FROM sales_data;

SELECT Region, SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Region;

SELECT Category, SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Category;

SELECT MONTH(Order_Date) AS Month,
       SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY MONTH(Order_Date)
ORDER BY Month;

SELECT * 
FROM sales_data
ORDER BY Sales DESC
LIMIT 5;


CREATE TABLE customers AS
SELECT DISTINCT Customer_ID, Customer_Name, Segment, Region
FROM sales_data;


SELECT * FROM customers;


SELECT s.Order_ID, s.Sales, c.Customer_Name, c.Region
FROM sales_data s
INNER JOIN customers c
ON s.Customer_ID = c.Customer_ID;


SELECT s.Order_ID, s.Sales, c.Customer_Name
FROM sales_data s
LEFT JOIN customers c
ON s.Customer_ID = c.Customer_ID;


SELECT s.Order_ID, s.Sales, c.Customer_Name
FROM sales_data s
RIGHT JOIN customers c
ON s.Customer_ID = c.Customer_ID;


SELECT c.Customer_Name,
       SUM(s.Sales) AS Total_Sales
FROM sales_data s
INNER JOIN customers c
ON s.Customer_ID = c.Customer_ID
GROUP BY c.Customer_Name
ORDER BY Total_Sales DESC;




