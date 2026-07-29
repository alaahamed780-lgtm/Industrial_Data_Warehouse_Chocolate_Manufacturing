USE Chocolate_Manufacturing_DW;
GO

/*============================================================
06_Check_Permit_to_Work_Master.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM master.Permit_to_Work_Master;
GO

------------------------------------------------------------
-- 2. Preview Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Permit_to_Work_Master
ORDER BY Permit_ID;
GO

------------------------------------------------------------
-- 3. Missing Primary Key
------------------------------------------------------------
SELECT COUNT(*) AS Missing_Permit_ID
FROM master.Permit_to_Work_Master
WHERE Permit_ID IS NULL;
GO

------------------------------------------------------------
-- 4. Duplicate Permit IDs
------------------------------------------------------------
SELECT
    Permit_ID,
    COUNT(*) AS DuplicateCount
FROM master.Permit_to_Work_Master
GROUP BY Permit_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 5. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Issue_Date IS NULL THEN 1 ELSE 0 END) AS Missing_Issue_Date,

SUM(CASE WHEN Permit_Type IS NULL THEN 1 ELSE 0 END) AS Missing_Permit_Type,

SUM(CASE WHEN Permit_Status IS NULL THEN 1 ELSE 0 END) AS Missing_Permit_Status,

SUM(CASE WHEN Department IS NULL THEN 1 ELSE 0 END) AS Missing_Department

FROM master.Permit_to_Work_Master;
GO

------------------------------------------------------------
-- 6. Business Rule Validation
------------------------------------------------------------
SELECT *
FROM master.Permit_to_Work_Master
WHERE

End_DateTime < Start_DateTime

OR

Close_DateTime < Issue_DateTime;
GO

------------------------------------------------------------
-- 7. Summary Statistics
------------------------------------------------------------
SELECT

COUNT(*) AS Total_Permits,

COUNT(CASE WHEN Hot_Work = 1 THEN 1 END) AS Hot_Work_Count,

COUNT(CASE WHEN Confined_Space = 1 THEN 1 END) AS Confined_Space_Count,

COUNT(CASE WHEN LOTO_Required = 1 THEN 1 END) AS LOTO_Count,

COUNT(CASE WHEN Gas_Test_Required = 1 THEN 1 END) AS Gas_Test_Count,

COUNT(DISTINCT Permit_Type) AS Permit_Types,

COUNT(DISTINCT Permit_Status) AS Permit_Statuses

FROM master.Permit_to_Work_Master;
GO