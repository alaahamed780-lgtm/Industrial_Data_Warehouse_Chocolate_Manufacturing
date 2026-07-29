USE Chocolate_Manufacturing_DW;
GO

/*============================================================
07_Final_Check_Goods_Issue.sql
============================================================*/

------------------------------------------------------------
-- 1. Stage vs Master
------------------------------------------------------------
SELECT

(SELECT COUNT(*) FROM staging.Goods_Issue_Stage) AS Stage_Count,

(SELECT COUNT(*) FROM master.Goods_Issue_Master) AS Master_Count,

(SELECT COUNT(*) FROM staging.Goods_Issue_Stage)
-
(SELECT COUNT(*) FROM master.Goods_Issue_Master) AS Difference;
GO

------------------------------------------------------------
-- 2. Distinct IDs
------------------------------------------------------------
SELECT
COUNT(DISTINCT Goods_Issue_ID) AS Distinct_Goods_Issue
FROM master.Goods_Issue_Master;
GO

------------------------------------------------------------
-- 3. Missing Values
------------------------------------------------------------
SELECT

SUM(CASE WHEN Goods_Issue_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Goods_Issue_ID,

SUM(CASE WHEN Quantity IS NULL THEN 1 ELSE 0 END) AS Missing_Quantity,

SUM(CASE WHEN Warehouse IS NULL THEN 1 ELSE 0 END) AS Missing_Warehouse

FROM master.Goods_Issue_Master;
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

FROM master.Goods_Issue_Master;
GO

------------------------------------------------------------
-- 5. Date Range
------------------------------------------------------------
SELECT

MIN(Issue_Date) AS First_Issue,
MAX(Issue_Date) AS Last_Issue

FROM master.Goods_Issue_Master;
GO

------------------------------------------------------------
-- 6. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Goods_Issue_Master
ORDER BY Goods_Issue_ID;
GO