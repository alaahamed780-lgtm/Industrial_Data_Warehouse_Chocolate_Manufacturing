USE Chocolate_Manufacturing_DW;
GO

/*============================================================
03_Data_Quality_Sales_Order_Items.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS Stage_Count
FROM staging.Sales_Order_Items_Stage;
GO

------------------------------------------------------------
-- 2. Duplicate Item IDs
------------------------------------------------------------
SELECT
    Sales_Order_Item_ID,
    COUNT(*) AS DuplicateCount
FROM staging.Sales_Order_Items_Stage
GROUP BY Sales_Order_Item_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Sales_Order_Item_ID IS NULL
          OR LTRIM(RTRIM(Sales_Order_Item_ID))='' THEN 1 ELSE 0 END) AS Missing_Item_ID,

SUM(CASE WHEN Sales_Order_ID IS NULL
          OR LTRIM(RTRIM(Sales_Order_ID))='' THEN 1 ELSE 0 END) AS Missing_Order_ID,

SUM(CASE WHEN Product_ID IS NULL
          OR LTRIM(RTRIM(Product_ID))='' THEN 1 ELSE 0 END) AS Missing_Product,

SUM(CASE WHEN Ordered_Qty IS NULL
          OR LTRIM(RTRIM(Ordered_Qty))='' THEN 1 ELSE 0 END) AS Missing_Ordered_Qty

FROM staging.Sales_Order_Items_Stage;
GO

------------------------------------------------------------
-- 4. Invalid Dates
------------------------------------------------------------
SELECT *
FROM staging.Sales_Order_Items_Stage
WHERE
(
    TRY_CONVERT(DATE, Requested_Date) IS NULL
    AND NULLIF(LTRIM(RTRIM(Requested_Date)), '') IS NOT NULL
)
OR
(
    TRY_CONVERT(DATE, Delivery_Date) IS NULL
    AND NULLIF(LTRIM(RTRIM(Delivery_Date)), '') IS NOT NULL
);
GO

------------------------------------------------------------
-- 5. Invalid Numeric Values
------------------------------------------------------------
SELECT *
FROM staging.Sales_Order_Items_Stage
WHERE

(TRY_CONVERT(INT, Line_No) IS NULL
 AND NULLIF(LTRIM(RTRIM(Line_No)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(18,2), Ordered_Qty) IS NULL
 AND NULLIF(LTRIM(RTRIM(Ordered_Qty)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(18,2), Shipped_Qty) IS NULL
 AND NULLIF(LTRIM(RTRIM(Shipped_Qty)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(18,2), Delivered_Qty) IS NULL
 AND NULLIF(LTRIM(RTRIM(Delivered_Qty)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(18,2), Unit_Price_USD) IS NULL
 AND NULLIF(LTRIM(RTRIM(Unit_Price_USD)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(18,2), Discount_Percent) IS NULL
 AND NULLIF(LTRIM(RTRIM(Discount_Percent)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(18,2), Discount_USD) IS NULL
 AND NULLIF(LTRIM(RTRIM(Discount_USD)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(18,2), Tax_Percent) IS NULL
 AND NULLIF(LTRIM(RTRIM(Tax_Percent)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(18,2), Tax_USD) IS NULL
 AND NULLIF(LTRIM(RTRIM(Tax_USD)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(18,2), Net_Amount_USD) IS NULL
 AND NULLIF(LTRIM(RTRIM(Net_Amount_USD)), '') IS NOT NULL);
GO

------------------------------------------------------------
-- 6. Summary Statistics
------------------------------------------------------------
SELECT

MIN(TRY_CONVERT(DECIMAL(18,2), Ordered_Qty)) AS Min_Qty,
MAX(TRY_CONVERT(DECIMAL(18,2), Ordered_Qty)) AS Max_Qty,
AVG(TRY_CONVERT(DECIMAL(18,2), Ordered_Qty)) AS Avg_Qty,

MIN(TRY_CONVERT(DECIMAL(18,2), Unit_Price_USD)) AS Min_Price,
MAX(TRY_CONVERT(DECIMAL(18,2), Unit_Price_USD)) AS Max_Price,
AVG(TRY_CONVERT(DECIMAL(18,2), Unit_Price_USD)) AS Avg_Price,

MIN(TRY_CONVERT(DECIMAL(18,2), Net_Amount_USD)) AS Min_Net,
MAX(TRY_CONVERT(DECIMAL(18,2), Net_Amount_USD)) AS Max_Net,
AVG(TRY_CONVERT(DECIMAL(18,2), Net_Amount_USD)) AS Avg_Net

FROM staging.Sales_Order_Items_Stage;
GO

------------------------------------------------------------
-- 7. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM staging.Sales_Order_Items_Stage
ORDER BY Sales_Order_Item_ID;
GO