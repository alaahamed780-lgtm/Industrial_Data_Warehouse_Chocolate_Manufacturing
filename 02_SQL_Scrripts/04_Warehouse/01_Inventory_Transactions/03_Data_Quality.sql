USE Chocolate_Manufacturing_DW;
GO

/*==============================================================
Inventory Transactions - Data Quality Check
==============================================================*/

---------------------------------------------------------------
-- 1. Total Records
---------------------------------------------------------------

SELECT COUNT(*) AS Stage_Count
FROM staging.Inventory_Transactions_Stage;
GO

---------------------------------------------------------------
-- 2. Duplicate Inventory Transactions
---------------------------------------------------------------

SELECT
    Inventory_Transaction_ID,
    COUNT(*) AS DuplicateCount
FROM staging.Inventory_Transactions_Stage
GROUP BY Inventory_Transaction_ID
HAVING COUNT(*) > 1;
GO

---------------------------------------------------------------
-- 3. Missing Primary Fields
---------------------------------------------------------------

SELECT
    SUM(CASE WHEN Inventory_Transaction_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Transaction_ID,
    SUM(CASE WHEN Material_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Material_ID,
    SUM(CASE WHEN Warehouse IS NULL THEN 1 ELSE 0 END) AS Missing_Warehouse,
    SUM(CASE WHEN Quantity IS NULL THEN 1 ELSE 0 END) AS Missing_Quantity,
    SUM(CASE WHEN Transaction_Date IS NULL THEN 1 ELSE 0 END) AS Missing_Transaction_Date
FROM staging.Inventory_Transactions_Stage;
GO

---------------------------------------------------------------
-- 4. Invalid Quantity
---------------------------------------------------------------

SELECT *
FROM staging.Inventory_Transactions_Stage
WHERE TRY_CONVERT(DECIMAL(18,2),Quantity) IS NULL
AND NULLIF(LTRIM(RTRIM(Quantity)),'') IS NOT NULL;
GO

---------------------------------------------------------------
-- 5. Invalid Unit Cost
---------------------------------------------------------------

SELECT *
FROM staging.Inventory_Transactions_Stage
WHERE TRY_CONVERT(DECIMAL(18,2),Unit_Cost_USD) IS NULL
AND NULLIF(LTRIM(RTRIM(Unit_Cost_USD)),'') IS NOT NULL;
GO

---------------------------------------------------------------
-- 6. Invalid Extended Cost
---------------------------------------------------------------

SELECT *
FROM staging.Inventory_Transactions_Stage
WHERE TRY_CONVERT(DECIMAL(18,2),Extended_Cost_USD) IS NULL
AND NULLIF(LTRIM(RTRIM(Extended_Cost_USD)),'') IS NOT NULL;
GO
/*==============================================================
7. Invalid Stock Before
==============================================================*/

SELECT *
FROM staging.Inventory_Transactions_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Stock_Before) IS NULL
AND NULLIF(LTRIM(RTRIM(Stock_Before)), '') IS NOT NULL;
GO

/*==============================================================
8. Invalid Stock After
==============================================================*/

SELECT *
FROM staging.Inventory_Transactions_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Stock_After) IS NULL
AND NULLIF(LTRIM(RTRIM(Stock_After)), '') IS NOT NULL;
GO

/*==============================================================
9. Invalid Transaction Date
==============================================================*/

SELECT *
FROM staging.Inventory_Transactions_Stage
WHERE TRY_CONVERT(DATE, Transaction_Date) IS NULL
AND NULLIF(LTRIM(RTRIM(Transaction_Date)), '') IS NOT NULL;
GO

/*==============================================================
10. Invalid Transaction DateTime
==============================================================*/

SELECT *
FROM staging.Inventory_Transactions_Stage
WHERE TRY_CONVERT(DATETIME, Transaction_DateTime) IS NULL
AND NULLIF(LTRIM(RTRIM(Transaction_DateTime)), '') IS NOT NULL;
GO

/*==============================================================
11. Invalid Calendar Date Key
==============================================================*/

SELECT *
FROM staging.Inventory_Transactions_Stage
WHERE TRY_CONVERT(INT, Calendar_Date_Key) IS NULL
AND NULLIF(LTRIM(RTRIM(Calendar_Date_Key)), '') IS NOT NULL;
GO

/*==============================================================
12. Invalid Cost Values
==============================================================*/

SELECT *
FROM staging.Inventory_Transactions_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Unit_Cost_USD) < 0
   OR TRY_CONVERT(DECIMAL(18,2), Extended_Cost_USD) < 0;
GO