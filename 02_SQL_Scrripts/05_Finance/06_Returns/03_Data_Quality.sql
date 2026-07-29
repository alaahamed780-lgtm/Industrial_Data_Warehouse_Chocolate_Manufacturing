USE Chocolate_Manufacturing_DW;
GO

/*============================================================
03_Data_Quality_Returns.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS Stage_Count
FROM staging.Returns_Stage;
GO

------------------------------------------------------------
-- 2. Duplicate Return IDs
------------------------------------------------------------
SELECT
    Return_ID,
    COUNT(*) AS DuplicateCount
FROM staging.Returns_Stage
GROUP BY Return_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Return_ID IS NULL
          OR LTRIM(RTRIM(Return_ID))='' THEN 1 ELSE 0 END) AS Missing_Return_ID,

SUM(CASE WHEN Sales_Order_ID IS NULL
          OR LTRIM(RTRIM(Sales_Order_ID))='' THEN 1 ELSE 0 END) AS Missing_Sales_Order,

SUM(CASE WHEN Delivery_ID IS NULL
          OR LTRIM(RTRIM(Delivery_ID))='' THEN 1 ELSE 0 END) AS Missing_Delivery,

SUM(CASE WHEN Return_Date IS NULL
          OR LTRIM(RTRIM(Return_Date))='' THEN 1 ELSE 0 END) AS Missing_Return_Date

FROM staging.Returns_Stage;
GO

------------------------------------------------------------
-- 4. Invalid Dates
------------------------------------------------------------
SELECT *
FROM staging.Returns_Stage
WHERE

(TRY_CONVERT(DATE, Return_Date) IS NULL
 AND NULLIF(LTRIM(RTRIM(Return_Date)), '') IS NOT NULL)

OR

(TRY_CONVERT(DATETIME, Return_DateTime) IS NULL
 AND NULLIF(LTRIM(RTRIM(Return_DateTime)), '') IS NOT NULL);
GO

------------------------------------------------------------
-- 5. Invalid Numeric Values
------------------------------------------------------------
SELECT *
FROM staging.Returns_Stage
WHERE

(TRY_CONVERT(DECIMAL(18,2), Returned_Qty) IS NULL
 AND NULLIF(LTRIM(RTRIM(Returned_Qty)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(18,2), Accepted_Qty) IS NULL
 AND NULLIF(LTRIM(RTRIM(Accepted_Qty)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(18,2), Rejected_Qty) IS NULL
 AND NULLIF(LTRIM(RTRIM(Rejected_Qty)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(18,2), Return_Cost_USD) IS NULL
 AND NULLIF(LTRIM(RTRIM(Return_Cost_USD)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(18,2), Recovery_Value_USD) IS NULL
 AND NULLIF(LTRIM(RTRIM(Recovery_Value_USD)), '') IS NOT NULL);
GO

------------------------------------------------------------
-- 6. Summary Statistics
------------------------------------------------------------
SELECT

MIN(TRY_CONVERT(DECIMAL(18,2), Returned_Qty)) AS Min_Returned_Qty,
MAX(TRY_CONVERT(DECIMAL(18,2), Returned_Qty)) AS Max_Returned_Qty,
AVG(TRY_CONVERT(DECIMAL(18,2), Returned_Qty)) AS Avg_Returned_Qty,

MIN(TRY_CONVERT(DECIMAL(18,2), Return_Cost_USD)) AS Min_Return_Cost,
MAX(TRY_CONVERT(DECIMAL(18,2), Return_Cost_USD)) AS Max_Return_Cost,
AVG(TRY_CONVERT(DECIMAL(18,2), Return_Cost_USD)) AS Avg_Return_Cost,

MIN(TRY_CONVERT(DECIMAL(18,2), Recovery_Value_USD)) AS Min_Recovery_Value,
MAX(TRY_CONVERT(DECIMAL(18,2), Recovery_Value_USD)) AS Max_Recovery_Value,
AVG(TRY_CONVERT(DECIMAL(18,2), Recovery_Value_USD)) AS Avg_Recovery_Value

FROM staging.Returns_Stage;
GO

------------------------------------------------------------
-- 7. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM staging.Returns_Stage
ORDER BY Return_ID;
GO