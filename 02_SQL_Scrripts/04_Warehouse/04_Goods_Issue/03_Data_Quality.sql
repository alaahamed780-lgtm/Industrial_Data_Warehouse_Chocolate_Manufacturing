USE Chocolate_Manufacturing_DW;
GO

/*============================================================
03_Data_Quality_Goods_Issue.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS Stage_Count
FROM staging.Goods_Issue_Stage;
GO

------------------------------------------------------------
-- 2. Duplicate Goods Issue IDs
------------------------------------------------------------
SELECT
    Goods_Issue_ID,
    COUNT(*) AS DuplicateCount
FROM staging.Goods_Issue_Stage
GROUP BY Goods_Issue_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Goods_Issue_ID IS NULL OR LTRIM(RTRIM(Goods_Issue_ID))='' THEN 1 ELSE 0 END) AS Missing_Goods_Issue_ID,

SUM(CASE WHEN Quantity IS NULL OR LTRIM(RTRIM(Quantity))='' THEN 1 ELSE 0 END) AS Missing_Quantity,

SUM(CASE WHEN Warehouse IS NULL OR LTRIM(RTRIM(Warehouse))='' THEN 1 ELSE 0 END) AS Missing_Warehouse,

SUM(CASE WHEN Material_ID IS NULL
          AND Spare_Part_ID IS NULL
          AND Product_ID IS NULL
     THEN 1 ELSE 0 END) AS Missing_Item

FROM staging.Goods_Issue_Stage;
GO

------------------------------------------------------------
-- 4. Invalid Calendar Date Key
------------------------------------------------------------
SELECT *
FROM staging.Goods_Issue_Stage
WHERE TRY_CONVERT(INT, Calendar_Date_Key) IS NULL
AND NULLIF(LTRIM(RTRIM(Calendar_Date_Key)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 5. Invalid Issue Date
------------------------------------------------------------
SELECT *
FROM staging.Goods_Issue_Stage
WHERE TRY_CONVERT(DATE, Issue_Date) IS NULL
AND NULLIF(LTRIM(RTRIM(Issue_Date)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 6. Invalid Issue DateTime
------------------------------------------------------------
SELECT *
FROM staging.Goods_Issue_Stage
WHERE TRY_CONVERT(DATETIME2, Issue_DateTime) IS NULL
AND NULLIF(LTRIM(RTRIM(Issue_DateTime)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 7. Invalid Quantity
------------------------------------------------------------
SELECT *
FROM staging.Goods_Issue_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Quantity) IS NULL
AND NULLIF(LTRIM(RTRIM(Quantity)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 8. Invalid Unit Cost
------------------------------------------------------------
SELECT *
FROM staging.Goods_Issue_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Unit_Cost_USD) IS NULL
AND NULLIF(LTRIM(RTRIM(Unit_Cost_USD)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 9. Invalid Extended Cost
------------------------------------------------------------
SELECT *
FROM staging.Goods_Issue_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Extended_Cost_USD) IS NULL
AND NULLIF(LTRIM(RTRIM(Extended_Cost_USD)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 10. Invalid Stock Before
------------------------------------------------------------
SELECT *
FROM staging.Goods_Issue_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Stock_Before) IS NULL
AND NULLIF(LTRIM(RTRIM(Stock_Before)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 11. Invalid Stock After
------------------------------------------------------------
SELECT *
FROM staging.Goods_Issue_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Stock_After) IS NULL
AND NULLIF(LTRIM(RTRIM(Stock_After)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 12. Statistics
------------------------------------------------------------
SELECT

MIN(TRY_CONVERT(DECIMAL(18,2), Quantity)) AS Min_Qty,
MAX(TRY_CONVERT(DECIMAL(18,2), Quantity)) AS Max_Qty,
AVG(TRY_CONVERT(DECIMAL(18,2), Quantity)) AS Avg_Qty,

MIN(TRY_CONVERT(DECIMAL(18,2), Unit_Cost_USD)) AS Min_Unit_Cost,
MAX(TRY_CONVERT(DECIMAL(18,2), Unit_Cost_USD)) AS Max_Unit_Cost,
AVG(TRY_CONVERT(DECIMAL(18,2), Unit_Cost_USD)) AS Avg_Unit_Cost,

MIN(TRY_CONVERT(DECIMAL(18,2), Extended_Cost_USD)) AS Min_Total_Cost,
MAX(TRY_CONVERT(DECIMAL(18,2), Extended_Cost_USD)) AS Max_Total_Cost,
AVG(TRY_CONVERT(DECIMAL(18,2), Extended_Cost_USD)) AS Avg_Total_Cost

FROM staging.Goods_Issue_Stage;
GO

------------------------------------------------------------
-- 13. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM staging.Goods_Issue_Stage
ORDER BY Goods_Issue_ID;
GO