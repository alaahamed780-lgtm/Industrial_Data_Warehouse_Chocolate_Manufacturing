USE Chocolate_Manufacturing_DW;
GO

/*============================================================
06_Check_GL_Accounts_Master.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM master.GL_Accounts_Master;
GO

------------------------------------------------------------
-- 2. Preview Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.GL_Accounts_Master
ORDER BY GL_Account_ID;
GO

------------------------------------------------------------
-- 3. Missing Primary Key
------------------------------------------------------------
SELECT COUNT(*) AS Missing_GL_Account_ID
FROM master.GL_Accounts_Master
WHERE GL_Account_ID IS NULL;
GO

------------------------------------------------------------
-- 4. Duplicate GL Account IDs
------------------------------------------------------------
SELECT
    GL_Account_ID,
    COUNT(*) AS DuplicateCount
FROM master.GL_Accounts_Master
GROUP BY GL_Account_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 5. Duplicate GL Account Numbers
------------------------------------------------------------
SELECT
    GL_Account_No,
    COUNT(*) AS DuplicateCount
FROM master.GL_Accounts_Master
GROUP BY GL_Account_No
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 6. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Account_Name IS NULL THEN 1 ELSE 0 END) AS Missing_Account_Name,

SUM(CASE WHEN Account_Type IS NULL THEN 1 ELSE 0 END) AS Missing_Account_Type,

SUM(CASE WHEN Cost_Center_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Cost_Center,

SUM(CASE WHEN Currency IS NULL THEN 1 ELSE 0 END) AS Missing_Currency

FROM master.GL_Accounts_Master;
GO

------------------------------------------------------------
-- 7. Business Statistics
------------------------------------------------------------
SELECT

COUNT(DISTINCT Account_Type) AS Distinct_Account_Types,

COUNT(DISTINCT Account_Category) AS Distinct_Account_Categories,

COUNT(DISTINCT Financial_Statement) AS Distinct_Financial_Statements,

COUNT(DISTINCT Currency) AS Distinct_Currencies

FROM master.GL_Accounts_Master;
GO