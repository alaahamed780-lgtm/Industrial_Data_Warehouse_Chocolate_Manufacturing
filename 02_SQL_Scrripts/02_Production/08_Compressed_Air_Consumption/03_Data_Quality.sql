USE Chocolate_Manufacturing_DW;
GO

/*============================================================
03_Data_Quality_Compressed_Air_Consumption.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS Stage_Count
FROM staging.Compressed_Air_Consumption_Stage;
GO

------------------------------------------------------------
-- 2. Duplicate Air Record IDs
------------------------------------------------------------
SELECT
    Air_Record_ID,
    COUNT(*) AS DuplicateCount
FROM staging.Compressed_Air_Consumption_Stage
GROUP BY Air_Record_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Air_Record_ID IS NULL
          OR LTRIM(RTRIM(Air_Record_ID))='' THEN 1 ELSE 0 END) AS Missing_Record_ID,

SUM(CASE WHEN Equipment_ID IS NULL
          OR LTRIM(RTRIM(Equipment_ID))='' THEN 1 ELSE 0 END) AS Missing_Equipment,

SUM(CASE WHEN Air_Meter_ID IS NULL
          OR LTRIM(RTRIM(Air_Meter_ID))='' THEN 1 ELSE 0 END) AS Missing_Air_Meter,

SUM(CASE WHEN Compressor_ID IS NULL
          OR LTRIM(RTRIM(Compressor_ID))='' THEN 1 ELSE 0 END) AS Missing_Compressor,

SUM(CASE WHEN Compressed_Air_Consumption_m3 IS NULL
          OR LTRIM(RTRIM(Compressed_Air_Consumption_m3))='' THEN 1 ELSE 0 END) AS Missing_Air_Consumption

FROM staging.Compressed_Air_Consumption_Stage;
GO

------------------------------------------------------------
-- 4. Invalid Calendar Date
------------------------------------------------------------
SELECT *
FROM staging.Compressed_Air_Consumption_Stage
WHERE TRY_CONVERT(INT, Calendar_Date_Key) IS NULL
AND NULLIF(LTRIM(RTRIM(Calendar_Date_Key)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 5. Invalid Reading Date
------------------------------------------------------------
SELECT *
FROM staging.Compressed_Air_Consumption_Stage
WHERE TRY_CONVERT(DATE, Reading_Date) IS NULL
AND NULLIF(LTRIM(RTRIM(Reading_Date)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 6. Invalid Reading DateTime
------------------------------------------------------------
SELECT *
FROM staging.Compressed_Air_Consumption_Stage
WHERE TRY_CONVERT(DATETIME2, Reading_DateTime) IS NULL
AND NULLIF(LTRIM(RTRIM(Reading_DateTime)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 7. Invalid Runtime
------------------------------------------------------------
SELECT *
FROM staging.Compressed_Air_Consumption_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Runtime_Min) IS NULL
AND NULLIF(LTRIM(RTRIM(Runtime_Min)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 8. Invalid Air Consumption
------------------------------------------------------------
SELECT *
FROM staging.Compressed_Air_Consumption_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Compressed_Air_Consumption_m3) IS NULL
AND NULLIF(LTRIM(RTRIM(Compressed_Air_Consumption_m3)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 9. Invalid Air Pressure
------------------------------------------------------------
SELECT *
FROM staging.Compressed_Air_Consumption_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Air_Pressure_bar) IS NULL
AND NULLIF(LTRIM(RTRIM(Air_Pressure_bar)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 10. Invalid Air Flow
------------------------------------------------------------
SELECT *
FROM staging.Compressed_Air_Consumption_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Air_Flow_m3_per_hr) IS NULL
AND NULLIF(LTRIM(RTRIM(Air_Flow_m3_per_hr)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 11. Invalid Compressor Efficiency
------------------------------------------------------------
SELECT *
FROM staging.Compressed_Air_Consumption_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Compressor_Efficiency_Percent) IS NULL
AND NULLIF(LTRIM(RTRIM(Compressor_Efficiency_Percent)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 12. Invalid Power Consumption
------------------------------------------------------------
SELECT *
FROM staging.Compressed_Air_Consumption_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Power_Consumption_kWh) IS NULL
AND NULLIF(LTRIM(RTRIM(Power_Consumption_kWh)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 13. Invalid Air Cost
------------------------------------------------------------
SELECT *
FROM staging.Compressed_Air_Consumption_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Air_Cost_USD) IS NULL
AND NULLIF(LTRIM(RTRIM(Air_Cost_USD)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 14. Invalid Leakage Percentage
------------------------------------------------------------
SELECT *
FROM staging.Compressed_Air_Consumption_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Leakage_Estimated_Percent) IS NULL
AND NULLIF(LTRIM(RTRIM(Leakage_Estimated_Percent)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 15. Summary Statistics
------------------------------------------------------------
SELECT

MIN(TRY_CONVERT(DECIMAL(18,2), Compressed_Air_Consumption_m3)) AS Min_Air,
MAX(TRY_CONVERT(DECIMAL(18,2), Compressed_Air_Consumption_m3)) AS Max_Air,
AVG(TRY_CONVERT(DECIMAL(18,2), Compressed_Air_Consumption_m3)) AS Avg_Air,

MIN(TRY_CONVERT(DECIMAL(18,2), Power_Consumption_kWh)) AS Min_Power,
MAX(TRY_CONVERT(DECIMAL(18,2), Power_Consumption_kWh)) AS Max_Power,
AVG(TRY_CONVERT(DECIMAL(18,2), Power_Consumption_kWh)) AS Avg_Power,

MIN(TRY_CONVERT(DECIMAL(18,2), Air_Cost_USD)) AS Min_Cost,
MAX(TRY_CONVERT(DECIMAL(18,2), Air_Cost_USD)) AS Max_Cost,
AVG(TRY_CONVERT(DECIMAL(18,2), Air_Cost_USD)) AS Avg_Cost

FROM staging.Compressed_Air_Consumption_Stage;
GO

------------------------------------------------------------
-- 16. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM staging.Compressed_Air_Consumption_Stage
ORDER BY Air_Record_ID;
GO