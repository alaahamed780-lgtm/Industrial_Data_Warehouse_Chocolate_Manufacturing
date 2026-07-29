USE Chocolate_Manufacturing_DW;
GO

/*============================================================
07_Final_Check_Safety_Incidents.sql
============================================================*/

------------------------------------------------------------
-- 1. Compare Stage vs Master
------------------------------------------------------------
SELECT

(SELECT COUNT(*) FROM staging.Safety_Incidents_Stage) AS Stage_Count,

(SELECT COUNT(*) FROM master.Safety_Incidents_Master) AS Master_Count,

(SELECT COUNT(*) FROM staging.Safety_Incidents_Stage)
-
(SELECT COUNT(*) FROM master.Safety_Incidents_Master) AS Difference;
GO

------------------------------------------------------------
-- 2. Distinct Incidents
------------------------------------------------------------
SELECT
COUNT(DISTINCT Incident_ID) AS Distinct_Incidents
FROM master.Safety_Incidents_Master;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Incident_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Incident_ID,

SUM(CASE WHEN Incident_Date IS NULL THEN 1 ELSE 0 END) AS Missing_Incident_Date,

SUM(CASE WHEN Department IS NULL THEN 1 ELSE 0 END) AS Missing_Department,

SUM(CASE WHEN Severity IS NULL THEN 1 ELSE 0 END) AS Missing_Severity

FROM master.Safety_Incidents_Master;
GO

------------------------------------------------------------
-- 4. Incident Summary
------------------------------------------------------------
SELECT

COUNT(*) AS Total_Incidents,

COUNT(DISTINCT Department) AS Departments,

COUNT(DISTINCT Incident_Type) AS Incident_Types,

COUNT(DISTINCT Severity) AS Severity_Levels,

COUNT(DISTINCT Plant) AS Plants

FROM master.Safety_Incidents_Master;
GO

------------------------------------------------------------
-- 5. Date Range
------------------------------------------------------------
SELECT

MIN(Incident_Date) AS First_Incident_Date,

MAX(Incident_Date) AS Last_Incident_Date,

MIN(Target_Close_Date) AS First_Target_Close_Date,

MAX(Target_Close_Date) AS Last_Target_Close_Date

FROM master.Safety_Incidents_Master;
GO

------------------------------------------------------------
-- 6. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Safety_Incidents_Master
ORDER BY Incident_ID;
GO