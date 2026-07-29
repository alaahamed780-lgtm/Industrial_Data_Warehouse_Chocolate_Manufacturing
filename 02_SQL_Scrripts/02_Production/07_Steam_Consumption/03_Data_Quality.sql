USE Chocolate_Manufacturing_DW;
GO

/*============================================================
03_Data_Quality_Steam_Consumption.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS Stage_Count
FROM staging.Steam_Consumption_Stage;
GO

------------------------------------------------------------
-- 2. Duplicate Steam Record IDs
------------------------------------------------------------
SELECT
    Steam_Record_ID,
    COUNT(*) AS DuplicateCount
FROM staging.Steam_Consumption_Stage
GROUP BY Steam_Record_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Steam_Record_ID IS NULL
          OR LTRIM(RTRIM(Steam_Record_ID))='' THEN 1 ELSE 0 END) AS Missing_Record_ID,

SUM(CASE WHEN Equipment_ID IS NULL
          OR LTRIM(RTRIM(Equipment_ID))='' THEN 1 ELSE 0 END) AS Missing_Equipment,

SUM(CASE WHEN Steam_Meter_ID IS NULL
          OR LTRIM(RTRIM(Steam_Meter_ID))='' THEN 1 ELSE 0 END) AS Missing_Meter,

SUM(CASE WHEN Steam_Consumption_kg IS NULL
          OR LTRIM(RTRIM(Steam_Consumption_kg))='' THEN 1 ELSE 0 END) AS Missing_Steam

FROM staging.Steam_Consumption_Stage;
GO

------------------------------------------------------------
-- 4. Invalid Calendar Date
------------------------------------------------------------
SELECT *
FROM staging.Steam_Consumption_Stage
WHERE TRY_CONVERT(INT, Calendar_Date_Key) IS NULL
AND NULLIF(LTRIM(RTRIM(Calendar_Date_Key)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 5. Invalid Reading Date
------------------------------------------------------------
SELECT *
FROM staging.Steam_Consumption_Stage
WHERE TRY_CONVERT(DATE, Reading_Date) IS NULL
AND NULLIF(LTRIM(RTRIM(Reading_Date)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 6. Invalid Reading DateTime
------------------------------------------------------------
SELECT *
FROM staging.Steam_Consumption_Stage
WHERE TRY_CONVERT(DATETIME2, Reading_DateTime) IS NULL
AND NULLIF(LTRIM(RTRIM(Reading_DateTime)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 7. Invalid Runtime
------------------------------------------------------------
SELECT *
FROM staging.Steam_Consumption_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Runtime_Min) IS NULL
AND NULLIF(LTRIM(RTRIM(Runtime_Min)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 8. Invalid Steam Consumption
------------------------------------------------------------
SELECT *
FROM staging.Steam_Consumption_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Steam_Consumption_kg) IS NULL
AND NULLIF(LTRIM(RTRIM(Steam_Consumption_kg)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 9. Invalid Steam Pressure
------------------------------------------------------------
SELECT *
FROM staging.Steam_Consumption_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Steam_Pressure_bar) IS NULL
AND NULLIF(LTRIM(RTRIM(Steam_Pressure_bar)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 10. Invalid Steam Temperature
------------------------------------------------------------
SELECT *
FROM staging.Steam_Consumption_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Steam_Temperature_C) IS NULL
AND NULLIF(LTRIM(RTRIM(Steam_Temperature_C)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 11. Invalid Boiler Efficiency
------------------------------------------------------------
SELECT *
FROM staging.Steam_Consumption_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Boiler_Efficiency_Percent) IS NULL
AND NULLIF(LTRIM(RTRIM(Boiler_Efficiency_Percent)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 12. Invalid Steam Cost
------------------------------------------------------------
SELECT *
FROM staging.Steam_Consumption_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Steam_Cost_USD) IS NULL
AND NULLIF(LTRIM(RTRIM(Steam_Cost_USD)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 13. Statistics
------------------------------------------------------------
SELECT

MIN(TRY_CONVERT(DECIMAL(18,2), Steam_Consumption_kg)) AS Min_Steam,
MAX(TRY_CONVERT(DECIMAL(18,2), Steam_Consumption_kg)) AS Max_Steam,
AVG(TRY_CONVERT(DECIMAL(18,2), Steam_Consumption_kg)) AS Avg_Steam,

MIN(TRY_CONVERT(DECIMAL(18,2), Steam_Pressure_bar)) AS Min_Pressure,
MAX(TRY_CONVERT(DECIMAL(18,2), Steam_Pressure_bar)) AS Max_Pressure,
AVG(TRY_CONVERT(DECIMAL(18,2), Steam_Pressure_bar)) AS Avg_Pressure,

MIN(TRY_CONVERT(DECIMAL(18,2), Steam_Cost_USD)) AS Min_Cost,
MAX(TRY_CONVERT(DECIMAL(18,2), Steam_Cost_USD)) AS Max_Cost,
AVG(TRY_CONVERT(DECIMAL(18,2), Steam_Cost_USD)) AS Avg_Cost

FROM staging.Steam_Consumption_Stage;
GO

------------------------------------------------------------
-- 14. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM staging.Steam_Consumption_Stage
ORDER BY Steam_Record_ID;
GO