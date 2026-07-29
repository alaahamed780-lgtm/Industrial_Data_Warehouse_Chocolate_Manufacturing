USE Chocolate_Manufacturing_DW;
GO

/*============================================================
03_Data_Quality_Budget.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS Stage_Count
FROM staging.Budget_Stage;
GO

------------------------------------------------------------
-- 2. Duplicate Budget IDs
------------------------------------------------------------
SELECT
    Budget_ID,
    COUNT(*) AS DuplicateCount
FROM staging.Budget_Stage
GROUP BY Budget_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Budget_ID IS NULL
          OR LTRIM(RTRIM(Budget_ID))='' THEN 1 ELSE 0 END) AS Missing_Budget_ID,

SUM(CASE WHEN Cost_Center_ID IS NULL
          OR LTRIM(RTRIM(Cost_Center_ID))='' THEN 1 ELSE 0 END) AS Missing_Cost_Center,

SUM(CASE WHEN GL_Account_ID IS NULL
          OR LTRIM(RTRIM(GL_Account_ID))='' THEN 1 ELSE 0 END) AS Missing_GL_Account,

SUM(CASE WHEN Budget_Amount_USD IS NULL
          OR LTRIM(RTRIM(Budget_Amount_USD))='' THEN 1 ELSE 0 END) AS Missing_Budget_Amount

FROM staging.Budget_Stage;
GO

------------------------------------------------------------
-- 4. Invalid Dates
------------------------------------------------------------
SELECT *
FROM staging.Budget_Stage
WHERE

(TRY_CONVERT(DATE, Approval_Date) IS NULL
 AND NULLIF(LTRIM(RTRIM(Approval_Date)), '') IS NOT NULL)

OR

(TRY_CONVERT(DATE, Created_Date) IS NULL
 AND NULLIF(LTRIM(RTRIM(Created_Date)), '') IS NOT NULL)

OR

(TRY_CONVERT(DATE, Last_Updated) IS NULL
 AND NULLIF(LTRIM(RTRIM(Last_Updated)), '') IS NOT NULL);
GO

------------------------------------------------------------
-- 5. Invalid Numeric Values
------------------------------------------------------------
SELECT *
FROM staging.Budget_Stage
WHERE

(TRY_CONVERT(DECIMAL(18,2), Budget_Amount_USD) IS NULL
 AND NULLIF(LTRIM(RTRIM(Budget_Amount_USD)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(18,2), Committed_Amount_USD) IS NULL
 AND NULLIF(LTRIM(RTRIM(Committed_Amount_USD)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(18,2), Actual_Amount_USD) IS NULL
 AND NULLIF(LTRIM(RTRIM(Actual_Amount_USD)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(18,2), Variance_USD) IS NULL
 AND NULLIF(LTRIM(RTRIM(Variance_USD)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(18,2), Variance_Percent) IS NULL
 AND NULLIF(LTRIM(RTRIM(Variance_Percent)), '') IS NOT NULL);
GO

------------------------------------------------------------
-- 6. Summary Statistics
------------------------------------------------------------
SELECT

MIN(TRY_CONVERT(DECIMAL(18,2), Budget_Amount_USD)) AS Min_Budget,

MAX(TRY_CONVERT(DECIMAL(18,2), Budget_Amount_USD)) AS Max_Budget,

AVG(TRY_CONVERT(DECIMAL(18,2), Budget_Amount_USD)) AS Avg_Budget

FROM staging.Budget_Stage;
GO

------------------------------------------------------------
-- 7. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM staging.Budget_Stage
ORDER BY Budget_ID;
GO