USE Chocolate_Manufacturing_DW;
GO

/*============================================================
06_Check_Customer_Master.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM master.Customer_Master;
GO

------------------------------------------------------------
-- 2. Preview Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Customer_Master
ORDER BY Customer_ID;
GO

------------------------------------------------------------
-- 3. Missing Primary Key
------------------------------------------------------------
SELECT COUNT(*) AS Missing_Customer_ID
FROM master.Customer_Master
WHERE Customer_ID IS NULL;
GO

------------------------------------------------------------
-- 4. Duplicate Customer IDs
------------------------------------------------------------
SELECT
    Customer_ID,
    COUNT(*) AS DuplicateCount
FROM master.Customer_Master
GROUP BY Customer_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 5. Duplicate Customer Codes
------------------------------------------------------------
SELECT
    Customer_Code,
    COUNT(*) AS DuplicateCount
FROM master.Customer_Master
GROUP BY Customer_Code
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 6. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Customer_Name IS NULL THEN 1 ELSE 0 END) AS Missing_Customer_Name,

SUM(CASE WHEN Country IS NULL THEN 1 ELSE 0 END) AS Missing_Country,

SUM(CASE WHEN Sales_Region IS NULL THEN 1 ELSE 0 END) AS Missing_Sales_Region,

SUM(CASE WHEN Status IS NULL THEN 1 ELSE 0 END) AS Missing_Status

FROM master.Customer_Master;
GO

------------------------------------------------------------
-- 7. Invalid Values
------------------------------------------------------------
SELECT *
FROM master.Customer_Master
WHERE Credit_Limit_USD < 0
   OR Customer_Rating < 0
   OR Customer_Rating > 5
   OR Annual_Sales_Target_USD < 0;
GO

------------------------------------------------------------
-- 8. Summary Statistics
------------------------------------------------------------
SELECT

MIN(Credit_Limit_USD) AS Min_Credit_Limit,
MAX(Credit_Limit_USD) AS Max_Credit_Limit,
AVG(Credit_Limit_USD) AS Avg_Credit_Limit,

MIN(Annual_Sales_Target_USD) AS Min_Target,
MAX(Annual_Sales_Target_USD) AS Max_Target,
AVG(Annual_Sales_Target_USD) AS Avg_Target,

MIN(Customer_Rating) AS Min_Rating,
MAX(Customer_Rating) AS Max_Rating,
AVG(Customer_Rating) AS Avg_Rating

FROM master.Customer_Master;
GO