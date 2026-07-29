USE Chocolate_Manufacturing_DW;
GO

/*============================================================
07_Final_Check_Near_Miss_Reports.sql
============================================================*/

------------------------------------------------------------
-- 1. Compare Stage vs Master
------------------------------------------------------------
SELECT

(SELECT COUNT(*) FROM staging.Near_Miss_Reports_Stage) AS Stage_Count,

(SELECT COUNT(*) FROM master.Near_Miss_Reports_Master) AS Master_Count,

(SELECT COUNT(*) FROM staging.Near_Miss_Reports_Stage)
-
(SELECT COUNT(*) FROM master.Near_Miss_Reports_Master) AS Difference;
GO

------------------------------------------------------------
-- 2. Distinct Near Miss Records
------------------------------------------------------------
SELECT
COUNT(DISTINCT Near_Miss_ID) AS Distinct_Near_Miss_Reports
FROM master.Near_Miss_Reports_Master;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Near_Miss_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Near_Miss_ID,

SUM(CASE WHEN Report_Date IS NULL THEN 1 ELSE 0 END) AS Missing_Report_Date,

SUM(CASE WHEN Department IS NULL THEN 1 ELSE 0 END) AS Missing_Department,

SUM(CASE WHEN Hazard_Category IS NULL THEN 1 ELSE 0 END) AS Missing_Hazard_Category

FROM master.Near_Miss_Reports_Master;
GO

------------------------------------------------------------
-- 4. Near Miss Summary
------------------------------------------------------------
SELECT

COUNT(*) AS Total_Reports,

COUNT(DISTINCT Department) AS Departments,

COUNT(DISTINCT Hazard_Category) AS Hazard_Categories,

COUNT(DISTINCT Potential_Severity) AS Severity_Levels,

COUNT(DISTINCT Plant) AS Plants

FROM master.Near_Miss_Reports_Master;
GO

------------------------------------------------------------
-- 5. Date Range
------------------------------------------------------------
SELECT

MIN(Report_Date) AS First_Report_Date,

MAX(Report_Date) AS Last_Report_Date,

MIN(Target_Close_Date) AS First_Target_Close_Date,

MAX(Target_Close_Date) AS Last_Target_Close_Date

FROM master.Near_Miss_Reports_Master;
GO

------------------------------------------------------------
-- 6. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Near_Miss_Reports_Master
ORDER BY Near_Miss_ID;
GO