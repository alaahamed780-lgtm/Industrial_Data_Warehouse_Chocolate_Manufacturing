USE Chocolate_Manufacturing_DW;
GO

/*============================================================
06_Check_Production_Orders.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM master.Production_Orders_Master;
GO

------------------------------------------------------------
-- 2. Preview Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Production_Orders_Master
ORDER BY Production_Order_ID;
GO

------------------------------------------------------------
-- 3. Missing Primary Key
------------------------------------------------------------
SELECT COUNT(*) AS Missing_Production_Order_ID
FROM master.Production_Orders_Master
WHERE Production_Order_ID IS NULL;
GO

------------------------------------------------------------
-- 4. Duplicate Primary Key
------------------------------------------------------------
SELECT
    Production_Order_ID,
    COUNT(*) AS DuplicateCount
FROM master.Production_Orders_Master
GROUP BY Production_Order_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 5. Missing Product_ID
------------------------------------------------------------
SELECT COUNT(*) AS Missing_Product_ID
FROM master.Production_Orders_Master
WHERE Product_ID IS NULL;
GO

------------------------------------------------------------
-- 6. Missing BOM_ID
------------------------------------------------------------
SELECT COUNT(*) AS Missing_BOM_ID
FROM master.Production_Orders_Master
WHERE BOM_ID IS NULL;
GO

------------------------------------------------------------
-- 7. Invalid Planned Quantity
------------------------------------------------------------
SELECT COUNT(*) AS Invalid_Planned_Qty
FROM master.Production_Orders_Master
WHERE Planned_Qty < 0;
GO

------------------------------------------------------------
-- 8. Invalid Produced Quantity
------------------------------------------------------------
SELECT COUNT(*) AS Invalid_Produced_Qty
FROM master.Production_Orders_Master
WHERE Produced_Qty < 0;
GO

------------------------------------------------------------
-- 9. Invalid Scrap Quantity
------------------------------------------------------------
SELECT COUNT(*) AS Invalid_Scrap_Qty
FROM master.Production_Orders_Master
WHERE Scrap_Qty < 0;
GO

------------------------------------------------------------
-- 10. Invalid Yield
------------------------------------------------------------
SELECT COUNT(*) AS Invalid_Yield
FROM master.Production_Orders_Master
WHERE Yield_Percent < 0
   OR Yield_Percent > 100;
GO

------------------------------------------------------------
-- 11. Summary
------------------------------------------------------------
SELECT

COUNT(*) AS TotalRows,

MIN(Planned_Qty) AS Min_Planned_Qty,
MAX(Planned_Qty) AS Max_Planned_Qty,
AVG(Planned_Qty) AS Avg_Planned_Qty,

MIN(Produced_Qty) AS Min_Produced_Qty,
MAX(Produced_Qty) AS Max_Produced_Qty,
AVG(Produced_Qty) AS Avg_Produced_Qty,

MIN(Actual_Cost) AS Min_Cost,
MAX(Actual_Cost) AS Max_Cost,
AVG(Actual_Cost) AS Avg_Cost

FROM master.Production_Orders_Master;
GO