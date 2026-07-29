USE Chocolate_Manufacturing_DW;
GO

/*============================================================
06_Check_Compressed_Air_Consumption_Master.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM master.Compressed_Air_Consumption_Master;
GO

------------------------------------------------------------
-- 2. Preview Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Compressed_Air_Consumption_Master
ORDER BY Air_Record_ID;
GO

------------------------------------------------------------
-- 3. Missing Primary Key
------------------------------------------------------------
SELECT COUNT(*) AS Missing_Air_Record_ID
FROM master.Compressed_Air_Consumption_Master
WHERE Air_Record_ID IS NULL;
GO

------------------------------------------------------------
-- 4. Duplicate IDs
------------------------------------------------------------
SELECT
    Air_Record_ID,
    COUNT(*) AS DuplicateCount
FROM master.Compressed_Air_Consumption_Master
GROUP BY Air_Record_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 5. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Equipment_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Equipment,

SUM(CASE WHEN Air_Meter_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Air_Meter,

SUM(CASE WHEN Compressor_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Compressor,

SUM(CASE WHEN Compressed_Air_Consumption_m3 IS NULL THEN 1 ELSE 0 END) AS Missing_Air_Consumption

FROM master.Compressed_Air_Consumption_Master;
GO

------------------------------------------------------------
-- 6. Negative Values
------------------------------------------------------------
SELECT *
FROM master.Compressed_Air_Consumption_Master
WHERE Compressed_Air_Consumption_m3 < 0
   OR Runtime_Min < 0
   OR Production_Qty_kg < 0
   OR Power_Consumption_kWh < 0;
GO

------------------------------------------------------------
-- 7. Invalid Compressor Efficiency
------------------------------------------------------------
SELECT *
FROM master.Compressed_Air_Consumption_Master
WHERE Compressor_Efficiency_Percent < 0
   OR Compressor_Efficiency_Percent > 100;
GO

------------------------------------------------------------
-- 8. Invalid Leakage Percentage
------------------------------------------------------------
SELECT *
FROM master.Compressed_Air_Consumption_Master
WHERE Leakage_Estimated_Percent < 0
   OR Leakage_Estimated_Percent > 100;
GO

------------------------------------------------------------
-- 9. Negative Cost
------------------------------------------------------------
SELECT *
FROM master.Compressed_Air_Consumption_Master
WHERE Air_Cost_USD < 0;
GO

------------------------------------------------------------
-- 10. Summary Statistics
------------------------------------------------------------
SELECT

MIN(Compressed_Air_Consumption_m3) AS Min_Air,
MAX(Compressed_Air_Consumption_m3) AS Max_Air,
AVG(Compressed_Air_Consumption_m3) AS Avg_Air,

MIN(Power_Consumption_kWh) AS Min_Power,
MAX(Power_Consumption_kWh) AS Max_Power,
AVG(Power_Consumption_kWh) AS Avg_Power,

MIN(Air_Cost_USD) AS Min_Cost,
MAX(Air_Cost_USD) AS Max_Cost,
AVG(Air_Cost_USD) AS Avg_Cost

FROM master.Compressed_Air_Consumption_Master;
GO