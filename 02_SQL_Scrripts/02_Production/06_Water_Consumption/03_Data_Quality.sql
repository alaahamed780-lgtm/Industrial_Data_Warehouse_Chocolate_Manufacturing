USE Chocolate_Manufacturing_DW;
GO

/*============================================================
03_Data_Quality_Water_Consumption.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS Stage_Count
FROM staging.Water_Consumption_Stage;
GO

------------------------------------------------------------
-- 2. Duplicate Water Record IDs
------------------------------------------------------------
SELECT
    Water_Record_ID,
    COUNT(*) AS DuplicateCount
FROM staging.Water_Consumption_Stage
GROUP BY Water_Record_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Water_Record_ID IS NULL
          OR LTRIM(RTRIM(Water_Record_ID))='' THEN 1 ELSE 0 END) AS Missing_Record_ID,

SUM(CASE WHEN Equipment_ID IS NULL
          OR LTRIM(RTRIM(Equipment_ID))='' THEN 1 ELSE 0 END) AS Missing_Equipment,

SUM(CASE WHEN Meter_ID IS NULL
          OR LTRIM(RTRIM(Meter_ID))='' THEN 1 ELSE 0 END) AS Missing_Meter,

SUM(CASE WHEN Water_Consumption_L IS NULL
          OR LTRIM(RTRIM(Water_Consumption_L))='' THEN 1 ELSE 0 END) AS Missing_Water

FROM staging.Water_Consumption_Stage;
GO

------------------------------------------------------------
-- 4. Invalid Calendar Date
------------------------------------------------------------
SELECT *
FROM staging.Water_Consumption_Stage
WHERE TRY_CONVERT(INT, Calendar_Date_Key) IS NULL
AND NULLIF(LTRIM(RTRIM(Calendar_Date_Key)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 5. Invalid Reading Date
------------------------------------------------------------
SELECT *
FROM staging.Water_Consumption_Stage
WHERE TRY_CONVERT(DATE, Reading_Date) IS NULL
AND NULLIF(LTRIM(RTRIM(Reading_Date)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 6. Invalid Reading DateTime
------------------------------------------------------------
SELECT *
FROM staging.Water_Consumption_Stage
WHERE TRY_CONVERT(DATETIME2, Reading_DateTime) IS NULL
AND NULLIF(LTRIM(RTRIM(Reading_DateTime)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 7. Invalid Runtime
------------------------------------------------------------
SELECT *
FROM staging.Water_Consumption_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Runtime_Min) IS NULL
AND NULLIF(LTRIM(RTRIM(Runtime_Min)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 8. Invalid Water Consumption
------------------------------------------------------------
SELECT *
FROM staging.Water_Consumption_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Water_Consumption_L) IS NULL
AND NULLIF(LTRIM(RTRIM(Water_Consumption_L)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 9. Invalid Production Quantity
------------------------------------------------------------
SELECT *
FROM staging.Water_Consumption_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Production_Qty_kg) IS NULL
AND NULLIF(LTRIM(RTRIM(Production_Qty_kg)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 10. Invalid Water Cost
------------------------------------------------------------
SELECT *
FROM staging.Water_Consumption_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Water_Cost_USD) IS NULL
AND NULLIF(LTRIM(RTRIM(Water_Cost_USD)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 11. Invalid Temperature
------------------------------------------------------------
SELECT *
FROM staging.Water_Consumption_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Water_Temperature_C) IS NULL
AND NULLIF(LTRIM(RTRIM(Water_Temperature_C)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 12. Invalid Pressure
------------------------------------------------------------
SELECT *
FROM staging.Water_Consumption_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Water_Pressure_bar) IS NULL
AND NULLIF(LTRIM(RTRIM(Water_Pressure_bar)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 13. Statistics
------------------------------------------------------------
SELECT

MIN(TRY_CONVERT(DECIMAL(18,2), Water_Consumption_L)) AS Min_Water,
MAX(TRY_CONVERT(DECIMAL(18,2), Water_Consumption_L)) AS Max_Water,
AVG(TRY_CONVERT(DECIMAL(18,2), Water_Consumption_L)) AS Avg_Water,

MIN(TRY_CONVERT(DECIMAL(18,2), Water_Cost_USD)) AS Min_Cost,
MAX(TRY_CONVERT(DECIMAL(18,2), Water_Cost_USD)) AS Max_Cost,
AVG(TRY_CONVERT(DECIMAL(18,2), Water_Cost_USD)) AS Avg_Cost,

MIN(TRY_CONVERT(DECIMAL(18,2), Water_Pressure_bar)) AS Min_Pressure,
MAX(TRY_CONVERT(DECIMAL(18,2), Water_Pressure_bar)) AS Max_Pressure,
AVG(TRY_CONVERT(DECIMAL(18,2), Water_Pressure_bar)) AS Avg_Pressure

FROM staging.Water_Consumption_Stage;
GO

------------------------------------------------------------
-- 14. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM staging.Water_Consumption_Stage
ORDER BY Water_Record_ID;
GO