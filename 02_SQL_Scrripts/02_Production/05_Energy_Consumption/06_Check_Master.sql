USE Chocolate_Manufacturing_DW;
GO

/*============================================================
06_Check_Energy_Consumption_Master.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM master.Energy_Consumption_Master;
GO

------------------------------------------------------------
-- 2. Preview Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Energy_Consumption_Master
ORDER BY Energy_Record_ID;
GO

------------------------------------------------------------
-- 3. Missing Primary Key
------------------------------------------------------------
SELECT COUNT(*) AS Missing_Energy_Record_ID
FROM master.Energy_Consumption_Master
WHERE Energy_Record_ID IS NULL;
GO

------------------------------------------------------------
-- 4. Duplicate IDs
------------------------------------------------------------
SELECT
    Energy_Record_ID,
    COUNT(*) AS DuplicateCount
FROM master.Energy_Consumption_Master
GROUP BY Energy_Record_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 5. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Equipment_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Equipment,

SUM(CASE WHEN Meter_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Meter,

SUM(CASE WHEN Energy_Consumption_kWh IS NULL THEN 1 ELSE 0 END) AS Missing_Energy

FROM master.Energy_Consumption_Master;
GO

------------------------------------------------------------
-- 6. Negative Energy Values
------------------------------------------------------------
SELECT *
FROM master.Energy_Consumption_Master
WHERE Energy_Consumption_kWh < 0
   OR Peak_Demand_kW < 0
   OR Reactive_Energy_kVARh < 0;
GO

------------------------------------------------------------
-- 7. Invalid Power Factor
------------------------------------------------------------
SELECT *
FROM master.Energy_Consumption_Master
WHERE Power_Factor < 0
   OR Power_Factor > 1;
GO

------------------------------------------------------------
-- 8. Negative Costs
------------------------------------------------------------
SELECT *
FROM master.Energy_Consumption_Master
WHERE Energy_Cost_USD < 0
   OR CO2_Emission_kg < 0;
GO

------------------------------------------------------------
-- 9. Summary Statistics
------------------------------------------------------------
SELECT

MIN(Energy_Consumption_kWh) AS Min_kWh,
MAX(Energy_Consumption_kWh) AS Max_kWh,
AVG(Energy_Consumption_kWh) AS Avg_kWh,

MIN(Peak_Demand_kW) AS Min_Peak,
MAX(Peak_Demand_kW) AS Max_Peak,
AVG(Peak_Demand_kW) AS Avg_Peak,

MIN(Energy_Cost_USD) AS Min_Cost,
MAX(Energy_Cost_USD) AS Max_Cost,
AVG(Energy_Cost_USD) AS Avg_Cost

FROM master.Energy_Consumption_Master;
GO