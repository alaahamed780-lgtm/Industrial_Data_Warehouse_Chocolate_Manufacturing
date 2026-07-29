USE Chocolate_Manufacturing_DW;
GO

/*============================================================
06_Check_Sales_Orders_Master.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM master.Sales_Orders_Master;
GO

------------------------------------------------------------
-- 2. Preview Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Sales_Orders_Master
ORDER BY Sales_Order_ID;
GO

------------------------------------------------------------
-- 3. Missing Primary Key
------------------------------------------------------------
SELECT COUNT(*) AS Missing_Sales_Order_ID
FROM master.Sales_Orders_Master
WHERE Sales_Order_ID IS NULL;
GO

------------------------------------------------------------
-- 4. Duplicate Sales Order IDs
------------------------------------------------------------
SELECT
    Sales_Order_ID,
    COUNT(*) AS DuplicateCount
FROM master.Sales_Orders_Master
GROUP BY Sales_Order_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 5. Duplicate Sales Order Numbers
------------------------------------------------------------
SELECT
    Sales_Order_No,
    COUNT(*) AS DuplicateCount
FROM master.Sales_Orders_Master
GROUP BY Sales_Order_No
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 6. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Customer_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Customer,

SUM(CASE WHEN Order_Date IS NULL THEN 1 ELSE 0 END) AS Missing_Order_Date,

SUM(CASE WHEN Order_Status IS NULL THEN 1 ELSE 0 END) AS Missing_Order_Status,

SUM(CASE WHEN Grand_Total_USD IS NULL THEN 1 ELSE 0 END) AS Missing_Grand_Total

FROM master.Sales_Orders_Master;
GO

------------------------------------------------------------
-- 7. Invalid Values
------------------------------------------------------------
SELECT *
FROM master.Sales_Orders_Master
WHERE Ordered_Qty < 0
   OR Net_Amount_USD < 0
   OR Discount_USD < 0
   OR Tax_USD < 0
   OR Grand_Total_USD < 0;
GO

------------------------------------------------------------
-- 8. Summary Statistics
------------------------------------------------------------
SELECT

MIN(Ordered_Qty) AS Min_Qty,
MAX(Ordered_Qty) AS Max_Qty,
AVG(Ordered_Qty) AS Avg_Qty,

MIN(Net_Amount_USD) AS Min_Net,
MAX(Net_Amount_USD) AS Max_Net,
AVG(Net_Amount_USD) AS Avg_Net,

MIN(Grand_Total_USD) AS Min_Total,
MAX(Grand_Total_USD) AS Max_Total,
AVG(Grand_Total_USD) AS Avg_Total

FROM master.Sales_Orders_Master;
GO