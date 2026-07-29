USE Chocolate_Manufacturing_DW;
GO

/*============================================================
03_Data_Quality_Inventory_Balance.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS Stage_Count
FROM staging.Inventory_Balance_Stage;
GO

------------------------------------------------------------
-- 2. Duplicate Inventory IDs
------------------------------------------------------------
SELECT
    Inventory_Balance_ID,
    COUNT(*) AS DuplicateCount
FROM staging.Inventory_Balance_Stage
GROUP BY Inventory_Balance_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Inventory_Balance_ID IS NULL OR LTRIM(RTRIM(Inventory_Balance_ID))='' THEN 1 ELSE 0 END) AS Missing_Inventory_ID,

SUM(CASE WHEN Warehouse IS NULL OR LTRIM(RTRIM(Warehouse))='' THEN 1 ELSE 0 END) AS Missing_Warehouse,

SUM(CASE WHEN Quantity_On_Hand IS NULL OR LTRIM(RTRIM(Quantity_On_Hand))='' THEN 1 ELSE 0 END) AS Missing_Qty_On_Hand

FROM staging.Inventory_Balance_Stage;
GO

------------------------------------------------------------
-- 4. Invalid Snapshot Date
------------------------------------------------------------
SELECT *
FROM staging.Inventory_Balance_Stage
WHERE TRY_CONVERT(DATE, Snapshot_Date) IS NULL
AND NULLIF(LTRIM(RTRIM(Snapshot_Date)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 5. Invalid Calendar Date Key
------------------------------------------------------------
SELECT *
FROM staging.Inventory_Balance_Stage
WHERE TRY_CONVERT(INT, Calendar_Date_Key) IS NULL
AND NULLIF(LTRIM(RTRIM(Calendar_Date_Key)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 6. Invalid Quantity On Hand
------------------------------------------------------------
SELECT *
FROM staging.Inventory_Balance_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Quantity_On_Hand) IS NULL
AND NULLIF(LTRIM(RTRIM(Quantity_On_Hand)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 7. Invalid Reserved Qty
------------------------------------------------------------
SELECT *
FROM staging.Inventory_Balance_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Reserved_Qty) IS NULL
AND NULLIF(LTRIM(RTRIM(Reserved_Qty)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 8. Invalid Available Qty
------------------------------------------------------------
SELECT *
FROM staging.Inventory_Balance_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Available_Qty) IS NULL
AND NULLIF(LTRIM(RTRIM(Available_Qty)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 9. Invalid Average Cost
------------------------------------------------------------
SELECT *
FROM staging.Inventory_Balance_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Average_Cost_USD) IS NULL
AND NULLIF(LTRIM(RTRIM(Average_Cost_USD)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 10. Invalid Inventory Value
------------------------------------------------------------
SELECT *
FROM staging.Inventory_Balance_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Inventory_Value_USD) IS NULL
AND NULLIF(LTRIM(RTRIM(Inventory_Value_USD)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 11. Statistics
------------------------------------------------------------
SELECT

MIN(TRY_CONVERT(DECIMAL(18,2), Quantity_On_Hand)) AS Min_Qty,
MAX(TRY_CONVERT(DECIMAL(18,2), Quantity_On_Hand)) AS Max_Qty,
AVG(TRY_CONVERT(DECIMAL(18,2), Quantity_On_Hand)) AS Avg_Qty,

MIN(TRY_CONVERT(DECIMAL(18,2), Average_Cost_USD)) AS Min_Cost,
MAX(TRY_CONVERT(DECIMAL(18,2), Average_Cost_USD)) AS Max_Cost,
AVG(TRY_CONVERT(DECIMAL(18,2), Average_Cost_USD)) AS Avg_Cost,

MIN(TRY_CONVERT(DECIMAL(18,2), Inventory_Value_USD)) AS Min_Value,
MAX(TRY_CONVERT(DECIMAL(18,2), Inventory_Value_USD)) AS Max_Value,
AVG(TRY_CONVERT(DECIMAL(18,2), Inventory_Value_USD)) AS Avg_Value

FROM staging.Inventory_Balance_Stage;
GO

------------------------------------------------------------
-- 12. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM staging.Inventory_Balance_Stage
ORDER BY Inventory_Balance_ID;
GO