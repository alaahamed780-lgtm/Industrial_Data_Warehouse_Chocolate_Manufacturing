USE Chocolate_Manufacturing_DW;
GO

/*============================================================
06_Check_Sales_Order_Items_Master.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM master.Sales_Order_Items_Master;
GO

------------------------------------------------------------
-- 2. Preview Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Sales_Order_Items_Master
ORDER BY Sales_Order_Item_ID;
GO

------------------------------------------------------------
-- 3. Missing Primary Key
------------------------------------------------------------
SELECT COUNT(*) AS Missing_Sales_Order_Item_ID
FROM master.Sales_Order_Items_Master
WHERE Sales_Order_Item_ID IS NULL;
GO

------------------------------------------------------------
-- 4. Duplicate Item IDs
------------------------------------------------------------
SELECT
    Sales_Order_Item_ID,
    COUNT(*) AS DuplicateCount
FROM master.Sales_Order_Items_Master
GROUP BY Sales_Order_Item_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 5. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Sales_Order_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Order_ID,

SUM(CASE WHEN Product_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Product,

SUM(CASE WHEN Ordered_Qty IS NULL THEN 1 ELSE 0 END) AS Missing_Ordered_Qty,

SUM(CASE WHEN Unit_Price_USD IS NULL THEN 1 ELSE 0 END) AS Missing_Unit_Price

FROM master.Sales_Order_Items_Master;
GO

------------------------------------------------------------
-- 6. Invalid Numeric Values
------------------------------------------------------------
SELECT *
FROM master.Sales_Order_Items_Master
WHERE Ordered_Qty < 0
   OR Shipped_Qty < 0
   OR Delivered_Qty < 0
   OR Unit_Price_USD < 0
   OR Discount_Percent < 0
   OR Discount_Percent > 100
   OR Discount_USD < 0
   OR Tax_Percent < 0
   OR Tax_Percent > 100
   OR Tax_USD < 0
   OR Net_Amount_USD < 0;
GO

------------------------------------------------------------
-- 7. Summary Statistics
------------------------------------------------------------
SELECT

MIN(Ordered_Qty) AS Min_Ordered_Qty,
MAX(Ordered_Qty) AS Max_Ordered_Qty,
AVG(Ordered_Qty) AS Avg_Ordered_Qty,

MIN(Unit_Price_USD) AS Min_Unit_Price,
MAX(Unit_Price_USD) AS Max_Unit_Price,
AVG(Unit_Price_USD) AS Avg_Unit_Price,

MIN(Net_Amount_USD) AS Min_Net_Amount,
MAX(Net_Amount_USD) AS Max_Net_Amount,
AVG(Net_Amount_USD) AS Avg_Net_Amount

FROM master.Sales_Order_Items_Master;
GO