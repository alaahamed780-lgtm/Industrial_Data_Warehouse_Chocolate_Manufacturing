USE Chocolate_Manufacturing_DW;
GO

/*============================================================
07_Final_Check_Sales_Orders.sql
============================================================*/

------------------------------------------------------------
-- 1. Compare Stage vs Master
------------------------------------------------------------
SELECT

(SELECT COUNT(*) FROM staging.Sales_Orders_Stage) AS Stage_Count,

(SELECT COUNT(*) FROM master.Sales_Orders_Master) AS Master_Count,

(SELECT COUNT(*) FROM staging.Sales_Orders_Stage)
-
(SELECT COUNT(*) FROM master.Sales_Orders_Master) AS Difference;
GO

------------------------------------------------------------
-- 2. Distinct Sales Orders
------------------------------------------------------------
SELECT
COUNT(DISTINCT Sales_Order_ID) AS Distinct_Sales_Orders
FROM master.Sales_Orders_Master;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Sales_Order_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Order_ID,

SUM(CASE WHEN Customer_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Customer,

SUM(CASE WHEN Order_Date IS NULL THEN 1 ELSE 0 END) AS Missing_Order_Date,

SUM(CASE WHEN Grand_Total_USD IS NULL THEN 1 ELSE 0 END) AS Missing_Grand_Total

FROM master.Sales_Orders_Master;
GO

------------------------------------------------------------
-- 4. Financial Statistics
------------------------------------------------------------
SELECT

MIN(Net_Amount_USD) AS Min_Net,
MAX(Net_Amount_USD) AS Max_Net,
AVG(Net_Amount_USD) AS Avg_Net,

MIN(Discount_USD) AS Min_Discount,
MAX(Discount_USD) AS Max_Discount,
AVG(Discount_USD) AS Avg_Discount,

MIN(Tax_USD) AS Min_Tax,
MAX(Tax_USD) AS Max_Tax,
AVG(Tax_USD) AS Avg_Tax,

MIN(Grand_Total_USD) AS Min_Total,
MAX(Grand_Total_USD) AS Max_Total,
AVG(Grand_Total_USD) AS Avg_Total

FROM master.Sales_Orders_Master;
GO

------------------------------------------------------------
-- 5. Date Range
------------------------------------------------------------
SELECT

MIN(Order_Date) AS First_Order_Date,

MAX(Order_Date) AS Last_Order_Date,

MIN(Requested_Delivery_Date) AS First_Requested_Delivery,

MAX(Requested_Delivery_Date) AS Last_Requested_Delivery

FROM master.Sales_Orders_Master;
GO

------------------------------------------------------------
-- 6. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Sales_Orders_Master
ORDER BY Sales_Order_ID;
GO