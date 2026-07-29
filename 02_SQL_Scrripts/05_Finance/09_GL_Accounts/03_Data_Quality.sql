USE Chocolate_Manufacturing_DW;
GO

/*============================================================
03_Data_Quality_GL_Accounts.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS Stage_Count
FROM staging.GL_Accounts_Stage;
GO

------------------------------------------------------------
-- 2. Duplicate GL Account IDs
------------------------------------------------------------
SELECT
    GL_Account_ID,
    COUNT(*) AS DuplicateCount
FROM staging.GL_Accounts_Stage
GROUP BY GL_Account_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN GL_Account_ID IS NULL
          OR LTRIM(RTRIM(GL_Account_ID))='' THEN 1 ELSE 0 END) AS Missing_GL_Account_ID,

SUM(CASE WHEN GL_Account_No IS NULL
          OR LTRIM(RTRIM(GL_Account_No))='' THEN 1 ELSE 0 END) AS Missing_GL_Account_No,

SUM(CASE WHEN Account_Name IS NULL
          OR LTRIM(RTRIM(Account_Name))='' THEN 1 ELSE 0 END) AS Missing_Account_Name,

SUM(CASE WHEN Account_Type IS NULL
          OR LTRIM(RTRIM(Account_Type))='' THEN 1 ELSE 0 END) AS Missing_Account_Type

FROM staging.GL_Accounts_Stage;
GO

------------------------------------------------------------
-- 4. Invalid Dates
------------------------------------------------------------
SELECT *
FROM staging.GL_Accounts_Stage
WHERE
(TRY_CONVERT(DATE, Created_Date) IS NULL
 AND NULLIF(LTRIM(RTRIM(Created_Date)), '') IS NOT NULL);
GO

------------------------------------------------------------
-- 5. Invalid Relationships
------------------------------------------------------------
SELECT *
FROM staging.GL_Accounts_Stage
WHERE
Cost_Center_ID IS NULL
OR LTRIM(RTRIM(Cost_Center_ID)) = '';
GO

------------------------------------------------------------
-- 6. Summary Statistics
------------------------------------------------------------
SELECT

COUNT(*) AS Total_Accounts,

COUNT(DISTINCT Account_Type) AS Distinct_Account_Types,

COUNT(DISTINCT Account_Category) AS Distinct_Categories,

COUNT(DISTINCT Currency) AS Distinct_Currencies

FROM staging.GL_Accounts_Stage;
GO

------------------------------------------------------------
-- 7. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM staging.GL_Accounts_Stage
ORDER BY GL_Account_ID;
GO