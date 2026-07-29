USE Chocolate_Manufacturing_DW;
GO

/*============================================================
03_Data_Quality_Safety_Incidents.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS Stage_Count
FROM staging.Safety_Incidents_Stage;
GO

------------------------------------------------------------
-- 2. Duplicate Incident IDs
------------------------------------------------------------
SELECT
    Incident_ID,
    COUNT(*) AS DuplicateCount
FROM staging.Safety_Incidents_Stage
GROUP BY Incident_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Incident_ID IS NULL
          OR LTRIM(RTRIM(Incident_ID))='' THEN 1 ELSE 0 END) AS Missing_Incident_ID,

SUM(CASE WHEN Incident_Date IS NULL
          OR LTRIM(RTRIM(Incident_Date))='' THEN 1 ELSE 0 END) AS Missing_Incident_Date,

SUM(CASE WHEN Department IS NULL
          OR LTRIM(RTRIM(Department))='' THEN 1 ELSE 0 END) AS Missing_Department,

SUM(CASE WHEN Severity IS NULL
          OR LTRIM(RTRIM(Severity))='' THEN 1 ELSE 0 END) AS Missing_Severity,

SUM(CASE WHEN Incident_Type IS NULL
          OR LTRIM(RTRIM(Incident_Type))='' THEN 1 ELSE 0 END) AS Missing_Incident_Type

FROM staging.Safety_Incidents_Stage;
GO

------------------------------------------------------------
-- 4. Invalid Dates
------------------------------------------------------------
SELECT *
FROM staging.Safety_Incidents_Stage
WHERE

(TRY_CONVERT(DATE, Incident_Date) IS NULL
 AND NULLIF(LTRIM(RTRIM(Incident_Date)), '') IS NOT NULL)

OR

(TRY_CONVERT(DATETIME, Incident_DateTime) IS NULL
 AND NULLIF(LTRIM(RTRIM(Incident_DateTime)), '') IS NOT NULL)

OR

(TRY_CONVERT(DATE, Target_Close_Date) IS NULL
 AND NULLIF(LTRIM(RTRIM(Target_Close_Date)), '') IS NOT NULL)

OR

(TRY_CONVERT(DATE, Actual_Close_Date) IS NULL
 AND NULLIF(LTRIM(RTRIM(Actual_Close_Date)), '') IS NOT NULL);
GO

------------------------------------------------------------
-- 5. Invalid Numeric Values
------------------------------------------------------------
SELECT *
FROM staging.Safety_Incidents_Stage
WHERE

(TRY_CONVERT(DECIMAL(18,2), Estimated_Cost_USD) IS NULL
 AND NULLIF(LTRIM(RTRIM(Estimated_Cost_USD)), '') IS NOT NULL);
GO

------------------------------------------------------------
-- 6. Summary Statistics
------------------------------------------------------------
SELECT

MIN(TRY_CONVERT(DECIMAL(18,2), Estimated_Cost_USD)) AS Min_Cost,

MAX(TRY_CONVERT(DECIMAL(18,2), Estimated_Cost_USD)) AS Max_Cost,

AVG(TRY_CONVERT(DECIMAL(18,2), Estimated_Cost_USD)) AS Avg_Cost

FROM staging.Safety_Incidents_Stage;
GO

------------------------------------------------------------
-- 7. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM staging.Safety_Incidents_Stage
ORDER BY Incident_ID;
GO