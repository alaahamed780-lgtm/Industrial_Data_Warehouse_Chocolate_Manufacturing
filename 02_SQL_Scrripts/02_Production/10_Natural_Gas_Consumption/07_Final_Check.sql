USE Chocolate_Manufacturing_DW;
GO

/*============================================================
07_Final_Check_Natural_Gas_Consumption.sql
============================================================*/

------------------------------------------------------------
-- 1. Compare Stage vs Master
------------------------------------------------------------
SELECT

(SELECT COUNT(*) FROM staging.Natural_Gas_Consumption_Stage) AS Stage_Count,

(SELECT COUNT(*) FROM master.Natural_Gas_Consumption_Master) AS Master_Count,

(SELECT COUNT(*) FROM staging.Natural_Gas_Consumption_Stage)
-
(SELECT COUNT(*) FROM master.Natural_Gas_Consumption_Master) AS Difference;
GO

------------------------------------------------------------
-- 2. Distinct IDs
------------------------------------------------------------
SELECT
COUNT(DISTINCT Gas_Record_ID) AS Distinct_Gas_Records
FROM master.Natural_Gas_Consumption_Master;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Gas_Record_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Record_ID,

SUM(CASE WHEN Equipment_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Equipment,

SUM(CASE WHEN Gas_Meter_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Gas_Meter,

SUM(CASE WHEN Boiler_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Boiler,

SUM(CASE WHEN Gas_Consumption_Nm3 IS NULL THEN 1 ELSE 0 END) AS Missing_Gas_Consumption

FROM master.Natural_Gas_Consumption_Master;
GO

------------------------------------------------------------
-- 4. Gas Statistics
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

------------------------------------------------------------
-- 5. Date Range
------------------------------------------------------------
SELECT

MIN(Reading_Date) AS First_Reading,
MAX(Reading_Date) AS Last_Reading

FROM master.Natural_Gas_Consumption_Master;
GO

------------------------------------------------------------
-- 6. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Natural_Gas_Consumption_Master
ORDER BY Gas_Record_ID;
GO