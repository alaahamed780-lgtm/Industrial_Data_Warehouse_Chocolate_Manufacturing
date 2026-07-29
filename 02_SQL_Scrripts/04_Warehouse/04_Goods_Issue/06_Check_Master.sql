USE Chocolate_Manufacturing_DW;
GO

/*============================================================
06_Check_Goods_Issue_Master.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM master.Goods_Issue_Master;
GO

------------------------------------------------------------
-- 2. Preview Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Goods_Issue_Master
ORDER BY Goods_Issue_ID;
GO

------------------------------------------------------------
-- 3. Missing Primary Key
------------------------------------------------------------
SELECT COUNT(*) AS Missing_Goods_Issue_ID
FROM master.Goods_Issue_Master
WHERE Goods_Issue_ID IS NULL;
GO

------------------------------------------------------------
-- 4. Duplicate IDs
------------------------------------------------------------
SELECT
    Goods_Issue_ID,
    COUNT(*) AS DuplicateCount
FROM master.Goods_Issue_Master
GROUP BY Goods_Issue_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 5. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Quantity IS NULL THEN 1 ELSE 0 END) AS Missing_Quantity,

SUM(CASE WHEN Warehouse IS NULL THEN 1 ELSE 0 END) AS Missing_Warehouse,

SUM(CASE WHEN Material_ID IS NULL
         AND Spare_Part_ID IS NULL
         AND Product_ID IS NULL
         THEN 1 ELSE 0 END) AS Missing_Item

FROM master.Goods_Issue_Master;
GO

------------------------------------------------------------
-- 6. Negative Quantity
------------------------------------------------------------
SELECT *
FROM master.Goods_Issue_Master
WHERE Quantity < 0;
GO

------------------------------------------------------------
-- 7. Negative Cost
------------------------------------------------------------
SELECT *
FROM master.Goods_Issue_Master
WHERE Unit_Cost_USD < 0
   OR Extended_Cost_USD < 0;
GO

------------------------------------------------------------
-- 8. Stock Validation
------------------------------------------------------------
SELECT *
FROM master.Goods_Issue_Master
WHERE Stock_After > Stock_Before;
GO

------------------------------------------------------------
-- 9. Date Validation
------------------------------------------------------------
SELECT *
FROM master.Goods_Issue_Master
WHERE Issue_Date IS NULL;
GO

------------------------------------------------------------
-- 10. Statistics
------------------------------------------------------------
SELECT

MIN(Quantity) AS Min_Qty,
MAX(Quantity) AS Max_Qty,
AVG(Quantity) AS Avg_Qty,

MIN(Unit_Cost_USD) AS Min_Unit_Cost,
MAX(Unit_Cost_USD) AS Max_Unit_Cost,
AVG(Unit_Cost_USD) AS Avg_Unit_Cost,

MIN(Extended_Cost_USD) AS Min_Total_Cost,
MAX(Extended_Cost_USD) AS Max_Total_Cost,
AVG(Extended_Cost_USD) AS Avg_Total_Cost

FROM master.Goods_Issue_Master;
GO