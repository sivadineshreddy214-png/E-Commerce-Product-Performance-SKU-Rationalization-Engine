## Total Sales & Shipping Cost
CREATE VIEW vw_Total_Sales AS
SELECT
    Delivery_Status,
    COUNT(*) AS Total_Orders
FROM `order_delivery_performance_dataset (2)`
GROUP BY Delivery_Status;

SELECT
    AVG(Shipping_Cost) AS Avg_Shipping_Cost
FROM `order_delivery_performance_dataset (2)`;

SELECT
    AVG(Order_Value) AS Avg_Order_Value
FROM `order_delivery_performance_dataset (2)`;

## Delivery Performance

SELECT
    Delivery_Status,
    COUNT(*) AS Total_Orders
FROM `order_delivery_performance_dataset (2)`
GROUP BY Delivery_Status;

SELECT
    Delivery_Status,
    AVG(Shipping_Cost) AS Avg_Shipping_Cost
FROM `order_delivery_performance_dataset (2)`
GROUP BY Delivery_Status;

## Region-wise Performance

SELECT
    Region,
    SUM(Order_Value) AS Total_Order_Value
FROM `order_delivery_performance_dataset (2)`
GROUP BY Region;

SELECT
    Region,
    SUM(Shipping_Cost) AS Total_Shipping_Cost
FROM `order_delivery_performance_dataset (2)`
GROUP BY Region;

## Product Category Performance

SELECT
    Product_Category,
    SUM(Order_Value) AS Total_Order_Value
FROM `order_delivery_performance_dataset (2)`
GROUP BY Product_Category;

SELECT
    Product_Category,
    AVG(Order_Value) AS Avg_Order_Value
FROM `order_delivery_performance_dataset (2)`
GROUP BY Product_Category;

## On-Time Delivery Rate

SELECT
ROUND(
    SUM(CASE
            WHEN Delivery_Status='On-Time' THEN 1
            ELSE 0
        END)*100.0/COUNT(*),2
) AS OnTime_Delivery_Rate
FROM `order_delivery_performance_dataset (2)`


## Running Total of Order Value

SELECT
    Order_ID,
    Order_Date,
    Order_Value,
    SUM(Order_Value)
        OVER(
            ORDER BY Order_Date
        ) AS Running_Total
FROM `order_delivery_performance_dataset (2)`;

## Running Total of Shipping Cost

SELECT
    Order_ID,
    Order_Date,
    Shipping_Cost,
    SUM(Shipping_Cost)
        OVER(
            ORDER BY Order_Date
        ) AS Running_Shipping_Cost
FROM `order_delivery_performance_dataset (2)`;

## Rank Orders by Order Value

SELECT
    Order_ID,
    Order_Value,
    RANK()
    OVER(
        ORDER BY Order_Value DESC
    ) AS Order_Rank
FROM `order_delivery_performance_dataset (2)`;

## Dense Rank by Processing Time

SELECT
    Order_ID,
    Processing_Time_Hours,
    DENSE_RANK()
    OVER(
        ORDER BY Processing_Time_Hours DESC
    ) AS Processing_Rank
FROM `order_delivery_performance_dataset (2)`;

## Row Number by Order Date

SELECT
    Order_ID,
    Order_Date,
    ROW_NUMBER()
    OVER(
        ORDER BY Order_Date
    ) AS Row_Num
FROM `order_delivery_performance_dataset (2)`; 

## Previous Processing Time (LAG)

SELECT
    Order_ID,
    Order_Date,
    Processing_Time_Hours,
    LAG(Processing_Time_Hours)
    OVER(
        ORDER BY Order_Date
    ) AS Previous_Processing_Time
FROM `order_delivery_performance_dataset (2)`;

## Next Processing Time (LEAD)

SELECT
    Order_ID,
    Order_Date,
    Processing_Time_Hours,
    LEAD(Processing_Time_Hours)
    OVER(
        ORDER BY Order_Date
    ) AS Next_Processing_Time
FROM `order_delivery_performance_dataset (2)`;

## Difference from Previous Processing Time

SELECT
    Order_ID,
    Order_Date,
    Processing_Time_Hours,
    Processing_Time_Hours -
    LAG(Processing_Time_Hours)
    OVER(
        ORDER BY Order_Date
    ) AS Difference_From_Previous
FROM `order_delivery_performance_dataset (2)`;


/* SQL Folder

## This folder contains all SQL scripts used in the Order Delivery Performance Analysis project.

## Files

### 01_Create_Views.sql
## Creates SQL views for key business KPIs:
- Total Sales
- Delivery Performance
- Region Performance
- Product Category Performance
- On-Time Delivery Rate

### 02_Window_Functions.sql
Implements SQL window functions including:
- Running Total
- RANK()
- DENSE_RANK()
- ROW_NUMBER()
- LAG()
- LEAD()

### 03_KPI_Queries.sql
Contains KPI queries for:
- Total Orders
- Total Revenue
- Shipping Cost
- Average Order Value
- Delivery Performance
- Region-wise Revenue
- Product Category Revenue

## Database
- SQL Server / MySQL 8.0+ / PostgreSQL (window function compatible)

## Table Used
Order_Delivery_Performance

## KPIs Covered
- Total Orders
- Total Revenue
- Shipping Cost
- Average Order Value
- Delivery Status Analysis
- Region-wise Performance
- Product Category Performance
- Running Sales
- Order Ranking
- Processing Time Comparison */
