USE Chocolate_Manufacturing_DW;
GO

/*============================================================
06_Check_Purchase_Orders_Master.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM master.Purchase_Orders_Master;
GO

------------------------------------------------------------
-- 2. Preview Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Purchase_Orders_Master
ORDER BY Purchase_Order_ID;
GO

------------------------------------------------------------
-- 3. Missing Primary Key
------------------------------------------------------------
SELECT COUNT(*) AS Missing_PO_ID
FROM master.Purchase_Orders_Master
WHERE Purchase_Order_ID IS NULL;
GO

------------------------------------------------------------
-- 4. Duplicate Purchase Orders
------------------------------------------------------------
SELECT
    Purchase_Order_ID,
    COUNT(*) AS DuplicateCount
FROM master.Purchase_Orders_Master
GROUP BY Purchase_Order_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 5. Missing Critical Fields
------------------------------------------------------------
SELECT
    SUM(CASE WHEN Vendor_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Vendor,
    SUM(CASE WHEN Buyer_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Buyer,
    SUM(CASE WHEN Product_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Product
FROM master.Purchase_Orders_Master;
GO

------------------------------------------------------------
-- 6. Invalid Quantities
------------------------------------------------------------
SELECT *
FROM master.Purchase_Orders_Master
WHERE Ordered_Qty < 0
   OR Received_Qty < 0
   OR Open_Qty < 0;
GO

------------------------------------------------------------
-- 7. Invalid Prices
------------------------------------------------------------
SELECT *
FROM master.Purchase_Orders_Master
WHERE Unit_Price_USD < 0
   OR Total_Amount_USD < 0;
GO

------------------------------------------------------------
-- 8. Invalid Dates
------------------------------------------------------------
SELECT *
FROM master.Purchase_Orders_Master
WHERE Delivery_Date < PO_Date
   OR Required_Date < PO_Date;
GO

------------------------------------------------------------
-- 9. Summary Statistics
------------------------------------------------------------
SELECT
    MIN(Ordered_Qty) AS Min_Ordered,
    MAX(Ordered_Qty) AS Max_Ordered,
    AVG(Ordered_Qty) AS Avg_Ordered,

    MIN(Unit_Price_USD) AS Min_Price,
    MAX(Unit_Price_USD) AS Max_Price,
    AVG(Unit_Price_USD) AS Avg_Price,

    MIN(Total_Amount_USD) AS Min_Total,
    MAX(Total_Amount_USD) AS Max_Total,
    AVG(Total_Amount_USD) AS Avg_Total
FROM master.Purchase_Orders_Master;
GO