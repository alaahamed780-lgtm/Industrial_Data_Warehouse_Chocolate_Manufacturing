USE Chocolate_Manufacturing_DW;
GO

/*============================================================
06_Check_Inventory_Balance_Master.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM master.Inventory_Balance_Master;
GO

------------------------------------------------------------
-- 2. Preview Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Inventory_Balance_Master
ORDER BY Inventory_Balance_ID;
GO

------------------------------------------------------------
-- 3. Missing Primary Key
------------------------------------------------------------
SELECT COUNT(*) AS Missing_Inventory_ID
FROM master.Inventory_Balance_Master
WHERE Inventory_Balance_ID IS NULL;
GO

------------------------------------------------------------
-- 4. Duplicate IDs
------------------------------------------------------------
SELECT
    Inventory_Balance_ID,
    COUNT(*) AS DuplicateCount
FROM master.Inventory_Balance_Master
GROUP BY Inventory_Balance_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 5. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Warehouse IS NULL THEN 1 ELSE 0 END) AS Missing_Warehouse,

SUM(CASE WHEN Quantity_On_Hand IS NULL THEN 1 ELSE 0 END) AS Missing_Qty_On_Hand,

SUM(CASE
        WHEN Material_ID IS NULL
         AND Spare_Part_ID IS NULL
         AND Product_ID IS NULL
        THEN 1
        ELSE 0
    END) AS Missing_Item

FROM master.Inventory_Balance_Master;
GO

------------------------------------------------------------
-- 6. Negative Quantities
------------------------------------------------------------
SELECT *
FROM master.Inventory_Balance_Master
WHERE Quantity_On_Hand < 0
   OR Reserved_Qty < 0
   OR Available_Qty < 0;
GO

------------------------------------------------------------
-- 7. Negative Costs
------------------------------------------------------------
SELECT *
FROM master.Inventory_Balance_Master
WHERE Average_Cost_USD < 0
   OR Inventory_Value_USD < 0;
GO

------------------------------------------------------------
-- 8. Quantity Validation
------------------------------------------------------------
SELECT *
FROM master.Inventory_Balance_Master
WHERE Available_Qty > Quantity_On_Hand
   OR Reserved_Qty > Quantity_On_Hand;
GO

------------------------------------------------------------
-- 9. Summary Statistics
------------------------------------------------------------
SELECT

MIN(Quantity_On_Hand) AS Min_Qty,
MAX(Quantity_On_Hand) AS Max_Qty,
AVG(Quantity_On_Hand) AS Avg_Qty,

MIN(Average_Cost_USD) AS Min_Cost,
MAX(Average_Cost_USD) AS Max_Cost,
AVG(Average_Cost_USD) AS Avg_Cost,

MIN(Inventory_Value_USD) AS Min_Value,
MAX(Inventory_Value_USD) AS Max_Value,
AVG(Inventory_Value_USD) AS Avg_Value

FROM master.Inventory_Balance_Master;
GO