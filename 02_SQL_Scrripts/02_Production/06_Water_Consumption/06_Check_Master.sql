USE Chocolate_Manufacturing_DW;
GO

/*============================================================
06_Check_Water_Consumption_Master.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM master.Water_Consumption_Master;
GO

------------------------------------------------------------
-- 2. Preview Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Water_Consumption_Master
ORDER BY Water_Record_ID;
GO

------------------------------------------------------------
-- 3. Missing Primary Key
------------------------------------------------------------
SELECT COUNT(*) AS Missing_Water_Record_ID
FROM master.Water_Consumption_Master
WHERE Water_Record_ID IS NULL;
GO

------------------------------------------------------------
-- 4. Duplicate IDs
------------------------------------------------------------
SELECT
    Water_Record_ID,
    COUNT(*) AS DuplicateCount
FROM master.Water_Consumption_Master
GROUP BY Water_Record_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 5. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Equipment_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Equipment,

SUM(CASE WHEN Meter_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Meter,

SUM(CASE WHEN Water_Consumption_L IS NULL THEN 1 ELSE 0 END) AS Missing_Water

FROM master.Water_Consumption_Master;
GO

------------------------------------------------------------
-- 6. Negative Water Values
------------------------------------------------------------
SELECT *
FROM master.Water_Consumption_Master
WHERE Water_Consumption_L < 0
   OR Runtime_Min < 0
   OR Production_Qty_kg < 0;
GO

------------------------------------------------------------
-- 7. Negative Cost
------------------------------------------------------------
SELECT *
FROM master.Water_Consumption_Master
WHERE Water_Cost_USD < 0;
GO

------------------------------------------------------------
-- 8. Invalid Pressure or Temperature
------------------------------------------------------------
SELECT *
FROM master.Water_Consumption_Master
WHERE Water_Pressure_bar < 0
   OR Water_Temperature_C < 0;
GO

------------------------------------------------------------
-- 9. Summary Statistics
------------------------------------------------------------
SELECT

MIN(Water_Consumption_L) AS Min_Water,
MAX(Water_Consumption_L) AS Max_Water,
AVG(Water_Consumption_L) AS Avg_Water,

MIN(Water_Cost_USD) AS Min_Cost,
MAX(Water_Cost_USD) AS Max_Cost,
AVG(Water_Cost_USD) AS Avg_Cost,

MIN(Water_Pressure_bar) AS Min_Pressure,
MAX(Water_Pressure_bar) AS Max_Pressure,
AVG(Water_Pressure_bar) AS Avg_Pressure

FROM master.Water_Consumption_Master;
GO