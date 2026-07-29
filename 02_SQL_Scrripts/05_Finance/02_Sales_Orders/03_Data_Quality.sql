USE Chocolate_Manufacturing_DW;
GO

/*============================================================
03_Data_Quality_Sales_Orders.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS Stage_Count
FROM staging.Sales_Orders_Stage;
GO

------------------------------------------------------------
-- 2. Duplicate Sales Order IDs
------------------------------------------------------------
SELECT
    Sales_Order_ID,
    COUNT(*) AS DuplicateCount
FROM staging.Sales_Orders_Stage
GROUP BY Sales_Order_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Sales_Order_ID IS NULL
          OR LTRIM(RTRIM(Sales_Order_ID))='' THEN 1 ELSE 0 END) AS Missing_Order_ID,

SUM(CASE WHEN Sales_Order_No IS NULL
          OR LTRIM(RTRIM(Sales_Order_No))='' THEN 1 ELSE 0 END) AS Missing_Order_No,

SUM(CASE WHEN Customer_ID IS NULL
          OR LTRIM(RTRIM(Customer_ID))='' THEN 1 ELSE 0 END) AS Missing_Customer,

SUM(CASE WHEN Order_Date IS NULL
          OR LTRIM(RTRIM(Order_Date))='' THEN 1 ELSE 0 END) AS Missing_Order_Date

FROM staging.Sales_Orders_Stage;
GO

------------------------------------------------------------
-- 4. Invalid Order Date
------------------------------------------------------------
SELECT *
FROM staging.Sales_Orders_Stage
WHERE TRY_CONVERT(DATE, Order_Date) IS NULL
AND NULLIF(LTRIM(RTRIM(Order_Date)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 5. Invalid Requested Delivery Date
------------------------------------------------------------
SELECT *
FROM staging.Sales_Orders_Stage
WHERE TRY_CONVERT(DATE, Requested_Delivery_Date) IS NULL
AND NULLIF(LTRIM(RTRIM(Requested_Delivery_Date)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 6. Invalid Promised Delivery Date
------------------------------------------------------------
SELECT *
FROM staging.Sales_Orders_Stage
WHERE TRY_CONVERT(DATE, Promised_Delivery_Date) IS NULL
AND NULLIF(LTRIM(RTRIM(Promised_Delivery_Date)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 7. Invalid Total Items
------------------------------------------------------------
SELECT *
FROM staging.Sales_Orders_Stage
WHERE TRY_CONVERT(INT, Total_Items) IS NULL
AND NULLIF(LTRIM(RTRIM(Total_Items)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 8. Invalid Ordered Quantity
------------------------------------------------------------
SELECT *
FROM staging.Sales_Orders_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Ordered_Qty) IS NULL
AND NULLIF(LTRIM(RTRIM(Ordered_Qty)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 9. Invalid Financial Values
------------------------------------------------------------
SELECT *
FROM staging.Sales_Orders_Stage
WHERE
TRY_CONVERT(DECIMAL(18,2), Net_Amount_USD) IS NULL
AND NULLIF(LTRIM(RTRIM(Net_Amount_USD)), '') IS NOT NULL

OR
TRY_CONVERT(DECIMAL(18,2), Discount_USD) IS NULL
AND NULLIF(LTRIM(RTRIM(Discount_USD)), '') IS NOT NULL

OR
TRY_CONVERT(DECIMAL(18,2), Tax_USD) IS NULL
AND NULLIF(LTRIM(RTRIM(Tax_USD)), '') IS NOT NULL

OR
TRY_CONVERT(DECIMAL(18,2), Grand_Total_USD) IS NULL
AND NULLIF(LTRIM(RTRIM(Grand_Total_USD)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 10. Summary Statistics
------------------------------------------------------------
SELECT

MIN(TRY_CONVERT(DECIMAL(18,2), Net_Amount_USD)) AS Min_Net,

MAX(TRY_CONVERT(DECIMAL(18,2), Net_Amount_USD)) AS Max_Net,

AVG(TRY_CONVERT(DECIMAL(18,2), Net_Amount_USD)) AS Avg_Net,

MIN(TRY_CONVERT(DECIMAL(18,2), Grand_Total_USD)) AS Min_Total,

MAX(TRY_CONVERT(DECIMAL(18,2), Grand_Total_USD)) AS Max_Total,

AVG(TRY_CONVERT(DECIMAL(18,2), Grand_Total_USD)) AS Avg_Total,

MIN(TRY_CONVERT(DECIMAL(18,2), Ordered_Qty)) AS Min_Qty,

MAX(TRY_CONVERT(DECIMAL(18,2), Ordered_Qty)) AS Max_Qty,

AVG(TRY_CONVERT(DECIMAL(18,2), Ordered_Qty)) AS Avg_Qty

FROM staging.Sales_Orders_Stage;
GO

------------------------------------------------------------
-- 11. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM staging.Sales_Orders_Stage
ORDER BY Sales_Order_ID;
GO