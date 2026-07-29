USE Chocolate_Manufacturing_DW;
GO

/*==============================================================
 Inventory Transactions Master Validation
==============================================================*/

--------------------------------------------------------------
-- 1. Row Count
--------------------------------------------------------------
SELECT COUNT(*) AS Master_Count
FROM master.Inventory_Transactions_Master;
GO

--------------------------------------------------------------
-- 2. Duplicate Primary Key
--------------------------------------------------------------
SELECT
    Inventory_Transaction_ID,
    COUNT(*) AS DuplicateCount
FROM master.Inventory_Transactions_Master
GROUP BY Inventory_Transaction_ID
HAVING COUNT(*) > 1;
GO

--------------------------------------------------------------
-- 3. Missing Primary Fields
--------------------------------------------------------------
SELECT
SUM(CASE WHEN Inventory_Transaction_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Transaction_ID,
SUM(CASE WHEN Material_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Material_ID,
SUM(CASE WHEN Warehouse IS NULL THEN 1 ELSE 0 END) AS Missing_Warehouse,
SUM(CASE WHEN Quantity IS NULL THEN 1 ELSE 0 END) AS Missing_Quantity,
SUM(CASE WHEN Transaction_Date IS NULL THEN 1 ELSE 0 END) AS Missing_Transaction_Date
FROM master.Inventory_Transactions_Master;
GO

--------------------------------------------------------------
-- 4. Invalid Quantities
--------------------------------------------------------------
SELECT *
FROM master.Inventory_Transactions_Master
WHERE Quantity <= 0;
GO

--------------------------------------------------------------
-- 5. Invalid Costs
--------------------------------------------------------------
SELECT *
FROM master.Inventory_Transactions_Master
WHERE Unit_Cost_USD < 0
   OR Extended_Cost_USD < 0;
GO

--------------------------------------------------------------
-- 6. Invalid Stock
--------------------------------------------------------------
SELECT *
FROM master.Inventory_Transactions_Master
WHERE Stock_Before < 0
   OR Stock_After < 0;
GO

--------------------------------------------------------------
-- 7. Invalid Dates
--------------------------------------------------------------
SELECT *
FROM master.Inventory_Transactions_Master
WHERE Transaction_Date > GETDATE();
GO

--------------------------------------------------------------
-- 8. Summary Statistics
--------------------------------------------------------------
SELECT

MIN(Quantity) AS Min_Qty,
MAX(Quantity) AS Max_Qty,
AVG(Quantity) AS Avg_Qty,

MIN(Unit_Cost_USD) AS Min_Cost,
MAX(Unit_Cost_USD) AS Max_Cost,
AVG(Unit_Cost_USD) AS Avg_Cost,

MIN(Stock_Before) AS Min_Stock_Before,
MAX(Stock_Before) AS Max_Stock_Before,

MIN(Stock_After) AS Min_Stock_After,
MAX(Stock_After) AS Max_Stock_After

FROM master.Inventory_Transactions_Master;
GO

--------------------------------------------------------------
-- 9. Date Summary
--------------------------------------------------------------
SELECT
MIN(Transaction_Date) AS First_Transaction,
MAX(Transaction_Date) AS Last_Transaction
FROM master.Inventory_Transactions_Master;
GO

--------------------------------------------------------------
-- 10. Sample Data
--------------------------------------------------------------
SELECT TOP (20) *
FROM master.Inventory_Transactions_Master
ORDER BY Inventory_Transaction_ID;
GO