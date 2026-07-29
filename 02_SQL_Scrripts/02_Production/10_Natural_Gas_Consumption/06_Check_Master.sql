USE Chocolate_Manufacturing_DW;
GO

/*============================================================
06_Check_Natural_Gas_Consumption_Master.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM master.Natural_Gas_Consumption_Master;
GO

------------------------------------------------------------
-- 2. Preview Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Natural_Gas_Consumption_Master
ORDER BY Gas_Record_ID;
GO

------------------------------------------------------------
-- 3. Missing Primary Key
------------------------------------------------------------
SELECT COUNT(*) AS Missing_Gas_Record_ID
FROM master.Natural_Gas_Consumption_Master
WHERE Gas_Record_ID IS NULL;
GO

------------------------------------------------------------
-- 4. Duplicate IDs
------------------------------------------------------------
SELECT
    Gas_Record_ID,
    COUNT(*) AS DuplicateCount
FROM master.Natural_Gas_Consumption_Master
GROUP BY Gas_Record_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 5. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Equipment_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Equipment,

SUM(CASE WHEN Gas_Meter_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Gas_Meter,

SUM(CASE WHEN Boiler_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Boiler,

SUM(CASE WHEN Gas_Consumption_Nm3 IS NULL THEN 1 ELSE 0 END) AS Missing_Gas_Consumption

FROM master.Natural_Gas_Consumption_Master;
GO

------------------------------------------------------------
-- 6. Negative Values
------------------------------------------------------------
SELECT *
FROM master.Natural_Gas_Consumption_Master
WHERE Gas_Consumption_Nm3 < 0
   OR Runtime_Min < 0
   OR Production_Qty_kg < 0
   OR Gas_Cost_USD < 0
   OR CO2_Emission_kg < 0;
GO

------------------------------------------------------------
-- 7. Invalid Thermal Efficiency
------------------------------------------------------------
SELECT *
FROM master.Natural_Gas_Consumption_Master
WHERE Thermal_Efficiency_Percent < 0
   OR Thermal_Efficiency_Percent > 100;
GO

------------------------------------------------------------
-- 8. Summary Statistics
------------------------------------------------------------
SELECT

MIN(Gas_Consumption_Nm3) AS Min_Gas,
MAX(Gas_Consumption_Nm3) AS Max_Gas,
AVG(Gas_Consumption_Nm3) AS Avg_Gas,

MIN(Gas_Cost_USD) AS Min_Cost,
MAX(Gas_Cost_USD) AS Max_Cost,
AVG(Gas_Cost_USD) AS Avg_Cost,

MIN(CO2_Emission_kg) AS Min_CO2,
MAX(CO2_Emission_kg) AS Max_CO2,
AVG(CO2_Emission_kg) AS Avg_CO2

FROM master.Natural_Gas_Consumption_Master;
GO