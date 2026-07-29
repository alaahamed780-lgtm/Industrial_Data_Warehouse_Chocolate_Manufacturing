USE Chocolate_Manufacturing_DW;
GO

/*============================================================
03_Data_Quality_Cost_Centers.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS Stage_Count
FROM staging.Cost_Centers_Stage;
GO

------------------------------------------------------------
-- 2. Duplicate Cost Center IDs
------------------------------------------------------------
SELECT
    Cost_Center_ID,
    COUNT(*) AS DuplicateCount
FROM staging.Cost_Centers_Stage
GROUP BY Cost_Center_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Cost_Center_ID IS NULL
          OR LTRIM(RTRIM(Cost_Center_ID))='' THEN 1 ELSE 0 END) AS Missing_Cost_Center_ID,

SUM(CASE WHEN Cost_Center_Code IS NULL
          OR LTRIM(RTRIM(Cost_Center_Code))='' THEN 1 ELSE 0 END) AS Missing_Cost_Center_Code,

SUM(CASE WHEN Cost_Center_Name IS NULL
          OR LTRIM(RTRIM(Cost_Center_Name))='' THEN 1 ELSE 0 END) AS Missing_Cost_Center_Name,

SUM(CASE WHEN Department IS NULL
          OR LTRIM(RTRIM(Department))='' THEN 1 ELSE 0 END) AS Missing_Department

FROM staging.Cost_Centers_Stage;
GO

------------------------------------------------------------
-- 4. Invalid Dates
------------------------------------------------------------
SELECT *
FROM staging.Cost_Centers_Stage
WHERE

(TRY_CONVERT(DATE, Start_Date) IS NULL
 AND NULLIF(LTRIM(RTRIM(Start_Date)), '') IS NOT NULL)

OR

(TRY_CONVERT(DATE, End_Date) IS NULL
 AND NULLIF(LTRIM(RTRIM(End_Date)), '') IS NOT NULL);
GO

------------------------------------------------------------
-- 5. Invalid Numeric Values
------------------------------------------------------------
SELECT *
FROM staging.Cost_Centers_Stage
WHERE

(TRY_CONVERT(DECIMAL(18,2), Annual_Budget_USD) IS NULL
 AND NULLIF(LTRIM(RTRIM(Annual_Budget_USD)), '') IS NOT NULL);
GO

------------------------------------------------------------
-- 6. Summary Statistics
------------------------------------------------------------
SELECT

MIN(TRY_CONVERT(DECIMAL(18,2), Annual_Budget_USD)) AS Min_Budget,
MAX(TRY_CONVERT(DECIMAL(18,2), Annual_Budget_USD)) AS Max_Budget,
AVG(TRY_CONVERT(DECIMAL(18,2), Annual_Budget_USD)) AS Avg_Budget

FROM staging.Cost_Centers_Stage;
GO

------------------------------------------------------------
-- 7. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM staging.Cost_Centers_Stage
ORDER BY Cost_Center_ID;
GO