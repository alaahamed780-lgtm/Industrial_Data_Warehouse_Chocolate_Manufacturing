USE Chocolate_Manufacturing_DW;
GO

/*============================================================
07_Final_Check_Environmental_Monitoring.sql
============================================================*/

------------------------------------------------------------
-- 1. Compare Stage vs Master
------------------------------------------------------------
SELECT

(SELECT COUNT(*) FROM staging.Environmental_Monitoring_Stage) AS Stage_Count,

(SELECT COUNT(*) FROM master.Environmental_Monitoring_Master) AS Master_Count,

(SELECT COUNT(*) FROM staging.Environmental_Monitoring_Stage)
-
(SELECT COUNT(*) FROM master.Environmental_Monitoring_Master) AS Difference;
GO

------------------------------------------------------------
-- 2. Distinct Records
------------------------------------------------------------
SELECT
COUNT(DISTINCT Environmental_Record_ID) AS Distinct_Environmental_Records
FROM master.Environmental_Monitoring_Master;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Environmental_Record_ID IS NULL THEN 1 ELSE 0 END)
AS Missing_Record_ID,

SUM(CASE WHEN Monitoring_Date IS NULL THEN 1 ELSE 0 END)
AS Missing_Monitoring_Date,

SUM(CASE WHEN Monitoring_Type IS NULL THEN 1 ELSE 0 END)
AS Missing_Monitoring_Type,

SUM(CASE WHEN Parameter IS NULL THEN 1 ELSE 0 END)
AS Missing_Parameter

FROM master.Environmental_Monitoring_Master;
GO

------------------------------------------------------------
-- 4. Monitoring Summary
------------------------------------------------------------
SELECT

COUNT(*) AS Total_Records,

COUNT(DISTINCT Monitoring_Type) AS Monitoring_Types,

COUNT(DISTINCT Parameter) AS Parameters,

COUNT(DISTINCT Compliance_Status) AS Compliance_Statuses,

COUNT(DISTINCT Plant) AS Plants

FROM master.Environmental_Monitoring_Master;
GO

------------------------------------------------------------
-- 5. Date Range
------------------------------------------------------------
SELECT

MIN(Monitoring_Date) AS First_Monitoring_Date,

MAX(Monitoring_Date) AS Last_Monitoring_Date

FROM master.Environmental_Monitoring_Master;
GO

------------------------------------------------------------
-- 6. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Environmental_Monitoring_Master
ORDER BY Environmental_Record_ID;
GO