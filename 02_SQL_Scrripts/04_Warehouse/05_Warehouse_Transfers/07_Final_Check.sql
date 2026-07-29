USE Chocolate_Manufacturing_DW;
GO

/*============================================================
07_Final_Check_Warehouse_Transfers.sql
============================================================*/

------------------------------------------------------------
-- 1. Compare Stage vs Master
------------------------------------------------------------
SELECT

(SELECT COUNT(*) FROM staging.Warehouse_Transfers_Stage) AS Stage_Count,

(SELECT COUNT(*) FROM master.Warehouse_Transfers_Master) AS Master_Count,

(SELECT COUNT(*) FROM staging.Warehouse_Transfers_Stage)
-
(SELECT COUNT(*) FROM master.Warehouse_Transfers_Master) AS Difference;
GO

------------------------------------------------------------
-- 2. Distinct Transfer IDs
------------------------------------------------------------
SELECT
COUNT(DISTINCT Warehouse_Transfer_ID) AS Distinct_Transfers
FROM master.Warehouse_Transfers_Master;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Warehouse_Transfer_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Transfer_ID,

SUM(CASE WHEN Quantity IS NULL THEN 1 ELSE 0 END) AS Missing_Quantity,

SUM(CASE WHEN From_Warehouse IS NULL THEN 1 ELSE 0 END) AS Missing_From_Warehouse,

SUM(CASE WHEN To_Warehouse IS NULL THEN 1 ELSE 0 END) AS Missing_To_Warehouse

FROM master.Warehouse_Transfers_Master;
GO

------------------------------------------------------------
-- 4. Cost Statistics
------------------------------------------------------------
SELECT

MIN(Unit_Cost_USD) AS Min_Unit_Cost,
MAX(Unit_Cost_USD) AS Max_Unit_Cost,
AVG(Unit_Cost_USD) AS Avg_Unit_Cost,

MIN(Extended_Cost_USD) AS Min_Total_Cost,
MAX(Extended_Cost_USD) AS Max_Total_Cost,
AVG(Extended_Cost_USD) AS Avg_Total_Cost

FROM master.Warehouse_Transfers_Master;
GO

------------------------------------------------------------
-- 5. Date Range
------------------------------------------------------------
SELECT

MIN(Transfer_Date) AS First_Transfer,
MAX(Transfer_Date) AS Last_Transfer

FROM master.Warehouse_Transfers_Master;
GO

------------------------------------------------------------
-- 6. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Warehouse_Transfers_Master
ORDER BY Warehouse_Transfer_ID;
GO