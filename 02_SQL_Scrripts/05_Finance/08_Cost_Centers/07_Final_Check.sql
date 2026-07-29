USE Chocolate_Manufacturing_DW;
GO

/*============================================================
07_Final_Check_Cost_Centers.sql
============================================================*/

------------------------------------------------------------
-- 1. Compare Stage vs Master
------------------------------------------------------------
SELECT

(SELECT COUNT(*) FROM staging.Cost_Centers_Stage) AS Stage_Count,

(SELECT COUNT(*) FROM master.Cost_Centers_Master) AS Master_Count,

(SELECT COUNT(*) FROM staging.Cost_Centers_Stage)
-
(SELECT COUNT(*) FROM master.Cost_Centers_Master) AS Difference;
GO

------------------------------------------------------------
-- 2. Distinct Cost Centers
------------------------------------------------------------
SELECT
COUNT(DISTINCT Cost_Center_ID) AS Distinct_Cost_Centers
FROM master.Cost_Centers_Master;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Cost_Center_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Cost_Center_ID,

SUM(CASE WHEN Cost_Center_Name IS NULL THEN 1 ELSE 0 END) AS Missing_Cost_Center_Name,

SUM(CASE WHEN Department IS NULL THEN 1 ELSE 0 END) AS Missing_Department,

SUM(CASE WHEN Annual_Budget_USD IS NULL THEN 1 ELSE 0 END) AS Missing_Budget

FROM master.Cost_Centers_Master;
GO

------------------------------------------------------------
-- 4. Budget Statistics
------------------------------------------------------------
SELECT

MIN(Annual_Budget_USD) AS Min_Budget,
MAX(Annual_Budget_USD) AS Max_Budget,
AVG(Annual_Budget_USD) AS Avg_Budget

FROM master.Cost_Centers_Master;
GO

------------------------------------------------------------
-- 5. Date Range
------------------------------------------------------------
SELECT

MIN(Start_Date) AS First_Start_Date,

MAX(Start_Date) AS Last_Start_Date,

MIN(End_Date) AS First_End_Date,

MAX(End_Date) AS Last_End_Date

FROM master.Cost_Centers_Master;
GO

------------------------------------------------------------
-- 6. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Cost_Centers_Master
ORDER BY Cost_Center_ID;
GO