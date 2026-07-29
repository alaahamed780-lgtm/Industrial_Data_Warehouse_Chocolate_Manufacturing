USE Chocolate_Manufacturing_DW;
GO

/*============================================================
1. Record Count
============================================================*/

SELECT COUNT(*) AS Stage_Count
FROM staging.Laboratory_Test_Results_Stage;
GO

/*============================================================
2. Duplicate Primary Key
============================================================*/

SELECT
    Lab_Test_Result_ID,
    COUNT(*) AS DuplicateCount
FROM staging.Laboratory_Test_Results_Stage
GROUP BY Lab_Test_Result_ID
HAVING COUNT(*) > 1;
GO

/*============================================================
3. Missing Primary Fields
============================================================*/

SELECT
    SUM(CASE WHEN Lab_Test_Result_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Test_Result,
    SUM(CASE WHEN Quality_Inspection_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Inspection,
    SUM(CASE WHEN Product_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Product,
    SUM(CASE WHEN Technician_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Technician
FROM staging.Laboratory_Test_Results_Stage;
GO

/*============================================================
4. Invalid Target Value
============================================================*/

SELECT *
FROM staging.Laboratory_Test_Results_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Target_Value) IS NULL
AND NULLIF(LTRIM(RTRIM(Target_Value)), '') IS NOT NULL;
GO

/*============================================================
5. Invalid Measured Value
============================================================*/

SELECT *
FROM staging.Laboratory_Test_Results_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Measured_Value) IS NULL
AND NULLIF(LTRIM(RTRIM(Measured_Value)), '') IS NOT NULL;
GO

/*============================================================
6. Invalid Lower Limit
============================================================*/

SELECT *
FROM staging.Laboratory_Test_Results_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Lower_Limit) IS NULL
AND NULLIF(LTRIM(RTRIM(Lower_Limit)), '') IS NOT NULL;
GO

/*============================================================
7. Invalid Upper Limit
============================================================*/

SELECT *
FROM staging.Laboratory_Test_Results_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Upper_Limit) IS NULL
AND NULLIF(LTRIM(RTRIM(Upper_Limit)), '') IS NOT NULL;
GO

/*============================================================
8. Invalid Calendar Date Key
============================================================*/

SELECT *
FROM staging.Laboratory_Test_Results_Stage
WHERE TRY_CONVERT(INT, Calendar_Date_Key) IS NULL
AND NULLIF(LTRIM(RTRIM(Calendar_Date_Key)), '') IS NOT NULL;
GO

/*============================================================
9. Invalid Test Date
============================================================*/

SELECT *
FROM staging.Laboratory_Test_Results_Stage
WHERE TRY_CONVERT(DATE, Test_Date) IS NULL
AND NULLIF(LTRIM(RTRIM(Test_Date)), '') IS NOT NULL;
GO

/*============================================================
10. Invalid Test DateTime
============================================================*/

SELECT *
FROM staging.Laboratory_Test_Results_Stage
WHERE TRY_CONVERT(DATETIME2, Test_DateTime) IS NULL
AND NULLIF(LTRIM(RTRIM(Test_DateTime)), '') IS NOT NULL;
GO

/*============================================================
11. Numeric Statistics
============================================================*/

SELECT
    MIN(TRY_CONVERT(DECIMAL(18,2), Target_Value)) AS Min_Target,
    MAX(TRY_CONVERT(DECIMAL(18,2), Target_Value)) AS Max_Target,
    AVG(TRY_CONVERT(DECIMAL(18,2), Target_Value)) AS Avg_Target,

    MIN(TRY_CONVERT(DECIMAL(18,2), Measured_Value)) AS Min_Measured,
    MAX(TRY_CONVERT(DECIMAL(18,2), Measured_Value)) AS Max_Measured,
    AVG(TRY_CONVERT(DECIMAL(18,2), Measured_Value)) AS Avg_Measured,

    MIN(TRY_CONVERT(DECIMAL(18,2), Lower_Limit)) AS Min_Lower,
    MAX(TRY_CONVERT(DECIMAL(18,2), Lower_Limit)) AS Max_Lower,

    MIN(TRY_CONVERT(DECIMAL(18,2), Upper_Limit)) AS Min_Upper,
    MAX(TRY_CONVERT(DECIMAL(18,2), Upper_Limit)) AS Max_Upper

FROM staging.Laboratory_Test_Results_Stage;
GO

/*============================================================
12. Date Summary
============================================================*/

SELECT
    MIN(Test_Date) AS First_Test_Date,
    MAX(Test_Date) AS Last_Test_Date,

    MIN(Test_DateTime) AS First_Test_DateTime,
    MAX(Test_DateTime) AS Last_Test_DateTime
FROM staging.Laboratory_Test_Results_Stage;
GO

/*============================================================
13. Sample Data
============================================================*/

SELECT TOP (20) *
FROM staging.Laboratory_Test_Results_Stage
ORDER BY Lab_Test_Result_ID;
GO