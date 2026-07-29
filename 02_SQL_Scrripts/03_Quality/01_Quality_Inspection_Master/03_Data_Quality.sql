USE Chocolate_Manufacturing_DW;
GO

/*==============================================================
03_Data_Quality_Quality_Inspection.sql
==============================================================*/

--------------------------------------------------------------
-- 1. Total Records
--------------------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM staging.Quality_Inspection_Stage;
GO

--------------------------------------------------------------
-- 2. Duplicate Inspection IDs
--------------------------------------------------------------
SELECT
    Quality_Inspection_ID,
    COUNT(*) AS DuplicateCount
FROM staging.Quality_Inspection_Stage
GROUP BY Quality_Inspection_ID
HAVING COUNT(*) > 1;
GO

--------------------------------------------------------------
-- 3. Missing Primary Fields
--------------------------------------------------------------
SELECT
    SUM(CASE WHEN Quality_Inspection_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Inspection_ID,
    SUM(CASE WHEN Product_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Product_ID,
    SUM(CASE WHEN Production_Order_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Production_Order,
    SUM(CASE WHEN Inspector_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Inspector,
    SUM(CASE WHEN Parameter IS NULL THEN 1 ELSE 0 END) AS Missing_Parameter
FROM staging.Quality_Inspection_Stage;
GO

--------------------------------------------------------------
-- 4. Invalid Calendar Key
--------------------------------------------------------------
SELECT *
FROM staging.Quality_Inspection_Stage
WHERE TRY_CONVERT(INT, Calendar_Date_Key) IS NULL
AND NULLIF(LTRIM(RTRIM(Calendar_Date_Key)), '') IS NOT NULL;
GO

--------------------------------------------------------------
-- 5. Invalid Sample Size
--------------------------------------------------------------
SELECT *
FROM staging.Quality_Inspection_Stage
WHERE TRY_CONVERT(INT, Sample_Size) IS NULL
AND NULLIF(LTRIM(RTRIM(Sample_Size)), '') IS NOT NULL;
GO

--------------------------------------------------------------
-- 6. Invalid Target Value
--------------------------------------------------------------
SELECT *
FROM staging.Quality_Inspection_Stage
WHERE TRY_CONVERT(DECIMAL(18,4), Target_Value) IS NULL
AND NULLIF(LTRIM(RTRIM(Target_Value)), '') IS NOT NULL;
GO

--------------------------------------------------------------
-- 7. Invalid Measured Value
--------------------------------------------------------------
SELECT *
FROM staging.Quality_Inspection_Stage
WHERE TRY_CONVERT(DECIMAL(18,4), Measured_Value) IS NULL
AND NULLIF(LTRIM(RTRIM(Measured_Value)), '') IS NOT NULL;
GO

--------------------------------------------------------------
-- 8. Invalid Lower Limit
--------------------------------------------------------------
SELECT *
FROM staging.Quality_Inspection_Stage
WHERE TRY_CONVERT(DECIMAL(18,4), Lower_Limit) IS NULL
AND NULLIF(LTRIM(RTRIM(Lower_Limit)), '') IS NOT NULL;
GO

--------------------------------------------------------------
-- 9. Invalid Upper Limit
--------------------------------------------------------------
SELECT *
FROM staging.Quality_Inspection_Stage
WHERE TRY_CONVERT(DECIMAL(18,4), Upper_Limit) IS NULL
AND NULLIF(LTRIM(RTRIM(Upper_Limit)), '') IS NOT NULL;
GO

--------------------------------------------------------------
-- 10. Invalid Inspection Date
--------------------------------------------------------------
SELECT *
FROM staging.Quality_Inspection_Stage
WHERE TRY_CONVERT(DATE, Inspection_Date) IS NULL
AND NULLIF(LTRIM(RTRIM(Inspection_Date)), '') IS NOT NULL;
GO

--------------------------------------------------------------
-- 11. Invalid Inspection DateTime
--------------------------------------------------------------
SELECT *
FROM staging.Quality_Inspection_Stage
WHERE TRY_CONVERT(DATETIME2, Inspection_DateTime) IS NULL
AND NULLIF(LTRIM(RTRIM(Inspection_DateTime)), '') IS NOT NULL;
GO

--------------------------------------------------------------
-- 12. Summary
--------------------------------------------------------------
SELECT

COUNT(*) AS TotalRows,

COUNT(DISTINCT Quality_Inspection_ID) AS Total_Inspections,

MIN(TRY_CONVERT(DECIMAL(18,4),Measured_Value)) AS Min_Value,
MAX(TRY_CONVERT(DECIMAL(18,4),Measured_Value)) AS Max_Value,
AVG(TRY_CONVERT(DECIMAL(18,4),Measured_Value)) AS Avg_Value,

MIN(TRY_CONVERT(INT,Sample_Size)) AS Min_Sample_Size,
MAX(TRY_CONVERT(INT,Sample_Size)) AS Max_Sample_Size,
AVG(TRY_CONVERT(INT,Sample_Size)) AS Avg_Sample_Size

FROM staging.Quality_Inspection_Stage;
GO