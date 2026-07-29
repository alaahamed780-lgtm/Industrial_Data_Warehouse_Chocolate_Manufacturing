USE Chocolate_Manufacturing_DW;
GO

/*============================================================
03_Data_Quality_Natural_Gas_Consumption.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS Stage_Count
FROM staging.Natural_Gas_Consumption_Stage;
GO

------------------------------------------------------------
-- 2. Duplicate Gas Record IDs
------------------------------------------------------------
SELECT
    Gas_Record_ID,
    COUNT(*) AS DuplicateCount
FROM staging.Natural_Gas_Consumption_Stage
GROUP BY Gas_Record_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Gas_Record_ID IS NULL
          OR LTRIM(RTRIM(Gas_Record_ID))='' THEN 1 ELSE 0 END) AS Missing_Record_ID,

SUM(CASE WHEN Equipment_ID IS NULL
          OR LTRIM(RTRIM(Equipment_ID))='' THEN 1 ELSE 0 END) AS Missing_Equipment,

SUM(CASE WHEN Gas_Meter_ID IS NULL
          OR LTRIM(RTRIM(Gas_Meter_ID))='' THEN 1 ELSE 0 END) AS Missing_Gas_Meter,

SUM(CASE WHEN Gas_Consumption_Nm3 IS NULL
          OR LTRIM(RTRIM(Gas_Consumption_Nm3))='' THEN 1 ELSE 0 END) AS Missing_Gas_Consumption

FROM staging.Natural_Gas_Consumption_Stage;
GO

------------------------------------------------------------
-- 4. Invalid Calendar Date
------------------------------------------------------------
SELECT *
FROM staging.Natural_Gas_Consumption_Stage
WHERE TRY_CONVERT(INT, Calendar_Date_Key) IS NULL
AND NULLIF(LTRIM(RTRIM(Calendar_Date_Key)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 5. Invalid Reading Date
------------------------------------------------------------
SELECT *
FROM staging.Natural_Gas_Consumption_Stage
WHERE TRY_CONVERT(DATE, Reading_Date) IS NULL
AND NULLIF(LTRIM(RTRIM(Reading_Date)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 6. Invalid Reading DateTime
------------------------------------------------------------
SELECT *
FROM staging.Natural_Gas_Consumption_Stage
WHERE TRY_CONVERT(DATETIME2, Reading_DateTime) IS NULL
AND NULLIF(LTRIM(RTRIM(Reading_DateTime)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 7. Invalid Runtime
------------------------------------------------------------
SELECT *
FROM staging.Natural_Gas_Consumption_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Runtime_Min) IS NULL
AND NULLIF(LTRIM(RTRIM(Runtime_Min)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 8. Invalid Gas Consumption
------------------------------------------------------------
SELECT *
FROM staging.Natural_Gas_Consumption_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Gas_Consumption_Nm3) IS NULL
AND NULLIF(LTRIM(RTRIM(Gas_Consumption_Nm3)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 9. Invalid Pressure
------------------------------------------------------------
SELECT *
FROM staging.Natural_Gas_Consumption_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Pressure_bar) IS NULL
AND NULLIF(LTRIM(RTRIM(Pressure_bar)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 10. Invalid Production Quantity
------------------------------------------------------------
SELECT *
FROM staging.Natural_Gas_Consumption_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Production_Qty_kg) IS NULL
AND NULLIF(LTRIM(RTRIM(Production_Qty_kg)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 11. Invalid Calorific Value
------------------------------------------------------------
SELECT *
FROM staging.Natural_Gas_Consumption_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Calorific_Value_MJ_per_Nm3) IS NULL
AND NULLIF(LTRIM(RTRIM(Calorific_Value_MJ_per_Nm3)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 12. Invalid Thermal Efficiency
------------------------------------------------------------
SELECT *
FROM staging.Natural_Gas_Consumption_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Thermal_Efficiency_Percent) IS NULL
AND NULLIF(LTRIM(RTRIM(Thermal_Efficiency_Percent)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 13. Invalid Gas Cost
------------------------------------------------------------
SELECT *
FROM staging.Natural_Gas_Consumption_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Gas_Cost_USD) IS NULL
AND NULLIF(LTRIM(RTRIM(Gas_Cost_USD)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 14. Invalid CO2 Emission
------------------------------------------------------------
SELECT *
FROM staging.Natural_Gas_Consumption_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), CO2_Emission_kg) IS NULL
AND NULLIF(LTRIM(RTRIM(CO2_Emission_kg)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 15. Summary Statistics
------------------------------------------------------------
SELECT

MIN(TRY_CONVERT(DECIMAL(18,2), Gas_Consumption_Nm3)) AS Min_Gas,
MAX(TRY_CONVERT(DECIMAL(18,2), Gas_Consumption_Nm3)) AS Max_Gas,
AVG(TRY_CONVERT(DECIMAL(18,2), Gas_Consumption_Nm3)) AS Avg_Gas,

MIN(TRY_CONVERT(DECIMAL(18,2), Gas_Cost_USD)) AS Min_Cost,
MAX(TRY_CONVERT(DECIMAL(18,2), Gas_Cost_USD)) AS Max_Cost,
AVG(TRY_CONVERT(DECIMAL(18,2), Gas_Cost_USD)) AS Avg_Cost,

MIN(TRY_CONVERT(DECIMAL(18,2), CO2_Emission_kg)) AS Min_CO2,
MAX(TRY_CONVERT(DECIMAL(18,2), CO2_Emission_kg)) AS Max_CO2,
AVG(TRY_CONVERT(DECIMAL(18,2), CO2_Emission_kg)) AS Avg_CO2

FROM staging.Natural_Gas_Consumption_Stage;
GO

------------------------------------------------------------
-- 16. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM staging.Natural_Gas_Consumption_Stage
ORDER BY Gas_Record_ID;
GO