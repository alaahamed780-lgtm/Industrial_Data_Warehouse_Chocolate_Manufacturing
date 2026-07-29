USE Chocolate_Manufacturing_DW;
GO

/*============================================================
06_Check_Safety_Training_Master.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM master.Safety_Training_Master;
GO

------------------------------------------------------------
-- 2. Preview Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Safety_Training_Master
ORDER BY Training_Record_ID;
GO

------------------------------------------------------------
-- 3. Missing Primary Key
------------------------------------------------------------
SELECT COUNT(*) AS Missing_Training_Record_ID
FROM master.Safety_Training_Master
WHERE Training_Record_ID IS NULL;
GO

------------------------------------------------------------
-- 4. Duplicate Training Records
------------------------------------------------------------
SELECT
    Training_Record_ID,
    COUNT(*) AS DuplicateCount
FROM master.Safety_Training_Master
GROUP BY Training_Record_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 5. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Employee_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Employee_ID,

SUM(CASE WHEN Training_Date IS NULL THEN 1 ELSE 0 END) AS Missing_Training_Date,

SUM(CASE WHEN Training_Course IS NULL THEN 1 ELSE 0 END) AS Missing_Training_Course,

SUM(CASE WHEN Pass_Status IS NULL THEN 1 ELSE 0 END) AS Missing_Pass_Status

FROM master.Safety_Training_Master;
GO

------------------------------------------------------------
-- 6. Business Rule Validation
------------------------------------------------------------
SELECT *
FROM master.Safety_Training_Master
WHERE

Certificate_Expiry_Date < Certificate_Issue_Date

OR

Next_Training_Date < Training_Date;
GO

------------------------------------------------------------
-- 7. Summary Statistics
------------------------------------------------------------
SELECT

COUNT(*) AS Total_Training_Records,

COUNT(CASE WHEN Retraining_Required = 1 THEN 1 END) AS Retraining_Required_Count,

COUNT(DISTINCT Training_Category) AS Training_Categories,

COUNT(DISTINCT Training_Method) AS Training_Methods,

COUNT(DISTINCT Pass_Status) AS Pass_Statuses

FROM master.Safety_Training_Master;
GO