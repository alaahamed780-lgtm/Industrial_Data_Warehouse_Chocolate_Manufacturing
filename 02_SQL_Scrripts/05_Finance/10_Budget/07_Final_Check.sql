USE Chocolate_Manufacturing_DW;
GO

/*============================================================
07_Final_Check_Budget.sql
============================================================*/

------------------------------------------------------------
-- 1. Compare Stage vs Master
------------------------------------------------------------
SELECT

(SELECT COUNT(*) FROM staging.Budget_Stage) AS Stage_Count,

(SELECT COUNT(*) FROM master.Budget_Master) AS Master_Count,

(SELECT COUNT(*) FROM staging.Budget_Stage)
-
(SELECT COUNT(*) FROM master.Budget_Master) AS Difference;
GO

------------------------------------------------------------
-- 2. Distinct Budget Records
------------------------------------------------------------
SELECT
COUNT(DISTINCT Budget_ID) AS Distinct_Budgets
FROM master.Budget_Master;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Budget_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Budget_ID,

SUM(CASE WHEN Cost_Center_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Cost_Center,

SUM(CASE WHEN GL_Account_ID IS NULL THEN 1 ELSE 0 END) AS Missing_GL_Account,

SUM(CASE WHEN Budget_Amount_USD IS NULL THEN 1 ELSE 0 END) AS Missing_Budget

FROM master.Budget_Master;
GO

------------------------------------------------------------
-- 4. Financial Summary
------------------------------------------------------------
SELECT

COUNT(*) AS Total_Budget_Records,

COUNT(DISTINCT Fiscal_Year) AS Fiscal_Years,

COUNT(DISTINCT Fiscal_Period) AS Fiscal_Periods,

COUNT(DISTINCT Budget_Type) AS Budget_Types,

COUNT(DISTINCT Cost_Center_ID) AS Cost_Centers

FROM master.Budget_Master;
GO

------------------------------------------------------------
-- 5. Date Range
------------------------------------------------------------
SELECT

MIN(Created_Date) AS First_Created_Date,

MAX(Created_Date) AS Last_Created_Date,

MIN(Approval_Date) AS First_Approval_Date,

MAX(Approval_Date) AS Last_Approval_Date

FROM master.Budget_Master;
GO

------------------------------------------------------------
-- 6. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Budget_Master
ORDER BY Budget_ID;
GO