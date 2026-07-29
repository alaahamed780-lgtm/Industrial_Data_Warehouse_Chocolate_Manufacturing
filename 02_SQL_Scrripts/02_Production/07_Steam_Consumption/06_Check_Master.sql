USE Chocolate_Manufacturing_DW;
GO

/*============================================================
06_Check_Steam_Consumption_Master.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM master.Steam_Consumption_Master;
GO

------------------------------------------------------------
-- 2. Preview Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Steam_Consumption_Master
ORDER BY Steam_Record_ID;
GO

------------------------------------------------------------
-- 3. Missing Primary Key
------------------------------------------------------------
SELECT COUNT(*) AS Missing_Steam_Record_ID
FROM master.Steam_Consumption_Master
WHERE Steam_Record_ID IS NULL;
GO

------------------------------------------------------------
-- 4. Duplicate IDs
------------------------------------------------------------
SELECT
    Steam_Record_ID,
    COUNT(*) AS DuplicateCount
FROM master.Steam_Consumption_Master
GROUP BY Steam_Record_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 5. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Equipment_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Equipment,

SUM(CASE WHEN Steam_Meter_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Steam_Meter,

SUM(CASE WHEN Boiler_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Boiler,

SUM(CASE WHEN Steam_Consumption_kg IS NULL THEN 1 ELSE 0 END) AS Missing_Steam

FROM master.Steam_Consumption_Master;
GO

------------------------------------------------------------
-- 6. Negative Values
------------------------------------------------------------
SELECT *
FROM master.Steam_Consumption_Master
WHERE Steam_Consumption_kg < 0
   OR Runtime_Min < 0
   OR Production_Qty_kg < 0;
GO

------------------------------------------------------------
-- 7. Invalid Boiler Efficiency
------------------------------------------------------------
SELECT *
FROM master.Steam_Consumption_Master
WHERE Boiler_Efficiency_Percent < 0
   OR Boiler_Efficiency_Percent > 100;
GO

------------------------------------------------------------
-- 8. Negative Cost
------------------------------------------------------------
SELECT *
FROM master.Steam_Consumption_Master
WHERE Steam_Cost_USD < 0;
GO

------------------------------------------------------------
-- 9. Summary Statistics
------------------------------------------------------------
SELECT

MIN(Steam_Consumption_kg) AS Min_Steam,
MAX(Steam_Consumption_kg) AS Max_Steam,
AVG(Steam_Consumption_kg) AS Avg_Steam,

MIN(Steam_Pressure_bar) AS Min_Pressure,
MAX(Steam_Pressure_bar) AS Max_Pressure,
AVG(Steam_Pressure_bar) AS Avg_Pressure,

MIN(Steam_Cost_USD) AS Min_Cost,
MAX(Steam_Cost_USD) AS Max_Cost,
AVG(Steam_Cost_USD) AS Avg_Cost

FROM master.Steam_Consumption_Master;
GO