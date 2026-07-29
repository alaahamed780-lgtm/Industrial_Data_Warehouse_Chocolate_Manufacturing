USE Chocolate_Manufacturing_DW;
GO

/*============================================================
06_Check_Deliveries_Master.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM master.Deliveries_Master;
GO

------------------------------------------------------------
-- 2. Preview Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Deliveries_Master
ORDER BY Delivery_ID;
GO

------------------------------------------------------------
-- 3. Missing Primary Key
------------------------------------------------------------
SELECT COUNT(*) AS Missing_Delivery_ID
FROM master.Deliveries_Master
WHERE Delivery_ID IS NULL;
GO

------------------------------------------------------------
-- 4. Duplicate Delivery IDs
------------------------------------------------------------
SELECT
    Delivery_ID,
    COUNT(*) AS DuplicateCount
FROM master.Deliveries_Master
GROUP BY Delivery_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 5. Duplicate Delivery Numbers
------------------------------------------------------------
SELECT
    Delivery_Number,
    COUNT(*) AS DuplicateCount
FROM master.Deliveries_Master
GROUP BY Delivery_Number
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 6. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Shipment_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Shipment,

SUM(CASE WHEN Customer_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Customer,

SUM(CASE WHEN Delivery_Date IS NULL THEN 1 ELSE 0 END) AS Missing_Delivery_Date,

SUM(CASE WHEN Delivery_Status IS NULL THEN 1 ELSE 0 END) AS Missing_Delivery_Status

FROM master.Deliveries_Master;
GO

------------------------------------------------------------
-- 7. Invalid Numeric Values
------------------------------------------------------------
SELECT *
FROM master.Deliveries_Master
WHERE Delivery_Time_Min < 0
   OR Delivered_Qty < 0
   OR Rejected_Qty < 0
   OR Return_Qty < 0
   OR Freight_Cost_USD < 0
   OR Delivery_Cost_USD < 0;
GO

------------------------------------------------------------
-- 8. Summary Statistics
------------------------------------------------------------
SELECT

MIN(Delivered_Qty) AS Min_Delivered_Qty,
MAX(Delivered_Qty) AS Max_Delivered_Qty,
AVG(Delivered_Qty) AS Avg_Delivered_Qty,

MIN(Delivery_Time_Min) AS Min_Delivery_Time,
MAX(Delivery_Time_Min) AS Max_Delivery_Time,
AVG(Delivery_Time_Min) AS Avg_Delivery_Time,

MIN(Delivery_Cost_USD) AS Min_Delivery_Cost,
MAX(Delivery_Cost_USD) AS Max_Delivery_Cost,
AVG(Delivery_Cost_USD) AS Avg_Delivery_Cost

FROM master.Deliveries_Master;
GO