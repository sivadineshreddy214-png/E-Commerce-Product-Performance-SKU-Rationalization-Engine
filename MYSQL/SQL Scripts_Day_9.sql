SELECT * FROM order_delivery_db.`order_delivery_performance_dataset (2)`;


SELECT
    Delivery_Status,
    Region,
    Product_Category,
    COUNT(*) AS Total_Orders,
    SUM(Shipping_Cost) AS Total_Shipping_Cost,
    AVG(Shipping_Cost) AS Avg_Shipping_Cost,
    SUM(Order_Value) AS Total_Order_Value,
    AVG(Order_Value) AS Avg_Order_Value
FROM `order_delivery_performance_dataset (2)`
GROUP BY
    Delivery_Status,
    Region,
    Product_Category
ORDER BY
    Region,
    Product_Category;
    
## KPI queries derived from the blueprint

SELECT COUNT(*) AS Total_Orders
FROM `order_delivery_performance_dataset (2)`;

SELECT
    SUM(Order_Value) AS Total_Revenue
FROM `order_delivery_performance_dataset (2)`;

SELECT
    SUM(Shipping_Cost) AS Total_Shipping_Cost
FROM `order_delivery_performance_dataset (2)`;

SELECT
    AVG(Delivery_Time_Days) AS Avg_Delivery_Time
FROM `order_delivery_performance_dataset (2)`;

SELECT
ROUND(
    SUM(CASE
            WHEN Delivery_Status='On-Time' THEN 1
            ELSE 0
        END)*100.0/COUNT(*),2
) AS On_Time_Delivery_Rate
FROM `order_delivery_performance_dataset (2)`;

SELECT
COUNT(*) AS Delayed_Orders
FROM `order_delivery_performance_dataset (2)`
WHERE Delivery_Status='Delayed';

SELECT
ROUND(
    SUM(CASE
            WHEN Cancellation='Yes' THEN 1
            ELSE 0
        END)*100.0/COUNT(*),2
) AS Cancellation_Rate
FROM `order_delivery_performance_dataset (2)`

SELECT
AVG(Customer_Rating) AS Avg_Customer_Rating
FROM `order_delivery_performance_dataset (2)`;

SELECT
Region,
SUM(Order_Value) AS Revenue
FROM `order_delivery_performance_dataset (2)`
GROUP BY Region
ORDER BY Revenue DESC;

SELECT
Product_Category,
SUM(Order_Value) AS Revenue
FROM `order_delivery_performance_dataset (2)`
GROUP BY Product_Category
ORDER BY Revenue DESC;

SELECT
Courier,
SUM(Shipping_Cost) AS Total_Shipping_Cost
FROM `order_delivery_performance_dataset (2)`
GROUP BY Courier
ORDER BY Total_Shipping_Cost DESC;
 
SELECT
AVG(Delay_Days) AS Avg_Delay_Days
FROM `order_delivery_performance_dataset (2)`
WHERE Delay_Days > 0;

