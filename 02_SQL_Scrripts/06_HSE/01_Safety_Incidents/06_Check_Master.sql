USE Chocolate_Manufacturing_DW;
GO

/*============================================================
06_Check_Safety_Incidents_Master.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM master.Safety_Incidents_Master;
GO

------------------------------------------------------------
-- 2. Preview Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Safety_Incidents_Master
ORDER BY Incident_ID;
GO

------------------------------------------------------------
-- 3. Missing Primary Key
------------------------------------------------------------
SELECT COUNT(*) AS Missing_Incident_ID
FROM master.Safety_Incidents_Master
WHERE Incident_ID IS NULL;
GO

------------------------------------------------------------
-- 4. Duplicate Incident IDs
------------------------------------------------------------
SELECT
    Incident_ID,
    COUNT(*) AS DuplicateCount
FROM master.Safety_Incidents_Master
GROUP BY Incident_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 5. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Incident_Date IS NULL THEN 1 ELSE 0 END) AS Missing_Incident_Date,

SUM(CASE WHEN Department IS NULL THEN 1 ELSE 0 END) AS Missing_Department,

SUM(CASE WHEN Severity IS NULL THEN 1 ELSE 0 END) AS Missing_Severity,

SUM(CASE WHEN Incident_Type IS NULL THEN 1 ELSE 0 END) AS Missing_Incident_Type

FROM master.Safety_Incidents_Master;
GO

------------------------------------------------------------
-- 6. Invalid Business Values
------------------------------------------------------------
SELECT *
FROM master.Safety_Incidents_Master
WHERE Estimated_Cost_USD < 0;
GO

------------------------------------------------------------
-- 7. Summary Statistics
------------------------------------------------------------
SELECT

MIN(Estimated_Cost_USD) AS Min_Cost,
MAX(Estimated_Cost_USD) AS Max_Cost,
AVG(Estimated_Cost_USD) AS Avg_Cost,

COUNT(CASE WHEN Lost_Time_Injury = 1 THEN 1 END) AS LTI_Count,

COUNT(CASE WHEN Near_Miss = 1 THEN 1 END) AS Near_Miss_Count,

COUNT(CASE WHEN Regulatory_Reported = 1 THEN 1 END) AS Regulatory_Reported_Count

FROM master.Safety_Incidents_Master;
GO