USE Chocolate_Manufacturing_DW;
GO

/*============================================================
03_Data_Quality_Goods_Receipt.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS Stage_Count
FROM staging.Goods_Receipt_Stage;
GO

------------------------------------------------------------
-- 2. Duplicate Goods Receipt IDs
------------------------------------------------------------
SELECT
    Goods_Receipt_ID,
    COUNT(*) AS DuplicateCount
FROM staging.Goods_Receipt_Stage
GROUP BY Goods_Receipt_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Goods_Receipt_ID IS NULL OR LTRIM(RTRIM(Goods_Receipt_ID))='' THEN 1 ELSE 0 END) AS Missing_GR_ID,

SUM(CASE WHEN Purchase_Order_ID IS NULL OR LTRIM(RTRIM(Purchase_Order_ID))='' THEN 1 ELSE 0 END) AS Missing_PO_ID,

SUM(CASE WHEN Vendor_ID IS NULL OR LTRIM(RTRIM(Vendor_ID))='' THEN 1 ELSE 0 END) AS Missing_Vendor,

SUM(CASE WHEN Received_Qty IS NULL OR LTRIM(RTRIM(Received_Qty))='' THEN 1 ELSE 0 END) AS Missing_Received_Qty

FROM staging.Goods_Receipt_Stage;
GO

------------------------------------------------------------
-- 4. Invalid Calendar Date Key
------------------------------------------------------------
SELECT *
FROM staging.Goods_Receipt_Stage
WHERE TRY_CONVERT(INT, Calendar_Date_Key) IS NULL
AND NULLIF(LTRIM(RTRIM(Calendar_Date_Key)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 5. Invalid Receipt Date
------------------------------------------------------------
SELECT *
FROM staging.Goods_Receipt_Stage
WHERE TRY_CONVERT(DATE, Receipt_Date) IS NULL
AND NULLIF(LTRIM(RTRIM(Receipt_Date)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 6. Invalid Receipt DateTime
------------------------------------------------------------
SELECT *
FROM staging.Goods_Receipt_Stage
WHERE TRY_CONVERT(DATETIME2, Receipt_DateTime) IS NULL
AND NULLIF(LTRIM(RTRIM(Receipt_DateTime)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 7. Invalid Received Quantity
------------------------------------------------------------
SELECT *
FROM staging.Goods_Receipt_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Received_Qty) IS NULL
AND NULLIF(LTRIM(RTRIM(Received_Qty)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 8. Invalid Accepted Quantity
------------------------------------------------------------
SELECT *
FROM staging.Goods_Receipt_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Accepted_Qty) IS NULL
AND NULLIF(LTRIM(RTRIM(Accepted_Qty)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 9. Invalid Rejected Quantity
------------------------------------------------------------
SELECT *
FROM staging.Goods_Receipt_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Rejected_Qty) IS NULL
AND NULLIF(LTRIM(RTRIM(Rejected_Qty)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 10. Invalid Unit Cost
------------------------------------------------------------
SELECT *
FROM staging.Goods_Receipt_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Unit_Cost_USD) IS NULL
AND NULLIF(LTRIM(RTRIM(Unit_Cost_USD)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 11. Invalid Total Cost
------------------------------------------------------------
SELECT *
FROM staging.Goods_Receipt_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Total_Cost_USD) IS NULL
AND NULLIF(LTRIM(RTRIM(Total_Cost_USD)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 12. Invalid Lead Time
------------------------------------------------------------
SELECT *
FROM staging.Goods_Receipt_Stage
WHERE TRY_CONVERT(INT, Lead_Time_Days) IS NULL
AND NULLIF(LTRIM(RTRIM(Lead_Time_Days)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 13. Quantity Statistics
------------------------------------------------------------
SELECT

MIN(TRY_CONVERT(DECIMAL(18,2), Received_Qty)) AS Min_Received,
MAX(TRY_CONVERT(DECIMAL(18,2), Received_Qty)) AS Max_Received,
AVG(TRY_CONVERT(DECIMAL(18,2), Received_Qty)) AS Avg_Received,

MIN(TRY_CONVERT(DECIMAL(18,2), Rejected_Qty)) AS Min_Rejected,
MAX(TRY_CONVERT(DECIMAL(18,2), Rejected_Qty)) AS Max_Rejected,
AVG(TRY_CONVERT(DECIMAL(18,2), Rejected_Qty)) AS Avg_Rejected

FROM staging.Goods_Receipt_Stage;
GO

------------------------------------------------------------
-- 14. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM staging.Goods_Receipt_Stage
ORDER BY Goods_Receipt_ID;
GO