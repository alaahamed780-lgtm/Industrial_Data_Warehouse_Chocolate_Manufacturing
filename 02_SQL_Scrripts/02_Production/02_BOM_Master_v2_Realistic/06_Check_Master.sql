USE Chocolate_Manufacturing_DW;
GO

/*============================================================
06_Check_BOM.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM master.BOM_Master;
GO

------------------------------------------------------------
-- 2. Preview Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.BOM_Master
ORDER BY BOM_ID, Sequence;
GO

------------------------------------------------------------
-- 3. Missing BOM_ID
------------------------------------------------------------
SELECT COUNT(*) AS Missing_BOM_ID
FROM master.BOM_Master
WHERE BOM_ID IS NULL;
GO

------------------------------------------------------------
-- 4. Missing Product_ID
------------------------------------------------------------
SELECT COUNT(*) AS Missing_Product_ID
FROM master.BOM_Master
WHERE Product_ID IS NULL;
GO

------------------------------------------------------------
-- 5. Missing Material_ID
------------------------------------------------------------
SELECT COUNT(*) AS Missing_Material_ID
FROM master.BOM_Master
WHERE Material_ID IS NULL;
GO

------------------------------------------------------------
-- 6. Duplicate Primary Key
------------------------------------------------------------
SELECT
    BOM_ID,
    Material_ID,
    Sequence,
    COUNT(*) AS DuplicateCount
FROM master.BOM_Master
GROUP BY
    BOM_ID,
    Material_ID,
    Sequence
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 7. Invalid Quantity
------------------------------------------------------------
SELECT COUNT(*) AS Invalid_Qty
FROM master.BOM_Master
WHERE Qty_Per_100 <= 0;
GO

------------------------------------------------------------
-- 8. Invalid Cost
------------------------------------------------------------
SELECT COUNT(*) AS Invalid_Cost
FROM master.BOM_Master
WHERE Cost_USD < 0;
GO

------------------------------------------------------------
-- 9. Invalid Yield
------------------------------------------------------------
SELECT COUNT(*) AS Invalid_Yield
FROM master.BOM_Master
WHERE Yield_Percent < 0
   OR Yield_Percent > 100;
GO

------------------------------------------------------------
-- 10. Invalid Scrap
------------------------------------------------------------
SELECT COUNT(*) AS Invalid_Scrap
FROM master.BOM_Master
WHERE Scrap_Percent < 0
   OR Scrap_Percent > 100;
GO

------------------------------------------------------------
-- 11. Summary
------------------------------------------------------------
SELECT

COUNT(*) AS TotalRows,

MIN(Qty_Per_100) AS Min_Qty,
MAX(Qty_Per_100) AS Max_Qty,
AVG(Qty_Per_100) AS Avg_Qty,

MIN(Cost_USD) AS Min_Cost,
MAX(Cost_USD) AS Max_Cost,
AVG(Cost_USD) AS Avg_Cost

FROM master.BOM_Master;
GO