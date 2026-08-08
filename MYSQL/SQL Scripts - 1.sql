SELECT * FROM order_delivery_db.`order_delivery_performance_dataset (2)`;

UPDATE `order_delivery_performance_dataset (2)`
SET Cancellation_Reason = 'Not Applicable'
WHERE Cancellation_Reason = "";

UPDATE `order_delivery_performance_dataset (2)`
SET Delivery_Time_Days = 0
WHERE Delivery_Time_Days IS NULL;

UPDATE `order_delivery_performance_dataset (2)`
SET
Order_Date = STR_TO_DATE(Order_Date,'%Y-%m-%d'),
Shipping_Date = STR_TO_DATE(Shipping_Date,'%Y-%m-%d'),
Expected_Delivery_Date = STR_TO_DATE(Expected_Delivery_Date,'%Y-%m-%d'),
Actual_Delivery_Date = STR_TO_DATE(Actual_Delivery_Date,'%Y-%m-%d');

SELECT * FROM `order_delivery_performance_dataset (2)`;


