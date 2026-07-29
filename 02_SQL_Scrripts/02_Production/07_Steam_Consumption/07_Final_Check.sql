USE Chocolate_Manufacturing_DW;
GO

/*============================================================
07_Final_Check_Steam_Consumption.sql
============================================================*/

------------------------------------------------------------
-- 1. Compare Stage vs Master
------------------------------------------------------------
SELECT

(SELECT COUNT(*) FROM staging.Steam_Consumption_Stage) AS Stage_Count,

(SELECT COUNT(*) FROM master.Steam_Consumption_Master) AS Master_Count,

(SELECT COUNT(*) FROM staging.Steam_Consumption_Stage)
-
(SELECT COUNT(*) FROM master.Steam_Consumption_Master) AS Difference;
GO

------------------------------------------------------------
-- 2. Distinct IDs
------------------------------------------------------------
SELECT
COUNT(DISTINCT Steam_Record_ID) AS Distinct_Steam_Records
FROM master.Steam_Consumption_Master;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Steam_Record_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Record_ID,

SUM(CASE WHEN Equipment_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Equipment,

SUM(CASE WHEN Steam_Meter_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Steam_Meter,

SUM(CASE WHEN Steam_Consumption_kg IS NULL THEN 1 ELSE 0 END) AS Missing_Steam

FROM master.Steam_Consumption_Master;
GO

------------------------------------------------------------
-- 4. Steam Statistics
------------------------------------------------------------
SELECT

MIN(Steam_Consumption_kg) AS Min_Steam,
MAX(Steam_Consumption_kg) AS Max_Steam,
AVG(Steam_Consumption_kg) AS Avg_Steam,

MIN(Steam_Cost_USD) AS Min_Cost,
MAX(Steam_Cost_USD) AS Max_Cost,
AVG(Steam_Cost_USD) AS Avg_Cost,

MIN(Boiler_Efficiency_Percent) AS Min_Efficiency,
MAX(Boiler_Efficiency_Percent) AS Max_Efficiency,
AVG(Boiler_Efficiency_Percent) AS Avg_Efficiency

FROM master.Steam_Consumption_Master;
GO

------------------------------------------------------------
-- 5. Date Range
------------------------------------------------------------
SELECT

MIN(Reading_Date) AS First_Reading,
MAX(Reading_Date) AS Last_Reading

FROM master.Steam_Consumption_Master;
GO

------------------------------------------------------------
-- 6. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Steam_Consumption_Master
ORDER BY Steam_Record_ID;
GO