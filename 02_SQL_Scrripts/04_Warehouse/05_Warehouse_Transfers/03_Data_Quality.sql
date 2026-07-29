USE Chocolate_Manufacturing_DW;
GO

/*============================================================
03_Data_Quality_Warehouse_Transfers.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS Stage_Count
FROM staging.Warehouse_Transfers_Stage;
GO

------------------------------------------------------------
-- 2. Duplicate Transfer IDs
------------------------------------------------------------
SELECT
    Warehouse_Transfer_ID,
    COUNT(*) AS DuplicateCount
FROM staging.Warehouse_Transfers_Stage
GROUP BY Warehouse_Transfer_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Warehouse_Transfer_ID IS NULL OR LTRIM(RTRIM(Warehouse_Transfer_ID))='' THEN 1 ELSE 0 END) AS Missing_Transfer_ID,

SUM(CASE WHEN Quantity IS NULL OR LTRIM(RTRIM(Quantity))='' THEN 1 ELSE 0 END) AS Missing_Quantity,

SUM(CASE WHEN From_Warehouse IS NULL OR LTRIM(RTRIM(From_Warehouse))='' THEN 1 ELSE 0 END) AS Missing_From_Warehouse,

SUM(CASE WHEN To_Warehouse IS NULL OR LTRIM(RTRIM(To_Warehouse))='' THEN 1 ELSE 0 END) AS Missing_To_Warehouse

FROM staging.Warehouse_Transfers_Stage;
GO

------------------------------------------------------------
-- 4. Invalid Calendar Date Key
------------------------------------------------------------
SELECT *
FROM staging.Warehouse_Transfers_Stage
WHERE TRY_CONVERT(INT, Calendar_Date_Key) IS NULL
AND NULLIF(LTRIM(RTRIM(Calendar_Date_Key)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 5. Invalid Transfer Date
------------------------------------------------------------
SELECT *
FROM staging.Warehouse_Transfers_Stage
WHERE TRY_CONVERT(DATE, Transfer_Date) IS NULL
AND NULLIF(LTRIM(RTRIM(Transfer_Date)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 6. Invalid Transfer DateTime
------------------------------------------------------------
SELECT *
FROM staging.Warehouse_Transfers_Stage
WHERE TRY_CONVERT(DATETIME2, Transfer_DateTime) IS NULL
AND NULLIF(LTRIM(RTRIM(Transfer_DateTime)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 7. Invalid Quantity
------------------------------------------------------------
SELECT *
FROM staging.Warehouse_Transfers_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Quantity) IS NULL
AND NULLIF(LTRIM(RTRIM(Quantity)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 8. Invalid Unit Cost
------------------------------------------------------------
SELECT *
FROM staging.Warehouse_Transfers_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Unit_Cost_USD) IS NULL
AND NULLIF(LTRIM(RTRIM(Unit_Cost_USD)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 9. Invalid Extended Cost
------------------------------------------------------------
SELECT *
FROM staging.Warehouse_Transfers_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Extended_Cost_USD) IS NULL
AND NULLIF(LTRIM(RTRIM(Extended_Cost_USD)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 10. Invalid Stock Before (From)
------------------------------------------------------------
SELECT *
FROM staging.Warehouse_Transfers_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Stock_Before_From) IS NULL
AND NULLIF(LTRIM(RTRIM(Stock_Before_From)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 11. Invalid Stock After (From)
------------------------------------------------------------
SELECT *
FROM staging.Warehouse_Transfers_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Stock_After_From) IS NULL
AND NULLIF(LTRIM(RTRIM(Stock_After_From)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 12. Invalid Stock Before (To)
------------------------------------------------------------
SELECT *
FROM staging.Warehouse_Transfers_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Stock_Before_To) IS NULL
AND NULLIF(LTRIM(RTRIM(Stock_Before_To)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 13. Invalid Stock After (To)
------------------------------------------------------------
SELECT *
FROM staging.Warehouse_Transfers_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Stock_After_To) IS NULL
AND NULLIF(LTRIM(RTRIM(Stock_After_To)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 14. Statistics
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

FROM staging.Warehouse_Transfers_Stage;
GO

------------------------------------------------------------
-- 15. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM staging.Warehouse_Transfers_Stage
ORDER BY Warehouse_Transfer_ID;
GO