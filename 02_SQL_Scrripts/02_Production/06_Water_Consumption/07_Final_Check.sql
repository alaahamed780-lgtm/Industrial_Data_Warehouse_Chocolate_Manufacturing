USE Chocolate_Manufacturing_DW;
GO

/*============================================================
07_Final_Check_Water_Consumption.sql
============================================================*/

------------------------------------------------------------
-- 1. Compare Stage vs Master
------------------------------------------------------------
SELECT

(SELECT COUNT(*) FROM staging.Water_Consumption_Stage) AS Stage_Count,

(SELECT COUNT(*) FROM master.Water_Consumption_Master) AS Master_Count,

(SELECT COUNT(*) FROM staging.Water_Consumption_Stage)
-
(SELECT COUNT(*) FROM master.Water_Consumption_Master) AS Difference;
GO

------------------------------------------------------------
-- 2. Distinct IDs
------------------------------------------------------------
SELECT
COUNT(DISTINCT Water_Record_ID) AS Distinct_Water_Records
FROM master.Water_Consumption_Master;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Water_Record_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Record_ID,

SUM(CASE WHEN Equipment_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Equipment,

SUM(CASE WHEN Meter_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Meter,

SUM(CASE WHEN Water_Consumption_L IS NULL THEN 1 ELSE 0 END) AS Missing_Water

FROM master.Water_Consumption_Master;
GO

------------------------------------------------------------
-- 4. Water Statistics
------------------------------------------------------------
SELECT

MIN(Water_Consumption_L) AS Min_Water,
MAX(Water_Consumption_L) AS Max_Water,
AVG(Water_Consumption_L) AS Avg_Water,

MIN(Water_Cost_USD) AS Min_Cost,
MAX(Water_Cost_USD) AS Max_Cost,
AVG(Water_Cost_USD) AS Avg_Cost,

MIN(Water_Temperature_C) AS Min_Temp,
MAX(Water_Temperature_C) AS Max_Temp,
AVG(Water_Temperature_C) AS Avg_Temp

FROM master.Water_Consumption_Master;
GO

------------------------------------------------------------
-- 5. Date Range
------------------------------------------------------------
SELECT

MIN(Reading_Date) AS First_Reading,
MAX(Reading_Date) AS Last_Reading

FROM master.Water_Consumption_Master;
GO

------------------------------------------------------------
-- 6. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Water_Consumption_Master
ORDER BY Water_Record_ID;
GO