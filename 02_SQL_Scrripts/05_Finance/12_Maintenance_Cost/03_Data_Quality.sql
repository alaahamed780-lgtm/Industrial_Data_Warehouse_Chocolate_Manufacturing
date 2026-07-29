USE Chocolate_Manufacturing_DW;
GO

/*============================================================
03_Data_Quality_Maintenance_Cost.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS Stage_Count
FROM staging.Maintenance_Cost_Stage;
GO

------------------------------------------------------------
-- 2. Duplicate Maintenance Cost IDs
------------------------------------------------------------
SELECT
    Maintenance_Cost_ID,
    COUNT(*) AS DuplicateCount
FROM staging.Maintenance_Cost_Stage
GROUP BY Maintenance_Cost_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Maintenance_Cost_ID IS NULL
          OR LTRIM(RTRIM(Maintenance_Cost_ID))='' THEN 1 ELSE 0 END) AS Missing_Maintenance_Cost_ID,

SUM(CASE WHEN Work_Order_ID IS NULL
          OR LTRIM(RTRIM(Work_Order_ID))='' THEN 1 ELSE 0 END) AS Missing_Work_Order,

SUM(CASE WHEN Equipment_ID IS NULL
          OR LTRIM(RTRIM(Equipment_ID))='' THEN 1 ELSE 0 END) AS Missing_Equipment,

SUM(CASE WHEN Cost_Center_ID IS NULL
          OR LTRIM(RTRIM(Cost_Center_ID))='' THEN 1 ELSE 0 END) AS Missing_Cost_Center,

SUM(CASE WHEN GL_Account_ID IS NULL
          OR LTRIM(RTRIM(GL_Account_ID))='' THEN 1 ELSE 0 END) AS Missing_GL_Account

FROM staging.Maintenance_Cost_Stage;
GO

------------------------------------------------------------
-- 4. Invalid Dates
------------------------------------------------------------
SELECT *
FROM staging.Maintenance_Cost_Stage
WHERE
(
    TRY_CONVERT(DATE, Cost_Date) IS NULL
    AND NULLIF(LTRIM(RTRIM(Cost_Date)), '') IS NOT NULL
);
GO

------------------------------------------------------------
-- 5. Invalid Numeric Values
------------------------------------------------------------
SELECT *
FROM staging.Maintenance_Cost_Stage
WHERE

(TRY_CONVERT(DECIMAL(18,2), Labor_Hours) IS NULL
AND NULLIF(LTRIM(RTRIM(Labor_Hours)), '') IS NOT NULL)

OR
(TRY_CONVERT(DECIMAL(18,2), Labor_Cost_USD) IS NULL
AND NULLIF(LTRIM(RTRIM(Labor_Cost_USD)), '') IS NOT NULL)

OR
(TRY_CONVERT(DECIMAL(18,2), Spare_Parts_Cost_USD) IS NULL
AND NULLIF(LTRIM(RTRIM(Spare_Parts_Cost_USD)), '') IS NOT NULL)

OR
(TRY_CONVERT(DECIMAL(18,2), External_Service_Cost_USD) IS NULL
AND NULLIF(LTRIM(RTRIM(External_Service_Cost_USD)), '') IS NOT NULL)

OR
(TRY_CONVERT(DECIMAL(18,2), Tool_Cost_USD) IS NULL
AND NULLIF(LTRIM(RTRIM(Tool_Cost_USD)), '') IS NOT NULL)

OR
(TRY_CONVERT(DECIMAL(18,2), Energy_Cost_USD) IS NULL
AND NULLIF(LTRIM(RTRIM(Energy_Cost_USD)), '') IS NOT NULL)

OR
(TRY_CONVERT(DECIMAL(18,2), Utilities_Cost_USD) IS NULL
AND NULLIF(LTRIM(RTRIM(Utilities_Cost_USD)), '') IS NOT NULL)

OR
(TRY_CONVERT(DECIMAL(18,2), Overhead_Cost_USD) IS NULL
AND NULLIF(LTRIM(RTRIM(Overhead_Cost_USD)), '') IS NOT NULL)

OR
(TRY_CONVERT(DECIMAL(18,2), Total_Maintenance_Cost_USD) IS NULL
AND NULLIF(LTRIM(RTRIM(Total_Maintenance_Cost_USD)), '') IS NOT NULL)

OR
(TRY_CONVERT(DECIMAL(18,2), Downtime_Min) IS NULL
AND NULLIF(LTRIM(RTRIM(Downtime_Min)), '') IS NOT NULL)

OR
(TRY_CONVERT(DECIMAL(18,2), MTTR_Min) IS NULL
AND NULLIF(LTRIM(RTRIM(MTTR_Min)), '') IS NOT NULL);
GO

------------------------------------------------------------
-- 6. Summary Statistics
------------------------------------------------------------
SELECT

MIN(TRY_CONVERT(DECIMAL(18,2), Total_Maintenance_Cost_USD)) AS Min_Total_Cost,
MAX(TRY_CONVERT(DECIMAL(18,2), Total_Maintenance_Cost_USD)) AS Max_Total_Cost,
AVG(TRY_CONVERT(DECIMAL(18,2), Total_Maintenance_Cost_USD)) AS Avg_Total_Cost,

MIN(TRY_CONVERT(DECIMAL(18,2), Downtime_Min)) AS Min_Downtime,
MAX(TRY_CONVERT(DECIMAL(18,2), Downtime_Min)) AS Max_Downtime,
AVG(TRY_CONVERT(DECIMAL(18,2), Downtime_Min)) AS Avg_Downtime,

MIN(TRY_CONVERT(DECIMAL(18,2), MTTR_Min)) AS Min_MTTR,
MAX(TRY_CONVERT(DECIMAL(18,2), MTTR_Min)) AS Max_MTTR,
AVG(TRY_CONVERT(DECIMAL(18,2), MTTR_Min)) AS Avg_MTTR

FROM staging.Maintenance_Cost_Stage;
GO

------------------------------------------------------------
-- 7. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM staging.Maintenance_Cost_Stage
ORDER BY Maintenance_Cost_ID;
GO