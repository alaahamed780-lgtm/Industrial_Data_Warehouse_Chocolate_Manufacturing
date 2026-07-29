USE Chocolate_Manufacturing_DW;
GO

/*============================================================
03_Data_Quality_Environmental_Monitoring.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS Stage_Count
FROM staging.Environmental_Monitoring_Stage;
GO

------------------------------------------------------------
-- 2. Duplicate Environmental Record IDs
------------------------------------------------------------
SELECT
    Environmental_Record_ID,
    COUNT(*) AS DuplicateCount
FROM staging.Environmental_Monitoring_Stage
GROUP BY Environmental_Record_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Environmental_Record_ID IS NULL
          OR LTRIM(RTRIM(Environmental_Record_ID))='' THEN 1 ELSE 0 END) AS Missing_Record_ID,

SUM(CASE WHEN Monitoring_Date IS NULL
          OR LTRIM(RTRIM(Monitoring_Date))='' THEN 1 ELSE 0 END) AS Missing_Monitoring_Date,

SUM(CASE WHEN Monitoring_Type IS NULL
          OR LTRIM(RTRIM(Monitoring_Type))='' THEN 1 ELSE 0 END) AS Missing_Monitoring_Type,

SUM(CASE WHEN Parameter IS NULL
          OR LTRIM(RTRIM(Parameter))='' THEN 1 ELSE 0 END) AS Missing_Parameter,

SUM(CASE WHEN Compliance_Status IS NULL
          OR LTRIM(RTRIM(Compliance_Status))='' THEN 1 ELSE 0 END) AS Missing_Compliance_Status

FROM staging.Environmental_Monitoring_Stage;
GO

------------------------------------------------------------
-- 4. Invalid Dates
------------------------------------------------------------
SELECT *
FROM staging.Environmental_Monitoring_Stage
WHERE

(TRY_CONVERT(DATE, Monitoring_Date) IS NULL
AND NULLIF(LTRIM(RTRIM(Monitoring_Date)), '') IS NOT NULL)

OR

(TRY_CONVERT(DATETIME, Monitoring_DateTime) IS NULL
AND NULLIF(LTRIM(RTRIM(Monitoring_DateTime)), '') IS NOT NULL);
GO

------------------------------------------------------------
-- 5. Invalid Numeric Values
------------------------------------------------------------
SELECT *
FROM staging.Environmental_Monitoring_Stage
WHERE

(TRY_CONVERT(DECIMAL(18,2), Measured_Value) IS NULL
AND NULLIF(LTRIM(RTRIM(Measured_Value)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(18,2), Lower_Limit) IS NULL
AND NULLIF(LTRIM(RTRIM(Lower_Limit)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(18,2), Upper_Limit) IS NULL
AND NULLIF(LTRIM(RTRIM(Upper_Limit)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(18,2), Ambient_Temperature_C) IS NULL
AND NULLIF(LTRIM(RTRIM(Ambient_Temperature_C)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(18,2), Humidity_Percent) IS NULL
AND NULLIF(LTRIM(RTRIM(Humidity_Percent)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(18,2), Wind_Speed_mps) IS NULL
AND NULLIF(LTRIM(RTRIM(Wind_Speed_mps)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(18,2), Estimated_Environmental_Cost_USD) IS NULL
AND NULLIF(LTRIM(RTRIM(Estimated_Environmental_Cost_USD)), '') IS NOT NULL);
GO

------------------------------------------------------------
-- 6. Summary Statistics
------------------------------------------------------------
SELECT

COUNT(*) AS Total_Records,

COUNT(DISTINCT Monitoring_Type) AS Monitoring_Types,

COUNT(DISTINCT Parameter) AS Parameters,

COUNT(DISTINCT Compliance_Status) AS Compliance_Statuses,

COUNT(DISTINCT Plant) AS Plants

FROM staging.Environmental_Monitoring_Stage;
GO

------------------------------------------------------------
-- 7. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM staging.Environmental_Monitoring_Stage
ORDER BY Environmental_Record_ID;
GO