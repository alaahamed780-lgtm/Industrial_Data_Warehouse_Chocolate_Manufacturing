USE Chocolate_Manufacturing_DW;
GO

/*============================================================
06_Check_Warehouse_Transfers_Master.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM master.Warehouse_Transfers_Master;
GO

------------------------------------------------------------
-- 2. Preview Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Warehouse_Transfers_Master
ORDER BY Warehouse_Transfer_ID;
GO

------------------------------------------------------------
-- 3. Missing Primary Key
------------------------------------------------------------
SELECT COUNT(*) AS Missing_Transfer_ID
FROM master.Warehouse_Transfers_Master
WHERE Warehouse_Transfer_ID IS NULL;
GO

------------------------------------------------------------
-- 4. Duplicate Transfer IDs
------------------------------------------------------------
SELECT
    Warehouse_Transfer_ID,
    COUNT(*) AS DuplicateCount
FROM master.Warehouse_Transfers_Master
GROUP BY Warehouse_Transfer_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 5. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Quantity IS NULL THEN 1 ELSE 0 END) AS Missing_Quantity,

SUM(CASE WHEN From_Warehouse IS NULL THEN 1 ELSE 0 END) AS Missing_From_Warehouse,

SUM(CASE WHEN To_Warehouse IS NULL THEN 1 ELSE 0 END) AS Missing_To_Warehouse,

SUM(
CASE
WHEN Material_ID IS NULL
 AND Spare_Part_ID IS NULL
 AND Product_ID IS NULL
THEN 1
ELSE 0
END
) AS Missing_Item

FROM master.Warehouse_Transfers_Master;
GO

------------------------------------------------------------
-- 6. Negative Quantity
------------------------------------------------------------
SELECT *
FROM master.Warehouse_Transfers_Master
WHERE Quantity < 0;
GO

------------------------------------------------------------
-- 7. Negative Cost
------------------------------------------------------------
SELECT *
FROM master.Warehouse_Transfers_Master
WHERE Unit_Cost_USD < 0
OR Extended_Cost_USD < 0;
GO

------------------------------------------------------------
-- 8. Stock Validation
------------------------------------------------------------
SELECT *
FROM master.Warehouse_Transfers_Master
WHERE Stock_After_From > Stock_Before_From
   OR Stock_After_To < Stock_Before_To;
GO

------------------------------------------------------------
-- 9. Missing Dates
------------------------------------------------------------
SELECT *
FROM master.Warehouse_Transfers_Master
WHERE Transfer_Date IS NULL;
GO

------------------------------------------------------------
-- 10. Summary Statistics
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

FROM master.Warehouse_Transfers_Master;
GO