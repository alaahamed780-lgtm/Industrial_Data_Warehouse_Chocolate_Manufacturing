USE Chocolate_Manufacturing_DW;
GO

/*============================================================
07_Final_Check_Energy_Consumption.sql
============================================================*/

------------------------------------------------------------
-- 1. Compare Stage vs Master
------------------------------------------------------------
SELECT

(SELECT COUNT(*) FROM staging.Energy_Consumption_Stage) AS Stage_Count,

(SELECT COUNT(*) FROM master.Energy_Consumption_Master) AS Master_Count,

(SELECT COUNT(*) FROM staging.Energy_Consumption_Stage)
-
(SELECT COUNT(*) FROM master.Energy_Consumption_Master) AS Difference;
GO

------------------------------------------------------------
-- 2. Distinct IDs
------------------------------------------------------------
SELECT
COUNT(DISTINCT Energy_Record_ID) AS Distinct_Energy_Records
FROM master.Energy_Consumption_Master;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Energy_Record_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Record_ID,

SUM(CASE WHEN Equipment_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Equipment,

SUM(CASE WHEN Meter_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Meter,

SUM(CASE WHEN Energy_Consumption_kWh IS NULL THEN 1 ELSE 0 END) AS Missing_Energy

FROM master.Energy_Consumption_Master;
GO

------------------------------------------------------------
-- 4. Energy Statistics
------------------------------------------------------------
SELECT

MIN(Energy_Consumption_kWh) AS Min_kWh,
MAX(Energy_Consumption_kWh) AS Max_kWh,
AVG(Energy_Consumption_kWh) AS Avg_kWh,

MIN(Energy_Cost_USD) AS Min_Cost,
MAX(Energy_Cost_USD) AS Max_Cost,
AVG(Energy_Cost_USD) AS Avg_Cost,

MIN(CO2_Emission_kg) AS Min_CO2,
MAX(CO2_Emission_kg) AS Max_CO2,
AVG(CO2_Emission_kg) AS Avg_CO2

FROM master.Energy_Consumption_Master;
GO

------------------------------------------------------------
-- 5. Date Range
------------------------------------------------------------
SELECT

MIN(Reading_Date) AS First_Reading,
MAX(Reading_Date) AS Last_Reading

FROM master.Energy_Consumption_Master;
GO

------------------------------------------------------------
-- 6. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Energy_Consumption_Master
ORDER BY Energy_Record_ID;
GO