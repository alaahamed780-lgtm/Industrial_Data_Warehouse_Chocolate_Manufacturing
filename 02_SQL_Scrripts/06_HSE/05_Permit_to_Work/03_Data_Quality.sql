USE Chocolate_Manufacturing_DW;
GO

/*============================================================
03_Data_Quality_Permit_to_Work.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS Stage_Count
FROM staging.Permit_to_Work_Stage;
GO

------------------------------------------------------------
-- 2. Duplicate Permit IDs
------------------------------------------------------------
SELECT
    Permit_ID,
    COUNT(*) AS DuplicateCount
FROM staging.Permit_to_Work_Stage
GROUP BY Permit_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Permit_ID IS NULL
          OR LTRIM(RTRIM(Permit_ID))='' THEN 1 ELSE 0 END) AS Missing_Permit_ID,

SUM(CASE WHEN Issue_Date IS NULL
          OR LTRIM(RTRIM(Issue_Date))='' THEN 1 ELSE 0 END) AS Missing_Issue_Date,

SUM(CASE WHEN Permit_Type IS NULL
          OR LTRIM(RTRIM(Permit_Type))='' THEN 1 ELSE 0 END) AS Missing_Permit_Type,

SUM(CASE WHEN Permit_Status IS NULL
          OR LTRIM(RTRIM(Permit_Status))='' THEN 1 ELSE 0 END) AS Missing_Permit_Status

FROM staging.Permit_to_Work_Stage;
GO

------------------------------------------------------------
-- 4. Invalid Dates
------------------------------------------------------------
SELECT *
FROM staging.Permit_to_Work_Stage
WHERE

(TRY_CONVERT(DATE, Issue_Date) IS NULL
AND NULLIF(LTRIM(RTRIM(Issue_Date)), '') IS NOT NULL)

OR

(TRY_CONVERT(DATETIME, Issue_DateTime) IS NULL
AND NULLIF(LTRIM(RTRIM(Issue_DateTime)), '') IS NOT NULL)

OR

(TRY_CONVERT(DATETIME, Start_DateTime) IS NULL
AND NULLIF(LTRIM(RTRIM(Start_DateTime)), '') IS NOT NULL)

OR

(TRY_CONVERT(DATETIME, End_DateTime) IS NULL
AND NULLIF(LTRIM(RTRIM(End_DateTime)), '') IS NOT NULL)

OR

(TRY_CONVERT(DATETIME, Close_DateTime) IS NULL
AND NULLIF(LTRIM(RTRIM(Close_DateTime)), '') IS NOT NULL);
GO

------------------------------------------------------------
-- 5. Business Rule Check
------------------------------------------------------------
SELECT *
FROM staging.Permit_to_Work_Stage
WHERE

TRY_CONVERT(DATETIME, End_DateTime)
<
TRY_CONVERT(DATETIME, Start_DateTime);
GO

------------------------------------------------------------
-- 6. Summary Statistics
------------------------------------------------------------
SELECT

COUNT(*) AS Total_Records,

COUNT(DISTINCT Permit_Type) AS Permit_Types,

COUNT(DISTINCT Department) AS Departments,

COUNT(DISTINCT Permit_Status) AS Permit_Statuses,

COUNT(DISTINCT Plant) AS Plants

FROM staging.Permit_to_Work_Stage;
GO

------------------------------------------------------------
-- 7. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM staging.Permit_to_Work_Stage
ORDER BY Permit_ID;
GO