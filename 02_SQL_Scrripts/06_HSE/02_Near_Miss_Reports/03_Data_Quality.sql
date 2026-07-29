USE Chocolate_Manufacturing_DW;
GO

/*============================================================
03_Data_Quality_Near_Miss_Reports.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS Stage_Count
FROM staging.Near_Miss_Reports_Stage;
GO

------------------------------------------------------------
-- 2. Duplicate Near Miss IDs
------------------------------------------------------------
SELECT
    Near_Miss_ID,
    COUNT(*) AS DuplicateCount
FROM staging.Near_Miss_Reports_Stage
GROUP BY Near_Miss_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Near_Miss_ID IS NULL
          OR LTRIM(RTRIM(Near_Miss_ID))='' THEN 1 ELSE 0 END) AS Missing_Near_Miss_ID,

SUM(CASE WHEN Report_Date IS NULL
          OR LTRIM(RTRIM(Report_Date))='' THEN 1 ELSE 0 END) AS Missing_Report_Date,

SUM(CASE WHEN Department IS NULL
          OR LTRIM(RTRIM(Department))='' THEN 1 ELSE 0 END) AS Missing_Department,

SUM(CASE WHEN Hazard_Category IS NULL
          OR LTRIM(RTRIM(Hazard_Category))='' THEN 1 ELSE 0 END) AS Missing_Hazard_Category,

SUM(CASE WHEN Potential_Severity IS NULL
          OR LTRIM(RTRIM(Potential_Severity))='' THEN 1 ELSE 0 END) AS Missing_Potential_Severity

FROM staging.Near_Miss_Reports_Stage;
GO

------------------------------------------------------------
-- 4. Invalid Dates
------------------------------------------------------------
SELECT *
FROM staging.Near_Miss_Reports_Stage
WHERE

(TRY_CONVERT(DATE, Report_Date) IS NULL
AND NULLIF(LTRIM(RTRIM(Report_Date)), '') IS NOT NULL)

OR

(TRY_CONVERT(DATETIME, Report_DateTime) IS NULL
AND NULLIF(LTRIM(RTRIM(Report_DateTime)), '') IS NOT NULL)

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
FROM staging.Near_Miss_Reports_Stage
WHERE

(TRY_CONVERT(INT, Risk_Rating_Before) IS NULL
AND NULLIF(LTRIM(RTRIM(Risk_Rating_Before)), '') IS NOT NULL)

OR

(TRY_CONVERT(INT, Risk_Rating_After) IS NULL
AND NULLIF(LTRIM(RTRIM(Risk_Rating_After)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(18,2), Estimated_Loss_Avoided_USD) IS NULL
AND NULLIF(LTRIM(RTRIM(Estimated_Loss_Avoided_USD)), '') IS NOT NULL);
GO

------------------------------------------------------------
-- 6. Summary Statistics
------------------------------------------------------------
SELECT

MIN(TRY_CONVERT(INT, Risk_Rating_Before)) AS Min_Risk_Before,
MAX(TRY_CONVERT(INT, Risk_Rating_Before)) AS Max_Risk_Before,
AVG(TRY_CONVERT(FLOAT, Risk_Rating_Before)) AS Avg_Risk_Before,

MIN(TRY_CONVERT(INT, Risk_Rating_After)) AS Min_Risk_After,
MAX(TRY_CONVERT(INT, Risk_Rating_After)) AS Max_Risk_After,
AVG(TRY_CONVERT(FLOAT, Risk_Rating_After)) AS Avg_Risk_After,

MIN(TRY_CONVERT(DECIMAL(18,2), Estimated_Loss_Avoided_USD)) AS Min_Loss_Avoided,
MAX(TRY_CONVERT(DECIMAL(18,2), Estimated_Loss_Avoided_USD)) AS Max_Loss_Avoided,
AVG(TRY_CONVERT(DECIMAL(18,2), Estimated_Loss_Avoided_USD)) AS Avg_Loss_Avoided

FROM staging.Near_Miss_Reports_Stage;
GO

------------------------------------------------------------
-- 7. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM staging.Near_Miss_Reports_Stage
ORDER BY Near_Miss_ID;
GO