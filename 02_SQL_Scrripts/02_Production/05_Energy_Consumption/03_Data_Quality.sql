USE Chocolate_Manufacturing_DW;
GO

/*============================================================
03_Data_Quality_Energy_Consumption.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS Stage_Count
FROM staging.Energy_Consumption_Stage;
GO

------------------------------------------------------------
-- 2. Duplicate Energy Record IDs
------------------------------------------------------------
SELECT
    Energy_Record_ID,
    COUNT(*) AS DuplicateCount
FROM staging.Energy_Consumption_Stage
GROUP BY Energy_Record_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Energy_Record_ID IS NULL
          OR LTRIM(RTRIM(Energy_Record_ID))='' THEN 1 ELSE 0 END) AS Missing_Record_ID,

SUM(CASE WHEN Equipment_ID IS NULL
          OR LTRIM(RTRIM(Equipment_ID))='' THEN 1 ELSE 0 END) AS Missing_Equipment,

SUM(CASE WHEN Meter_ID IS NULL
          OR LTRIM(RTRIM(Meter_ID))='' THEN 1 ELSE 0 END) AS Missing_Meter,

SUM(CASE WHEN Energy_Consumption_kWh IS NULL
          OR LTRIM(RTRIM(Energy_Consumption_kWh))='' THEN 1 ELSE 0 END) AS Missing_Energy

FROM staging.Energy_Consumption_Stage;
GO

------------------------------------------------------------
-- 4. Invalid Calendar Date
------------------------------------------------------------
SELECT *
FROM staging.Energy_Consumption_Stage
WHERE TRY_CONVERT(INT, Calendar_Date_Key) IS NULL
AND NULLIF(LTRIM(RTRIM(Calendar_Date_Key)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 5. Invalid Reading Date
------------------------------------------------------------
SELECT *
FROM staging.Energy_Consumption_Stage
WHERE TRY_CONVERT(DATE, Reading_Date) IS NULL
AND NULLIF(LTRIM(RTRIM(Reading_Date)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 6. Invalid Reading DateTime
------------------------------------------------------------
SELECT *
FROM staging.Energy_Consumption_Stage
WHERE TRY_CONVERT(DATETIME2, Reading_DateTime) IS NULL
AND NULLIF(LTRIM(RTRIM(Reading_DateTime)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 7. Invalid Runtime
------------------------------------------------------------
SELECT *
FROM staging.Energy_Consumption_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Runtime_Min) IS NULL
AND NULLIF(LTRIM(RTRIM(Runtime_Min)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 8. Invalid Energy Consumption
------------------------------------------------------------
SELECT *
FROM staging.Energy_Consumption_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Energy_Consumption_kWh) IS NULL
AND NULLIF(LTRIM(RTRIM(Energy_Consumption_kWh)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 9. Invalid Peak Demand
------------------------------------------------------------
SELECT *
FROM staging.Energy_Consumption_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Peak_Demand_kW) IS NULL
AND NULLIF(LTRIM(RTRIM(Peak_Demand_kW)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 10. Invalid Power Factor
------------------------------------------------------------
SELECT *
FROM staging.Energy_Consumption_Stage
WHERE TRY_CONVERT(DECIMAL(18,4), Power_Factor) IS NULL
AND NULLIF(LTRIM(RTRIM(Power_Factor)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 11. Invalid Production Quantity
------------------------------------------------------------
SELECT *
FROM staging.Energy_Consumption_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Production_Qty_kg) IS NULL
AND NULLIF(LTRIM(RTRIM(Production_Qty_kg)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 12. Invalid Energy Cost
------------------------------------------------------------
SELECT *
FROM staging.Energy_Consumption_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Energy_Cost_USD) IS NULL
AND NULLIF(LTRIM(RTRIM(Energy_Cost_USD)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 13. Statistics
------------------------------------------------------------
SELECT

MIN(TRY_CONVERT(DECIMAL(18,2), Energy_Consumption_kWh)) AS Min_kWh,
MAX(TRY_CONVERT(DECIMAL(18,2), Energy_Consumption_kWh)) AS Max_kWh,
AVG(TRY_CONVERT(DECIMAL(18,2), Energy_Consumption_kWh)) AS Avg_kWh,

MIN(TRY_CONVERT(DECIMAL(18,2), Peak_Demand_kW)) AS Min_Peak,
MAX(TRY_CONVERT(DECIMAL(18,2), Peak_Demand_kW)) AS Max_Peak,
AVG(TRY_CONVERT(DECIMAL(18,2), Peak_Demand_kW)) AS Avg_Peak,

MIN(TRY_CONVERT(DECIMAL(18,2), Energy_Cost_USD)) AS Min_Cost,
MAX(TRY_CONVERT(DECIMAL(18,2), Energy_Cost_USD)) AS Max_Cost,
AVG(TRY_CONVERT(DECIMAL(18,2), Energy_Cost_USD)) AS Avg_Cost

FROM staging.Energy_Consumption_Stage;
GO

------------------------------------------------------------
-- 14. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM staging.Energy_Consumption_Stage
ORDER BY Energy_Record_ID;
GO