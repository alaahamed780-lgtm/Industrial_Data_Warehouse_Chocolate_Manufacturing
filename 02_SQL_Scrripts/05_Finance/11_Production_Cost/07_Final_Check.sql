USE Chocolate_Manufacturing_DW;
GO

/*============================================================
07_Final_Check_Production_Cost.sql
============================================================*/

------------------------------------------------------------
-- 1. Compare Stage vs Master
------------------------------------------------------------
SELECT

(SELECT COUNT(*) FROM staging.Production_Cost_Stage) AS Stage_Count,

(SELECT COUNT(*) FROM master.Production_Cost_Master) AS Master_Count,

(SELECT COUNT(*) FROM staging.Production_Cost_Stage)
-
(SELECT COUNT(*) FROM master.Production_Cost_Master) AS Difference;
GO

------------------------------------------------------------
-- 2. Distinct Production Cost Records
------------------------------------------------------------
SELECT
COUNT(DISTINCT Production_Cost_ID) AS Distinct_Production_Costs
FROM master.Production_Cost_Master;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Production_Cost_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Production_Cost_ID,

SUM(CASE WHEN Production_Order_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Production_Order,

SUM(CASE WHEN Product_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Product,

SUM(CASE WHEN Cost_Center_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Cost_Center

FROM master.Production_Cost_Master;
GO

------------------------------------------------------------
-- 4. Production Cost Summary
------------------------------------------------------------
SELECT

COUNT(*) AS Total_Records,

COUNT(DISTINCT Cost_Center_ID) AS Cost_Centers,

COUNT(DISTINCT GL_Account_ID) AS GL_Accounts,

COUNT(DISTINCT Product_ID) AS Products,

COUNT(DISTINCT Plant) AS Plants

FROM master.Production_Cost_Master;
GO

------------------------------------------------------------
-- 5. Date Range
------------------------------------------------------------
SELECT

MIN(Cost_Date) AS First_Cost_Date,

MAX(Cost_Date) AS Last_Cost_Date

FROM master.Production_Cost_Master;
GO

------------------------------------------------------------
-- 6. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Production_Cost_Master
ORDER BY Production_Cost_ID;
GO