USE Chocolate_Manufacturing_DW;
GO

/*============================================================
06_Check_Cost_Centers_Master.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM master.Cost_Centers_Master;
GO

------------------------------------------------------------
-- 2. Preview Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Cost_Centers_Master
ORDER BY Cost_Center_ID;
GO

------------------------------------------------------------
-- 3. Missing Primary Key
------------------------------------------------------------
SELECT COUNT(*) AS Missing_Cost_Center_ID
FROM master.Cost_Centers_Master
WHERE Cost_Center_ID IS NULL;
GO

------------------------------------------------------------
-- 4. Duplicate Cost Center IDs
------------------------------------------------------------
SELECT
    Cost_Center_ID,
    COUNT(*) AS DuplicateCount
FROM master.Cost_Centers_Master
GROUP BY Cost_Center_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 5. Duplicate Cost Center Codes
------------------------------------------------------------
SELECT
    Cost_Center_Code,
    COUNT(*) AS DuplicateCount
FROM master.Cost_Centers_Master
GROUP BY Cost_Center_Code
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 6. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Cost_Center_Name IS NULL THEN 1 ELSE 0 END) AS Missing_Name,

SUM(CASE WHEN Department IS NULL THEN 1 ELSE 0 END) AS Missing_Department,

SUM(CASE WHEN Plant IS NULL THEN 1 ELSE 0 END) AS Missing_Plant,

SUM(CASE WHEN Annual_Budget_USD IS NULL THEN 1 ELSE 0 END) AS Missing_Budget

FROM master.Cost_Centers_Master;
GO

------------------------------------------------------------
-- 7. Invalid Values
------------------------------------------------------------
SELECT *
FROM master.Cost_Centers_Master
WHERE Annual_Budget_USD < 0;
GO

------------------------------------------------------------
-- 8. Summary Statistics
------------------------------------------------------------
SELECT

MIN(Annual_Budget_USD) AS Min_Budget,
MAX(Annual_Budget_USD) AS Max_Budget,
AVG(Annual_Budget_USD) AS Avg_Budget

FROM master.Cost_Centers_Master;
GO