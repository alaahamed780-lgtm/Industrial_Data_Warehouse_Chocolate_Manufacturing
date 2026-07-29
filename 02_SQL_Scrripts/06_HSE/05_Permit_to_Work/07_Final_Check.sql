USE Chocolate_Manufacturing_DW;
GO

/*============================================================
07_Final_Check_Permit_to_Work.sql
============================================================*/

------------------------------------------------------------
-- 1. Compare Stage vs Master
------------------------------------------------------------
SELECT

(SELECT COUNT(*) FROM staging.Permit_to_Work_Stage) AS Stage_Count,

(SELECT COUNT(*) FROM master.Permit_to_Work_Master) AS Master_Count,

(SELECT COUNT(*) FROM staging.Permit_to_Work_Stage)
-
(SELECT COUNT(*) FROM master.Permit_to_Work_Master) AS Difference;
GO

------------------------------------------------------------
-- 2. Distinct Permits
------------------------------------------------------------
SELECT
COUNT(DISTINCT Permit_ID) AS Distinct_Permits
FROM master.Permit_to_Work_Master;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Permit_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Permit_ID,

SUM(CASE WHEN Issue_Date IS NULL THEN 1 ELSE 0 END) AS Missing_Issue_Date,

SUM(CASE WHEN Permit_Type IS NULL THEN 1 ELSE 0 END) AS Missing_Permit_Type,

SUM(CASE WHEN Permit_Status IS NULL THEN 1 ELSE 0 END) AS Missing_Permit_Status

FROM master.Permit_to_Work_Master;
GO

------------------------------------------------------------
-- 4. Permit Summary
------------------------------------------------------------
SELECT

COUNT(*) AS Total_Permits,

COUNT(DISTINCT Permit_Type) AS Permit_Types,

COUNT(DISTINCT Department) AS Departments,

COUNT(DISTINCT Permit_Status) AS Permit_Statuses,

COUNT(DISTINCT Plant) AS Plants

FROM master.Permit_to_Work_Master;
GO

------------------------------------------------------------
-- 5. Date Range
------------------------------------------------------------
SELECT

MIN(Issue_Date) AS First_Issue_Date,

MAX(Issue_Date) AS Last_Issue_Date,

MIN(Start_DateTime) AS First_Start,

MAX(Start_DateTime) AS Last_Start

FROM master.Permit_to_Work_Master;
GO

------------------------------------------------------------
-- 6. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Permit_to_Work_Master
ORDER BY Permit_ID;
GO