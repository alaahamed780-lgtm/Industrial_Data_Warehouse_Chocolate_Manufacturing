USE Chocolate_Manufacturing_DW;
GO

/*============================================================
03_Data_Quality_Customer_Complaints.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS Stage_Count
FROM staging.Customer_Complaints_Stage;
GO

------------------------------------------------------------
-- 2. Duplicate Complaint IDs
------------------------------------------------------------
SELECT
    Complaint_ID,
    COUNT(*) AS DuplicateCount
FROM staging.Customer_Complaints_Stage
GROUP BY Complaint_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Complaint_ID IS NULL
          OR LTRIM(RTRIM(Complaint_ID))='' THEN 1 ELSE 0 END) AS Missing_Complaint_ID,

SUM(CASE WHEN Customer_ID IS NULL
          OR LTRIM(RTRIM(Customer_ID))='' THEN 1 ELSE 0 END) AS Missing_Customer_ID,

SUM(CASE WHEN Complaint_Date IS NULL
          OR LTRIM(RTRIM(Complaint_Date))='' THEN 1 ELSE 0 END) AS Missing_Complaint_Date,

SUM(CASE WHEN Complaint_Category IS NULL
          OR LTRIM(RTRIM(Complaint_Category))='' THEN 1 ELSE 0 END) AS Missing_Complaint_Category

FROM staging.Customer_Complaints_Stage;
GO

------------------------------------------------------------
-- 4. Invalid Dates
------------------------------------------------------------
SELECT *
FROM staging.Customer_Complaints_Stage
WHERE

(TRY_CONVERT(DATE, Complaint_Date) IS NULL
 AND NULLIF(LTRIM(RTRIM(Complaint_Date)), '') IS NOT NULL)

OR

(TRY_CONVERT(DATETIME, Complaint_DateTime) IS NULL
 AND NULLIF(LTRIM(RTRIM(Complaint_DateTime)), '') IS NOT NULL)

OR

(TRY_CONVERT(DATE, Response_Date) IS NULL
 AND NULLIF(LTRIM(RTRIM(Response_Date)), '') IS NOT NULL)

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
FROM staging.Customer_Complaints_Stage
WHERE

(TRY_CONVERT(DECIMAL(18,2), Compensation_USD) IS NULL
 AND NULLIF(LTRIM(RTRIM(Compensation_USD)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(5,2), Customer_Satisfaction_After_Closure) IS NULL
 AND NULLIF(LTRIM(RTRIM(Customer_Satisfaction_After_Closure)), '') IS NOT NULL);
GO

------------------------------------------------------------
-- 6. Summary Statistics
------------------------------------------------------------
SELECT

MIN(TRY_CONVERT(DECIMAL(18,2), Compensation_USD)) AS Min_Compensation,

MAX(TRY_CONVERT(DECIMAL(18,2), Compensation_USD)) AS Max_Compensation,

AVG(TRY_CONVERT(DECIMAL(18,2), Compensation_USD)) AS Avg_Compensation,

MIN(TRY_CONVERT(DECIMAL(5,2), Customer_Satisfaction_After_Closure)) AS Min_Satisfaction,

MAX(TRY_CONVERT(DECIMAL(5,2), Customer_Satisfaction_After_Closure)) AS Max_Satisfaction,

AVG(TRY_CONVERT(DECIMAL(5,2), Customer_Satisfaction_After_Closure)) AS Avg_Satisfaction

FROM staging.Customer_Complaints_Stage;
GO

------------------------------------------------------------
-- 7. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM staging.Customer_Complaints_Stage
ORDER BY Complaint_ID;
GO