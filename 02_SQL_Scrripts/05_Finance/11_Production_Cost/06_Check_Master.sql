USE Chocolate_Manufacturing_DW;
GO

/*============================================================
06_Check_Production_Cost_Master.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM master.Production_Cost_Master;
GO

------------------------------------------------------------
-- 2. Preview Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Production_Cost_Master
ORDER BY Production_Cost_ID;
GO

------------------------------------------------------------
-- 3. Missing Primary Key
------------------------------------------------------------
SELECT COUNT(*) AS Missing_Production_Cost_ID
FROM master.Production_Cost_Master
WHERE Production_Cost_ID IS NULL;
GO

------------------------------------------------------------
-- 4. Duplicate Production Cost IDs
------------------------------------------------------------
SELECT
    Production_Cost_ID,
    COUNT(*) AS DuplicateCount
FROM master.Production_Cost_Master
GROUP BY Production_Cost_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 5. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Production_Order_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Production_Order,

SUM(CASE WHEN Product_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Product,

SUM(CASE WHEN Cost_Center_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Cost_Center,

SUM(CASE WHEN GL_Account_ID IS NULL THEN 1 ELSE 0 END) AS Missing_GL_Account

FROM master.Production_Cost_Master;
GO

------------------------------------------------------------
-- 6. Invalid Values
------------------------------------------------------------
SELECT *
FROM master.Production_Cost_Master
WHERE Material_Cost_USD < 0
   OR Labor_Cost_USD < 0
   OR Machine_Cost_USD < 0
   OR Energy_Cost_USD < 0
   OR Water_Cost_USD < 0
   OR Steam_Cost_USD < 0
   OR Compressed_Air_Cost_USD < 0
   OR Maintenance_Cost_USD < 0
   OR Quality_Cost_USD < 0
   OR Packaging_Cost_USD < 0
   OR Overhead_Cost_USD < 0
   OR Total_Production_Cost_USD < 0
   OR Produced_Qty_kg <= 0
   OR Unit_Cost_USD_per_kg < 0;
GO

------------------------------------------------------------
-- 7. Summary Statistics
------------------------------------------------------------
SELECT

MIN(Total_Production_Cost_USD) AS Min_Total_Cost,
MAX(Total_Production_Cost_USD) AS Max_Total_Cost,
AVG(Total_Production_Cost_USD) AS Avg_Total_Cost,

MIN(Produced_Qty_kg) AS Min_Qty,
MAX(Produced_Qty_kg) AS Max_Qty,
AVG(Produced_Qty_kg) AS Avg_Qty,

MIN(Unit_Cost_USD_per_kg) AS Min_Unit_Cost,
MAX(Unit_Cost_USD_per_kg) AS Max_Unit_Cost,
AVG(Unit_Cost_USD_per_kg) AS Avg_Unit_Cost

FROM master.Production_Cost_Master;
GO