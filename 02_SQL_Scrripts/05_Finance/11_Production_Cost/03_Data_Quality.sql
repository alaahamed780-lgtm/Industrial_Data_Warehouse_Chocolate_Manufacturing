USE Chocolate_Manufacturing_DW;
GO

/*============================================================
03_Data_Quality_Production_Cost.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS Stage_Count
FROM staging.Production_Cost_Stage;
GO

------------------------------------------------------------
-- 2. Duplicate Production Cost IDs
------------------------------------------------------------
SELECT
    Production_Cost_ID,
    COUNT(*) AS DuplicateCount
FROM staging.Production_Cost_Stage
GROUP BY Production_Cost_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Production_Cost_ID IS NULL
          OR LTRIM(RTRIM(Production_Cost_ID))='' THEN 1 ELSE 0 END) AS Missing_Production_Cost_ID,

SUM(CASE WHEN Production_Order_ID IS NULL
          OR LTRIM(RTRIM(Production_Order_ID))='' THEN 1 ELSE 0 END) AS Missing_Production_Order,

SUM(CASE WHEN Cost_Center_ID IS NULL
          OR LTRIM(RTRIM(Cost_Center_ID))='' THEN 1 ELSE 0 END) AS Missing_Cost_Center,

SUM(CASE WHEN GL_Account_ID IS NULL
          OR LTRIM(RTRIM(GL_Account_ID))='' THEN 1 ELSE 0 END) AS Missing_GL_Account

FROM staging.Production_Cost_Stage;
GO

------------------------------------------------------------
-- 4. Invalid Dates
------------------------------------------------------------
SELECT *
FROM staging.Production_Cost_Stage
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
FROM staging.Production_Cost_Stage
WHERE

(TRY_CONVERT(DECIMAL(18,2), Material_Cost_USD) IS NULL
 AND NULLIF(LTRIM(RTRIM(Material_Cost_USD)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(18,2), Labor_Cost_USD) IS NULL
 AND NULLIF(LTRIM(RTRIM(Labor_Cost_USD)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(18,2), Machine_Cost_USD) IS NULL
 AND NULLIF(LTRIM(RTRIM(Machine_Cost_USD)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(18,2), Energy_Cost_USD) IS NULL
 AND NULLIF(LTRIM(RTRIM(Energy_Cost_USD)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(18,2), Water_Cost_USD) IS NULL
 AND NULLIF(LTRIM(RTRIM(Water_Cost_USD)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(18,2), Steam_Cost_USD) IS NULL
 AND NULLIF(LTRIM(RTRIM(Steam_Cost_USD)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(18,2), Compressed_Air_Cost_USD) IS NULL
 AND NULLIF(LTRIM(RTRIM(Compressed_Air_Cost_USD)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(18,2), Maintenance_Cost_USD) IS NULL
 AND NULLIF(LTRIM(RTRIM(Maintenance_Cost_USD)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(18,2), Quality_Cost_USD) IS NULL
 AND NULLIF(LTRIM(RTRIM(Quality_Cost_USD)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(18,2), Packaging_Cost_USD) IS NULL
 AND NULLIF(LTRIM(RTRIM(Packaging_Cost_USD)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(18,2), Overhead_Cost_USD) IS NULL
 AND NULLIF(LTRIM(RTRIM(Overhead_Cost_USD)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(18,2), Total_Production_Cost_USD) IS NULL
 AND NULLIF(LTRIM(RTRIM(Total_Production_Cost_USD)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(18,2), Produced_Qty_kg) IS NULL
 AND NULLIF(LTRIM(RTRIM(Produced_Qty_kg)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(18,2), Unit_Cost_USD_per_kg) IS NULL
 AND NULLIF(LTRIM(RTRIM(Unit_Cost_USD_per_kg)), '') IS NOT NULL);
GO

------------------------------------------------------------
-- 6. Summary Statistics
------------------------------------------------------------
SELECT

MIN(TRY_CONVERT(DECIMAL(18,2), Total_Production_Cost_USD)) AS Min_Total_Cost,
MAX(TRY_CONVERT(DECIMAL(18,2), Total_Production_Cost_USD)) AS Max_Total_Cost,
AVG(TRY_CONVERT(DECIMAL(18,2), Total_Production_Cost_USD)) AS Avg_Total_Cost,

MIN(TRY_CONVERT(DECIMAL(18,2), Produced_Qty_kg)) AS Min_Qty,
MAX(TRY_CONVERT(DECIMAL(18,2), Produced_Qty_kg)) AS Max_Qty,
AVG(TRY_CONVERT(DECIMAL(18,2), Produced_Qty_kg)) AS Avg_Qty,

MIN(TRY_CONVERT(DECIMAL(18,2), Unit_Cost_USD_per_kg)) AS Min_Unit_Cost,
MAX(TRY_CONVERT(DECIMAL(18,2), Unit_Cost_USD_per_kg)) AS Max_Unit_Cost,
AVG(TRY_CONVERT(DECIMAL(18,2), Unit_Cost_USD_per_kg)) AS Avg_Unit_Cost

FROM staging.Production_Cost_Stage;
GO

------------------------------------------------------------
-- 7. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM staging.Production_Cost_Stage
ORDER BY Production_Cost_ID;
GO