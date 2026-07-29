USE Chocolate_Manufacturing_DW;
GO

/*============================================================
07_Final_Check_Compressed_Air_Consumption.sql
============================================================*/

------------------------------------------------------------
-- 1. Compare Stage vs Master
------------------------------------------------------------
SELECT

(SELECT COUNT(*) FROM staging.Compressed_Air_Consumption_Stage) AS Stage_Count,

(SELECT COUNT(*) FROM master.Compressed_Air_Consumption_Master) AS Master_Count,

(SELECT COUNT(*) FROM staging.Compressed_Air_Consumption_Stage)
-
(SELECT COUNT(*) FROM master.Compressed_Air_Consumption_Master) AS Difference;
GO

------------------------------------------------------------
-- 2. Distinct IDs
------------------------------------------------------------
SELECT
COUNT(DISTINCT Air_Record_ID) AS Distinct_Air_Records
FROM master.Compressed_Air_Consumption_Master;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Air_Record_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Record_ID,

SUM(CASE WHEN Equipment_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Equipment,

SUM(CASE WHEN Air_Meter_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Air_Meter,

SUM(CASE WHEN Compressor_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Compressor,

SUM(CASE WHEN Compressed_Air_Consumption_m3 IS NULL THEN 1 ELSE 0 END) AS Missing_Air_Consumption

FROM master.Compressed_Air_Consumption_Master;
GO

------------------------------------------------------------
-- 4. Air Statistics
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

------------------------------------------------------------
-- 5. Date Range
------------------------------------------------------------
SELECT

MIN(Reading_Date) AS First_Reading,
MAX(Reading_Date) AS Last_Reading

FROM master.Compressed_Air_Consumption_Master;
GO

------------------------------------------------------------
-- 6. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Compressed_Air_Consumption_Master
ORDER BY Air_Record_ID;
GO