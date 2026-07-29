USE Chocolate_Manufacturing_DW;
GO

/*============================================================
07_Final_Check_Chiller_Operation_Log.sql
============================================================*/

------------------------------------------------------------
-- 1. Compare Stage vs Master
------------------------------------------------------------
SELECT

(SELECT COUNT(*) FROM staging.Chiller_Operation_Log_Stage) AS Stage_Count,

(SELECT COUNT(*) FROM master.Chiller_Operation_Log_Master) AS Master_Count,

(SELECT COUNT(*) FROM staging.Chiller_Operation_Log_Stage)
-
(SELECT COUNT(*) FROM master.Chiller_Operation_Log_Master) AS Difference;
GO

------------------------------------------------------------
-- 2. Distinct IDs
------------------------------------------------------------
SELECT
COUNT(DISTINCT Chiller_Log_ID) AS Distinct_Chiller_Logs
FROM master.Chiller_Operation_Log_Master;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Chiller_Log_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Log_ID,

SUM(CASE WHEN Chiller_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Chiller,

SUM(CASE WHEN Equipment_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Equipment,

SUM(CASE WHEN Power_Consumption_kWh IS NULL THEN 1 ELSE 0 END) AS Missing_Power

FROM master.Chiller_Operation_Log_Master;
GO

------------------------------------------------------------
-- 4. Performance Statistics
------------------------------------------------------------
SELECT

MIN(Cooling_Load_TR) AS Min_Load,
MAX(Cooling_Load_TR) AS Max_Load,
AVG(Cooling_Load_TR) AS Avg_Load,

MIN(COP) AS Min_COP,
MAX(COP) AS Max_COP,
AVG(COP) AS Avg_COP,

MIN(Power_Consumption_kWh) AS Min_Power,
MAX(Power_Consumption_kWh) AS Max_Power,
AVG(Power_Consumption_kWh) AS Avg_Power

FROM master.Chiller_Operation_Log_Master;
GO

------------------------------------------------------------
-- 5. Date Range
------------------------------------------------------------
SELECT

MIN(Reading_Date) AS First_Reading,
MAX(Reading_Date) AS Last_Reading

FROM master.Chiller_Operation_Log_Master;
GO

------------------------------------------------------------
-- 6. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Chiller_Operation_Log_Master
ORDER BY Chiller_Log_ID;
GO