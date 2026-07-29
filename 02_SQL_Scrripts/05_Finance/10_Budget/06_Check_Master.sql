USE Chocolate_Manufacturing_DW;
GO

/*============================================================
06_Check_Budget_Master.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM master.Budget_Master;
GO

------------------------------------------------------------
-- 2. Preview Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Budget_Master
ORDER BY Budget_ID;
GO

------------------------------------------------------------
-- 3. Missing Primary Key
------------------------------------------------------------
SELECT COUNT(*) AS Missing_Budget_ID
FROM master.Budget_Master
WHERE Budget_ID IS NULL;
GO

------------------------------------------------------------
-- 4. Duplicate Budget IDs
------------------------------------------------------------
SELECT
    Budget_ID,
    COUNT(*) AS DuplicateCount
FROM master.Budget_Master
GROUP BY Budget_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 5. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Cost_Center_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Cost_Center,

SUM(CASE WHEN GL_Account_ID IS NULL THEN 1 ELSE 0 END) AS Missing_GL_Account,

SUM(CASE WHEN Budget_Amount_USD IS NULL THEN 1 ELSE 0 END) AS Missing_Budget,

SUM(CASE WHEN Fiscal_Year IS NULL THEN 1 ELSE 0 END) AS Missing_Fiscal_Year

FROM master.Budget_Master;
GO

------------------------------------------------------------
-- 6. Invalid Values
------------------------------------------------------------
SELECT *
FROM master.Budget_Master
WHERE Budget_Amount_USD < 0
   OR Committed_Amount_USD < 0
   OR Actual_Amount_USD < 0;
GO

------------------------------------------------------------
-- 7. Summary Statistics
------------------------------------------------------------
SELECT

MIN(Budget_Amount_USD) AS Min_Budget,
MAX(Budget_Amount_USD) AS Max_Budget,
AVG(Budget_Amount_USD) AS Avg_Budget,

MIN(Actual_Amount_USD) AS Min_Actual,
MAX(Actual_Amount_USD) AS Max_Actual,
AVG(Actual_Amount_USD) AS Avg_Actual,

MIN(Variance_USD) AS Min_Variance,
MAX(Variance_USD) AS Max_Variance,
AVG(Variance_USD) AS Avg_Variance

FROM master.Budget_Master;
GO