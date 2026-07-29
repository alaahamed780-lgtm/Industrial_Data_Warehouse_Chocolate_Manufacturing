USE Chocolate_Manufacturing_DW;
GO

/*==============================================================
 Final Validation
 Inventory Transactions
==============================================================*/

----------------------------------------------------------
-- 1. Compare Stage vs Master
----------------------------------------------------------

SELECT
    (SELECT COUNT(*) FROM staging.Inventory_Transactions_Stage) AS Stage_Count,
    (SELECT COUNT(*) FROM master.Inventory_Transactions_Master) AS Master_Count,
    (
        SELECT COUNT(*) FROM staging.Inventory_Transactions_Stage
    ) -
    (
        SELECT COUNT(*) FROM master.Inventory_Transactions_Master
    ) AS Difference;
GO

----------------------------------------------------------
-- 2. Distinct Transaction IDs
----------------------------------------------------------

SELECT
COUNT(DISTINCT Inventory_Transaction_ID) AS Distinct_Transactions
FROM master.Inventory_Transactions_Master;
GO

----------------------------------------------------------
-- 3. Missing Critical Fields
----------------------------------------------------------

SELECT

SUM(CASE WHEN Inventory_Transaction_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Transaction_ID,

SUM(CASE WHEN Material_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Material,

SUM(CASE WHEN Warehouse IS NULL THEN 1 ELSE 0 END) AS Missing_Warehouse,

SUM(CASE WHEN Quantity IS NULL THEN 1 ELSE 0 END) AS Missing_Quantity

FROM master.Inventory_Transactions_Master;
GO

----------------------------------------------------------
-- 4. Quantity Summary
----------------------------------------------------------

SELECT

MIN(Quantity) AS Min_Qty,
MAX(Quantity) AS Max_Qty,
AVG(Quantity) AS Avg_Qty,
SUM(Quantity) AS Total_Qty

FROM master.Inventory_Transactions_Master;
GO

----------------------------------------------------------
-- 5. Cost Summary
----------------------------------------------------------

SELECT

MIN(Unit_Cost_USD) AS Min_Unit_Cost,
MAX(Unit_Cost_USD) AS Max_Unit_Cost,
AVG(Unit_Cost_USD) AS Avg_Unit_Cost,

MIN(Extended_Cost_USD) AS Min_Extended_Cost,
MAX(Extended_Cost_USD) AS Max_Extended_Cost,
AVG(Extended_Cost_USD) AS Avg_Extended_Cost

FROM master.Inventory_Transactions_Master;
GO

----------------------------------------------------------
-- 6. Stock Summary
----------------------------------------------------------

SELECT

MIN(Stock_Before) AS Min_Stock_Before,
MAX(Stock_Before) AS Max_Stock_Before,

MIN(Stock_After) AS Min_Stock_After,
MAX(Stock_After) AS Max_Stock_After

FROM master.Inventory_Transactions_Master;
GO

----------------------------------------------------------
-- 7. Date Summary
----------------------------------------------------------

SELECT

MIN(Transaction_Date) AS First_Transaction,
MAX(Transaction_Date) AS Last_Transaction,

MIN(Transaction_DateTime) AS First_DateTime,
MAX(Transaction_DateTime) AS Last_DateTime

FROM master.Inventory_Transactions_Master;
GO

----------------------------------------------------------
-- 8. Sample Data
----------------------------------------------------------

SELECT TOP (20) *
FROM master.Inventory_Transactions_Master
ORDER BY Inventory_Transaction_ID;
GO