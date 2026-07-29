USE Chocolate_Manufacturing_DW;
GO

/*============================================================
03_Data_Quality_Customer_Master.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS Stage_Count
FROM staging.Customer_Master_Stage;
GO

------------------------------------------------------------
-- 2. Duplicate Customer IDs
------------------------------------------------------------
SELECT
    Customer_ID,
    COUNT(*) AS DuplicateCount
FROM staging.Customer_Master_Stage
GROUP BY Customer_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Customer_ID IS NULL
          OR LTRIM(RTRIM(Customer_ID))='' THEN 1 ELSE 0 END) AS Missing_Customer_ID,

SUM(CASE WHEN Customer_Name IS NULL
          OR LTRIM(RTRIM(Customer_Name))='' THEN 1 ELSE 0 END) AS Missing_Customer_Name,

SUM(CASE WHEN Customer_Code IS NULL
          OR LTRIM(RTRIM(Customer_Code))='' THEN 1 ELSE 0 END) AS Missing_Customer_Code,

SUM(CASE WHEN Country IS NULL
          OR LTRIM(RTRIM(Country))='' THEN 1 ELSE 0 END) AS Missing_Country

FROM staging.Customer_Master_Stage;
GO

------------------------------------------------------------
-- 4. Invalid Registration Date
------------------------------------------------------------
SELECT *
FROM staging.Customer_Master_Stage
WHERE TRY_CONVERT(DATE, Registration_Date) IS NULL
AND NULLIF(LTRIM(RTRIM(Registration_Date)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 5. Invalid Last Order Date
------------------------------------------------------------
SELECT *
FROM staging.Customer_Master_Stage
WHERE TRY_CONVERT(DATE, Last_Order_Date) IS NULL
AND NULLIF(LTRIM(RTRIM(Last_Order_Date)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 6. Invalid Credit Limit
------------------------------------------------------------
SELECT *
FROM staging.Customer_Master_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Credit_Limit_USD) IS NULL
AND NULLIF(LTRIM(RTRIM(Credit_Limit_USD)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 7. Invalid Customer Rating
------------------------------------------------------------
SELECT *
FROM staging.Customer_Master_Stage
WHERE TRY_CONVERT(DECIMAL(5,2), Customer_Rating) IS NULL
AND NULLIF(LTRIM(RTRIM(Customer_Rating)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 8. Invalid Annual Sales Target
------------------------------------------------------------
SELECT *
FROM staging.Customer_Master_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Annual_Sales_Target_USD) IS NULL
AND NULLIF(LTRIM(RTRIM(Annual_Sales_Target_USD)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 9. Duplicate Customer Codes
------------------------------------------------------------
SELECT
    Customer_Code,
    COUNT(*) AS DuplicateCount
FROM staging.Customer_Master_Stage
GROUP BY Customer_Code
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 10. Summary Statistics
------------------------------------------------------------
SELECT

MIN(TRY_CONVERT(DECIMAL(18,2), Credit_Limit_USD)) AS Min_Credit_Limit,
MAX(TRY_CONVERT(DECIMAL(18,2), Credit_Limit_USD)) AS Max_Credit_Limit,
AVG(TRY_CONVERT(DECIMAL(18,2), Credit_Limit_USD)) AS Avg_Credit_Limit,

MIN(TRY_CONVERT(DECIMAL(18,2), Annual_Sales_Target_USD)) AS Min_Target,
MAX(TRY_CONVERT(DECIMAL(18,2), Annual_Sales_Target_USD)) AS Max_Target,
AVG(TRY_CONVERT(DECIMAL(18,2), Annual_Sales_Target_USD)) AS Avg_Target,

MIN(TRY_CONVERT(DECIMAL(5,2), Customer_Rating)) AS Min_Rating,
MAX(TRY_CONVERT(DECIMAL(5,2), Customer_Rating)) AS Max_Rating,
AVG(TRY_CONVERT(DECIMAL(5,2), Customer_Rating)) AS Avg_Rating

FROM staging.Customer_Master_Stage;
GO

------------------------------------------------------------
-- 11. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM staging.Customer_Master_Stage
ORDER BY Customer_ID;
GO