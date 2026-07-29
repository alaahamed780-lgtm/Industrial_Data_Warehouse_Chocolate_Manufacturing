USE Chocolate_Manufacturing_DW;
GO

/*============================================================
03_Data_Quality_Chiller_Operation_Log.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS Stage_Count
FROM staging.Chiller_Operation_Log_Stage;
GO

------------------------------------------------------------
-- 2. Duplicate Chiller Log IDs
------------------------------------------------------------
SELECT
    Chiller_Log_ID,
    COUNT(*) AS DuplicateCount
FROM staging.Chiller_Operation_Log_Stage
GROUP BY Chiller_Log_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Chiller_Log_ID IS NULL
          OR LTRIM(RTRIM(Chiller_Log_ID))='' THEN 1 ELSE 0 END) AS Missing_Log_ID,

SUM(CASE WHEN Chiller_ID IS NULL
          OR LTRIM(RTRIM(Chiller_ID))='' THEN 1 ELSE 0 END) AS Missing_Chiller,

SUM(CASE WHEN Equipment_ID IS NULL
          OR LTRIM(RTRIM(Equipment_ID))='' THEN 1 ELSE 0 END) AS Missing_Equipment,

SUM(CASE WHEN Power_Consumption_kWh IS NULL
          OR LTRIM(RTRIM(Power_Consumption_kWh))='' THEN 1 ELSE 0 END) AS Missing_Power

FROM staging.Chiller_Operation_Log_Stage;
GO

------------------------------------------------------------
-- 4. Invalid Calendar Date
------------------------------------------------------------
SELECT *
FROM staging.Chiller_Operation_Log_Stage
WHERE TRY_CONVERT(INT, Calendar_Date_Key) IS NULL
AND NULLIF(LTRIM(RTRIM(Calendar_Date_Key)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 5. Invalid Reading Date
------------------------------------------------------------
SELECT *
FROM staging.Chiller_Operation_Log_Stage
WHERE TRY_CONVERT(DATE, Reading_Date) IS NULL
AND NULLIF(LTRIM(RTRIM(Reading_Date)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 6. Invalid Reading DateTime
------------------------------------------------------------
SELECT *
FROM staging.Chiller_Operation_Log_Stage
WHERE TRY_CONVERT(DATETIME2, Reading_DateTime) IS NULL
AND NULLIF(LTRIM(RTRIM(Reading_DateTime)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 7. Invalid Runtime
------------------------------------------------------------
SELECT *
FROM staging.Chiller_Operation_Log_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Runtime_Min) IS NULL
AND NULLIF(LTRIM(RTRIM(Runtime_Min)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 8. Invalid Power Consumption
------------------------------------------------------------
SELECT *
FROM staging.Chiller_Operation_Log_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Power_Consumption_kWh) IS NULL
AND NULLIF(LTRIM(RTRIM(Power_Consumption_kWh)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 9. Invalid Cooling Load
------------------------------------------------------------
SELECT *
FROM staging.Chiller_Operation_Log_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Cooling_Load_TR) IS NULL
AND NULLIF(LTRIM(RTRIM(Cooling_Load_TR)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 10. Invalid COP
------------------------------------------------------------
SELECT *
FROM staging.Chiller_Operation_Log_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), COP) IS NULL
AND NULLIF(LTRIM(RTRIM(COP)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 11. Invalid Chilled Water Flow
------------------------------------------------------------
SELECT *
FROM staging.Chiller_Operation_Log_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Chilled_Water_Flow_m3h) IS NULL
AND NULLIF(LTRIM(RTRIM(Chilled_Water_Flow_m3h)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 12. Invalid Temperatures
------------------------------------------------------------
SELECT *
FROM staging.Chiller_Operation_Log_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Evaporator_Inlet_Temp_C) IS NULL
   OR TRY_CONVERT(DECIMAL(18,2), Evaporator_Outlet_Temp_C) IS NULL
   OR TRY_CONVERT(DECIMAL(18,2), Condenser_Inlet_Temp_C) IS NULL
   OR TRY_CONVERT(DECIMAL(18,2), Condenser_Outlet_Temp_C) IS NULL;
GO

------------------------------------------------------------
-- 13. Ambient Temperature
------------------------------------------------------------
SELECT *
FROM staging.Chiller_Operation_Log_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Ambient_Temp_C) IS NULL
AND NULLIF(LTRIM(RTRIM(Ambient_Temp_C)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 14. Statistics
------------------------------------------------------------
SELECT

MIN(TRY_CONVERT(DECIMAL(18,2), Cooling_Load_TR)) AS Min_Load,
MAX(TRY_CONVERT(DECIMAL(18,2), Cooling_Load_TR)) AS Max_Load,
AVG(TRY_CONVERT(DECIMAL(18,2), Cooling_Load_TR)) AS Avg_Load,

MIN(TRY_CONVERT(DECIMAL(18,2), COP)) AS Min_COP,
MAX(TRY_CONVERT(DECIMAL(18,2), COP)) AS Max_COP,
AVG(TRY_CONVERT(DECIMAL(18,2), COP)) AS Avg_COP,

MIN(TRY_CONVERT(DECIMAL(18,2), Power_Consumption_kWh)) AS Min_Power,
MAX(TRY_CONVERT(DECIMAL(18,2), Power_Consumption_kWh)) AS Max_Power,
AVG(TRY_CONVERT(DECIMAL(18,2), Power_Consumption_kWh)) AS Avg_Power

FROM staging.Chiller_Operation_Log_Stage;
GO

------------------------------------------------------------
-- 15. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM staging.Chiller_Operation_Log_Stage
ORDER BY Chiller_Log_ID;
GO