USE Chocolate_Manufacturing_DW;
GO

/*============================================================
07_Final_Check_Quality_Inspection.sql
============================================================*/

------------------------------------------------------------
-- 1. Compare Stage vs Master
------------------------------------------------------------
SELECT
    (SELECT COUNT(*) FROM staging.Quality_Inspection_Stage) AS Stage_Count,
    (SELECT COUNT(*) FROM master.Quality_Inspection_Master) AS Master_Count,
    (
        SELECT COUNT(*) FROM staging.Quality_Inspection_Stage
    ) -
    (
        SELECT COUNT(*) FROM master.Quality_Inspection_Master
    ) AS Difference;
GO

------------------------------------------------------------
-- 2. Distinct Inspection IDs
------------------------------------------------------------
SELECT
COUNT(DISTINCT Quality_Inspection_ID) AS Distinct_Inspections
FROM master.Quality_Inspection_Master;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT
SUM(CASE WHEN Quality_Inspection_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Inspection_ID,
SUM(CASE WHEN Product_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Product_ID,
SUM(CASE WHEN Production_Order_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Production_Order_ID,
SUM(CASE WHEN Inspector_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Inspector_ID
FROM master.Quality_Inspection_Master;
GO

------------------------------------------------------------
-- 4. Statistics
------------------------------------------------------------
SELECT
MIN(Measured_Value) AS Min_Value,
MAX(Measured_Value) AS Max_Value,
AVG(Measured_Value) AS Avg_Value,

MIN(Target_Value) AS Min_Target,
MAX(Target_Value) AS Max_Target,
AVG(Target_Value) AS Avg_Target

FROM master.Quality_Inspection_Master;
GO

------------------------------------------------------------
-- 5. Date Range
------------------------------------------------------------
SELECT
MIN(Inspection_Date) AS First_Inspection,
MAX(Inspection_Date) AS Last_Inspection
FROM master.Quality_Inspection_Master;
GO

------------------------------------------------------------
-- 6. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Quality_Inspection_Master
ORDER BY Quality_Inspection_ID;
GO