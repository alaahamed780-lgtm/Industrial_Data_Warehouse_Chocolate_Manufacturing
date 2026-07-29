USE Chocolate_Manufacturing_DW;
GO

/*============================================================
03_Data_Quality_Safety_Training.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS Stage_Count
FROM staging.Safety_Training_Stage;
GO

------------------------------------------------------------
-- 2. Duplicate Training Records
------------------------------------------------------------
SELECT
    Training_Record_ID,
    COUNT(*) AS DuplicateCount
FROM staging.Safety_Training_Stage
GROUP BY Training_Record_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Training_Record_ID IS NULL
          OR LTRIM(RTRIM(Training_Record_ID))='' THEN 1 ELSE 0 END) AS Missing_Training_Record_ID,

SUM(CASE WHEN Employee_ID IS NULL
          OR LTRIM(RTRIM(Employee_ID))='' THEN 1 ELSE 0 END) AS Missing_Employee_ID,

SUM(CASE WHEN Training_Date IS NULL
          OR LTRIM(RTRIM(Training_Date))='' THEN 1 ELSE 0 END) AS Missing_Training_Date,

SUM(CASE WHEN Training_Course IS NULL
          OR LTRIM(RTRIM(Training_Course))='' THEN 1 ELSE 0 END) AS Missing_Training_Course,

SUM(CASE WHEN Pass_Status IS NULL
          OR LTRIM(RTRIM(Pass_Status))='' THEN 1 ELSE 0 END) AS Missing_Pass_Status

FROM staging.Safety_Training_Stage;
GO

------------------------------------------------------------
-- 4. Invalid Dates
------------------------------------------------------------
SELECT *
FROM staging.Safety_Training_Stage
WHERE

(TRY_CONVERT(DATE, Training_Date) IS NULL
 AND NULLIF(LTRIM(RTRIM(Training_Date)), '') IS NOT NULL)

OR

(TRY_CONVERT(DATETIME, Training_DateTime) IS NULL
 AND NULLIF(LTRIM(RTRIM(Training_DateTime)), '') IS NOT NULL)

OR

(TRY_CONVERT(DATE, Certificate_Issue_Date) IS NULL
 AND NULLIF(LTRIM(RTRIM(Certificate_Issue_Date)), '') IS NOT NULL)

OR

(TRY_CONVERT(DATE, Certificate_Expiry_Date) IS NULL
 AND NULLIF(LTRIM(RTRIM(Certificate_Expiry_Date)), '') IS NOT NULL)

OR

(TRY_CONVERT(DATE, Next_Training_Date) IS NULL
 AND NULLIF(LTRIM(RTRIM(Next_Training_Date)), '') IS NOT NULL);
GO

------------------------------------------------------------
-- 5. Business Rule Validation
------------------------------------------------------------
SELECT *
FROM staging.Safety_Training_Stage
WHERE

TRY_CONVERT(DATE, Certificate_Expiry_Date)
<
TRY_CONVERT(DATE, Certificate_Issue_Date);
GO

------------------------------------------------------------
-- 6. Summary Statistics
------------------------------------------------------------
SELECT

COUNT(*) AS Total_Records,

COUNT(DISTINCT Training_Category) AS Training_Categories,

COUNT(DISTINCT Department) AS Departments,

COUNT(DISTINCT Pass_Status) AS Pass_Statuses,

COUNT(DISTINCT Plant) AS Plants

FROM staging.Safety_Training_Stage;
GO

------------------------------------------------------------
-- 7. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM staging.Safety_Training_Stage
ORDER BY Training_Record_ID;
GO