USE Chocolate_Manufacturing_DW;
GO

/*============================================================
07_Final_Check_Deliveries.sql
============================================================*/

------------------------------------------------------------
-- 1. Compare Stage vs Master
------------------------------------------------------------
SELECT

(SELECT COUNT(*) FROM staging.Deliveries_Stage) AS Stage_Count,

(SELECT COUNT(*) FROM master.Deliveries_Master) AS Master_Count,

(SELECT COUNT(*) FROM staging.Deliveries_Stage)
-
(SELECT COUNT(*) FROM master.Deliveries_Master) AS Difference;
GO

------------------------------------------------------------
-- 2. Distinct Delivery IDs
------------------------------------------------------------
SELECT
COUNT(DISTINCT Delivery_ID) AS Distinct_Deliveries
FROM master.Deliveries_Master;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Delivery_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Delivery_ID,

SUM(CASE WHEN Shipment_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Shipment,

SUM(CASE WHEN Customer_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Customer,

SUM(CASE WHEN Delivery_Date IS NULL THEN 1 ELSE 0 END) AS Missing_Delivery_Date

FROM master.Deliveries_Master;
GO

------------------------------------------------------------
-- 4. Delivery Statistics
------------------------------------------------------------
SELECT

MIN(Delivered_Qty) AS Min_Delivered_Qty,
MAX(Delivered_Qty) AS Max_Delivered_Qty,
AVG(Delivered_Qty) AS Avg_Delivered_Qty,

MIN(Return_Qty) AS Min_Return_Qty,
MAX(Return_Qty) AS Max_Return_Qty,
AVG(Return_Qty) AS Avg_Return_Qty,

MIN(Delivery_Cost_USD) AS Min_Delivery_Cost,
MAX(Delivery_Cost_USD) AS Max_Delivery_Cost,
AVG(Delivery_Cost_USD) AS Avg_Delivery_Cost

FROM master.Deliveries_Master;
GO

------------------------------------------------------------
-- 5. Date Range
------------------------------------------------------------
SELECT

MIN(Delivery_Date) AS First_Delivery_Date,

MAX(Delivery_Date) AS Last_Delivery_Date,

MIN(Delivery_DateTime) AS First_Delivery_DateTime,

MAX(Delivery_DateTime) AS Last_Delivery_DateTime

FROM master.Deliveries_Master;
GO

------------------------------------------------------------
-- 6. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Deliveries_Master
ORDER BY Delivery_ID;
GO