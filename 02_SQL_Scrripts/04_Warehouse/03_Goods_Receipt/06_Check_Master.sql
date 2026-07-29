USE Chocolate_Manufacturing_DW;
GO

/*============================================================
06_Check_Goods_Receipt_Master.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM master.Goods_Receipt_Master;
GO

------------------------------------------------------------
-- 2. Preview Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Goods_Receipt_Master
ORDER BY Goods_Receipt_ID;
GO

------------------------------------------------------------
-- 3. Missing Primary Key
------------------------------------------------------------
SELECT COUNT(*) AS Missing_GR_ID
FROM master.Goods_Receipt_Master
WHERE Goods_Receipt_ID IS NULL;
GO

------------------------------------------------------------
-- 4. Duplicate Goods Receipt IDs
------------------------------------------------------------
SELECT
    Goods_Receipt_ID,
    COUNT(*) AS DuplicateCount
FROM master.Goods_Receipt_Master
GROUP BY Goods_Receipt_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 5. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Purchase_Order_ID IS NULL THEN 1 ELSE 0 END) AS Missing_PO_ID,

SUM(CASE WHEN Vendor_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Vendor,

SUM(CASE WHEN Received_Qty IS NULL THEN 1 ELSE 0 END) AS Missing_Received_Qty,

SUM(CASE WHEN Product_ID IS NULL 
         AND Material_ID IS NULL 
         AND Spare_Part_ID IS NULL
         THEN 1 ELSE 0 END) AS Missing_Item

FROM master.Goods_Receipt_Master;
GO

------------------------------------------------------------
-- 6. Invalid Quantities
------------------------------------------------------------
SELECT *
FROM master.Goods_Receipt_Master
WHERE Received_Qty < 0
   OR Accepted_Qty < 0
   OR Rejected_Qty < 0;
GO

------------------------------------------------------------
-- 7. Quantity Balance Check
------------------------------------------------------------
SELECT *
FROM master.Goods_Receipt_Master
WHERE Received_Qty <> (Accepted_Qty + Rejected_Qty);
GO

------------------------------------------------------------
-- 8. Invalid Costs
------------------------------------------------------------
SELECT *
FROM master.Goods_Receipt_Master
WHERE Unit_Cost_USD < 0
   OR Total_Cost_USD < 0;
GO

------------------------------------------------------------
-- 9. Date Check
------------------------------------------------------------
SELECT *
FROM master.Goods_Receipt_Master
WHERE Created_Date > Receipt_Date;
GO

------------------------------------------------------------
-- 10. Summary Statistics
------------------------------------------------------------
SELECT

MIN(Received_Qty) AS Min_Received,
MAX(Received_Qty) AS Max_Received,
AVG(Received_Qty) AS Avg_Received,

MIN(Total_Cost_USD) AS Min_Total_Cost,
MAX(Total_Cost_USD) AS Max_Total_Cost,
AVG(Total_Cost_USD) AS Avg_Total_Cost

FROM master.Goods_Receipt_Master;
GO