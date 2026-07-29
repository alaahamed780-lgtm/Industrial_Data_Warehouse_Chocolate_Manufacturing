USE Chocolate_Manufacturing_DW;
GO

/*============================================================
07_Final_Check_Inventory_Balance.sql
============================================================*/

------------------------------------------------------------
-- 1. Compare Stage vs Master
------------------------------------------------------------
SELECT

(SELECT COUNT(*) FROM staging.Inventory_Balance_Stage) AS Stage_Count,

(SELECT COUNT(*) FROM master.Inventory_Balance_Master) AS Master_Count,

(SELECT COUNT(*) FROM staging.Inventory_Balance_Stage)
-
(SELECT COUNT(*) FROM master.Inventory_Balance_Master) AS Difference;
GO

------------------------------------------------------------
-- 2. Distinct Inventory IDs
------------------------------------------------------------
SELECT
COUNT(DISTINCT Inventory_Balance_ID) AS Distinct_Inventory
FROM master.Inventory_Balance_Master;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Inventory_Balance_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Inventory_ID,

SUM(CASE WHEN Warehouse IS NULL THEN 1 ELSE 0 END) AS Missing_Warehouse,

SUM(CASE WHEN Quantity_On_Hand IS NULL THEN 1 ELSE 0 END) AS Missing_Qty

FROM master.Inventory_Balance_Master;
GO

------------------------------------------------------------
-- 4. Inventory Statistics
------------------------------------------------------------
SELECT

MIN(Quantity_On_Hand) AS Min_Qty,
MAX(Quantity_On_Hand) AS Max_Qty,
AVG(Quantity_On_Hand) AS Avg_Qty,

MIN(Inventory_Value_USD) AS Min_Value,
MAX(Inventory_Value_USD) AS Max_Value,
AVG(Inventory_Value_USD) AS Avg_Value

FROM master.Inventory_Balance_Master;
GO

------------------------------------------------------------
-- 5. Date Range
------------------------------------------------------------
SELECT

MIN(Snapshot_Date) AS First_Snapshot,
MAX(Snapshot_Date) AS Last_Snapshot

FROM master.Inventory_Balance_Master;
GO

------------------------------------------------------------
-- 6. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Inventory_Balance_Master
ORDER BY Inventory_Balance_ID;
GO