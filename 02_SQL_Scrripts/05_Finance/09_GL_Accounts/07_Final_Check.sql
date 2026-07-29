USE Chocolate_Manufacturing_DW;
GO

/*============================================================
07_Final_Check_GL_Accounts.sql
============================================================*/

------------------------------------------------------------
-- 1. Compare Stage vs Master
------------------------------------------------------------
SELECT

(SELECT COUNT(*) FROM staging.GL_Accounts_Stage) AS Stage_Count,

(SELECT COUNT(*) FROM master.GL_Accounts_Master) AS Master_Count,

(SELECT COUNT(*) FROM staging.GL_Accounts_Stage)
-
(SELECT COUNT(*) FROM master.GL_Accounts_Master) AS Difference;
GO

------------------------------------------------------------
-- 2. Distinct Accounts
------------------------------------------------------------
SELECT
COUNT(DISTINCT GL_Account_ID) AS Distinct_GL_Accounts
FROM master.GL_Accounts_Master;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN GL_Account_ID IS NULL THEN 1 ELSE 0 END) AS Missing_GL_Account_ID,

SUM(CASE WHEN Account_Name IS NULL THEN 1 ELSE 0 END) AS Missing_Account_Name,

SUM(CASE WHEN Cost_Center_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Cost_Center,

SUM(CASE WHEN Currency IS NULL THEN 1 ELSE 0 END) AS Missing_Currency

FROM master.GL_Accounts_Master;
GO

------------------------------------------------------------
-- 4. Summary
------------------------------------------------------------
SELECT

COUNT(*) AS Total_Accounts,

COUNT(DISTINCT Account_Type) AS Account_Types,

COUNT(DISTINCT Account_Category) AS Categories,

COUNT(DISTINCT Cost_Center_ID) AS Cost_Centers,

COUNT(DISTINCT Currency) AS Currencies

FROM master.GL_Accounts_Master;
GO

------------------------------------------------------------
-- 5. Date Range
------------------------------------------------------------
SELECT

MIN(Created_Date) AS First_Created_Date,

MAX(Created_Date) AS Last_Created_Date

FROM master.GL_Accounts_Master;
GO

------------------------------------------------------------
-- 6. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.GL_Accounts_Master
ORDER BY GL_Account_ID;
GO