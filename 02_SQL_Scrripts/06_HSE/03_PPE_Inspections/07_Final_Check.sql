USE Chocolate_Manufacturing_DW;
GO

/*============================================================
07_Final_Check_PPE_Inspections.sql
============================================================*/

------------------------------------------------------------
-- 1. Compare Stage vs Master
------------------------------------------------------------
SELECT

(SELECT COUNT(*) FROM staging.PPE_Inspections_Stage) AS Stage_Count,

(SELECT COUNT(*) FROM master.PPE_Inspections_Master) AS Master_Count,

(SELECT COUNT(*) FROM staging.PPE_Inspections_Stage)
-
(SELECT COUNT(*) FROM master.PPE_Inspections_Master) AS Difference;
GO

------------------------------------------------------------
-- 2. Distinct PPE Inspections
------------------------------------------------------------
SELECT
COUNT(DISTINCT PPE_Inspection_ID) AS Distinct_PPE_Inspections
FROM master.PPE_Inspections_Master;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN PPE_Inspection_ID IS NULL THEN 1 ELSE 0 END) AS Missing_PPE_Inspection_ID,

SUM(CASE WHEN Inspection_Date IS NULL THEN 1 ELSE 0 END) AS Missing_Inspection_Date,

SUM(CASE WHEN Department IS NULL THEN 1 ELSE 0 END) AS Missing_Department,

SUM(CASE WHEN PPE_Type IS NULL THEN 1 ELSE 0 END) AS Missing_PPE_Type

FROM master.PPE_Inspections_Master;
GO

------------------------------------------------------------
-- 4. Inspection Summary
------------------------------------------------------------
SELECT

COUNT(*) AS Total_Inspections,

COUNT(DISTINCT Department) AS Departments,

COUNT(DISTINCT PPE_Type) AS PPE_Types,

COUNT(DISTINCT Compliance_Status) AS Compliance_Statuses,

COUNT(DISTINCT Plant) AS Plants

FROM master.PPE_Inspections_Master;
GO

------------------------------------------------------------
-- 5. Date Range
------------------------------------------------------------
SELECT

MIN(Inspection_Date) AS First_Inspection_Date,

MAX(Inspection_Date) AS Last_Inspection_Date,

MIN(Next_Inspection_Date) AS First_Next_Inspection,

MAX(Next_Inspection_Date) AS Last_Next_Inspection

FROM master.PPE_Inspections_Master;
GO

------------------------------------------------------------
-- 6. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.PPE_Inspections_Master
ORDER BY PPE_Inspection_ID;
GO