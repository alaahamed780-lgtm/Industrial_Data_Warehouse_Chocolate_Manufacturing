USE Chocolate_Manufacturing_DW;
GO

/*============================================================
03_Data_Quality_Purchase_Orders.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS Stage_Count
FROM staging.Purchase_Orders_Stage;
GO

------------------------------------------------------------
-- 2. Duplicate Purchase Orders
------------------------------------------------------------
SELECT
    Purchase_Order_ID,
    COUNT(*) AS DuplicateCount
FROM staging.Purchase_Orders_Stage
GROUP BY Purchase_Order_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT
SUM(CASE WHEN Purchase_Order_ID IS NULL OR LTRIM(RTRIM(Purchase_Order_ID))='' THEN 1 ELSE 0 END) AS Missing_PO_ID,
SUM(CASE WHEN Vendor_ID IS NULL OR LTRIM(RTRIM(Vendor_ID))='' THEN 1 ELSE 0 END) AS Missing_Vendor,
SUM(CASE WHEN Buyer_ID IS NULL OR LTRIM(RTRIM(Buyer_ID))='' THEN 1 ELSE 0 END) AS Missing_Buyer,
SUM(CASE WHEN Ordered_Qty IS NULL OR LTRIM(RTRIM(Ordered_Qty))='' THEN 1 ELSE 0 END) AS Missing_Ordered_Qty
FROM staging.Purchase_Orders_Stage;
GO

------------------------------------------------------------
-- 4. Invalid Calendar Date Key
------------------------------------------------------------
SELECT *
FROM staging.Purchase_Orders_Stage
WHERE TRY_CONVERT(INT, Calendar_Date_Key) IS NULL
AND NULLIF(LTRIM(RTRIM(Calendar_Date_Key)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 5. Invalid PO Date
------------------------------------------------------------
SELECT *
FROM staging.Purchase_Orders_Stage
WHERE TRY_CONVERT(DATE, PO_Date) IS NULL
AND NULLIF(LTRIM(RTRIM(PO_Date)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 6. Invalid Delivery Date
------------------------------------------------------------
SELECT *
FROM staging.Purchase_Orders_Stage
WHERE TRY_CONVERT(DATE, Delivery_Date) IS NULL
AND NULLIF(LTRIM(RTRIM(Delivery_Date)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 7. Invalid Required Date
------------------------------------------------------------
SELECT *
FROM staging.Purchase_Orders_Stage
WHERE TRY_CONVERT(DATE, Required_Date) IS NULL
AND NULLIF(LTRIM(RTRIM(Required_Date)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 8. Invalid Created Date
------------------------------------------------------------
SELECT *
FROM staging.Purchase_Orders_Stage
WHERE TRY_CONVERT(DATE, Created_Date) IS NULL
AND NULLIF(LTRIM(RTRIM(Created_Date)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 9. Invalid Closed Date
------------------------------------------------------------
SELECT *
FROM staging.Purchase_Orders_Stage
WHERE TRY_CONVERT(DATE, Closed_Date) IS NULL
AND NULLIF(LTRIM(RTRIM(Closed_Date)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 10. Invalid Ordered Quantity
------------------------------------------------------------
SELECT *
FROM staging.Purchase_Orders_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Ordered_Qty) IS NULL
AND NULLIF(LTRIM(RTRIM(Ordered_Qty)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 11. Invalid Received Quantity
------------------------------------------------------------
SELECT *
FROM staging.Purchase_Orders_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Received_Qty) IS NULL
AND NULLIF(LTRIM(RTRIM(Received_Qty)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 12. Invalid Open Quantity
------------------------------------------------------------
SELECT *
FROM staging.Purchase_Orders_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Open_Qty) IS NULL
AND NULLIF(LTRIM(RTRIM(Open_Qty)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 13. Invalid Unit Price
------------------------------------------------------------
SELECT *
FROM staging.Purchase_Orders_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Unit_Price_USD) IS NULL
AND NULLIF(LTRIM(RTRIM(Unit_Price_USD)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 14. Invalid Total Amount
------------------------------------------------------------
SELECT *
FROM staging.Purchase_Orders_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Total_Amount_USD) IS NULL
AND NULLIF(LTRIM(RTRIM(Total_Amount_USD)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 15. Cost Statistics
------------------------------------------------------------
SELECT
MIN(TRY_CONVERT(DECIMAL(18,2), Unit_Price_USD)) AS Min_UnitPrice,
MAX(TRY_CONVERT(DECIMAL(18,2), Unit_Price_USD)) AS Max_UnitPrice,
AVG(TRY_CONVERT(DECIMAL(18,2), Unit_Price_USD)) AS Avg_UnitPrice,

MIN(TRY_CONVERT(DECIMAL(18,2), Total_Amount_USD)) AS Min_Total,
MAX(TRY_CONVERT(DECIMAL(18,2), Total_Amount_USD)) AS Max_Total,
AVG(TRY_CONVERT(DECIMAL(18,2), Total_Amount_USD)) AS Avg_Total
FROM staging.Purchase_Orders_Stage;
GO

------------------------------------------------------------
-- 16. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM staging.Purchase_Orders_Stage
ORDER BY Purchase_Order_ID;
GO