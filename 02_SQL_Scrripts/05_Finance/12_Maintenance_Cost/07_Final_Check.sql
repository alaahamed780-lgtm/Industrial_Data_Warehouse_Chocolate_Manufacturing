USE Chocolate_Manufacturing_DW;
GO

/*============================================================
07_Final_Check_Maintenance_Cost.sql
============================================================*/

------------------------------------------------------------
-- 1. Compare Stage vs Master
------------------------------------------------------------
SELECT

(SELECT COUNT(*) FROM staging.Maintenance_Cost_Stage) AS Stage_Count,

(SELECT COUNT(*) FROM master.Maintenance_Cost_Master) AS Master_Count,

(SELECT COUNT(*) FROM staging.Maintenance_Cost_Stage)
-
(SELECT COUNT(*) FROM master.Maintenance_Cost_Master) AS Difference;
GO

------------------------------------------------------------
-- 2. Distinct Maintenance Cost Records
------------------------------------------------------------
SELECT
COUNT(DISTINCT Maintenance_Cost_ID) AS Distinct_Maintenance_Costs
FROM master.Maintenance_Cost_Master;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Maintenance_Cost_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Maintenance_Cost_ID,

SUM(CASE WHEN Work_Order_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Work_Order,

SUM(CASE WHEN Equipment_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Equipment,

SUM(CASE WHEN Cost_Center_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Cost_Center

FROM master.Maintenance_Cost_Master;
GO

------------------------------------------------------------
-- 4. Maintenance Cost Summary
------------------------------------------------------------
SELECT

COUNT(*) AS Total_Records,

COUNT(DISTINCT Cost_Center_ID) AS Cost_Centers,

COUNT(DISTINCT GL_Account_ID) AS GL_Accounts,

COUNT(DISTINCT Equipment_ID) AS Equipments,

COUNT(DISTINCT Plant) AS Plants

FROM master.Maintenance_Cost_Master;
GO

------------------------------------------------------------
-- 5. Date Range
------------------------------------------------------------
SELECT

MIN(Cost_Date) AS First_Cost_Date,

MAX(Cost_Date) AS Last_Cost_Date

FROM master.Maintenance_Cost_Master;
GO

------------------------------------------------------------
-- 6. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Maintenance_Cost_Master
ORDER BY Maintenance_Cost_ID;
GO