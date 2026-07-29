USE Chocolate_Manufacturing_DW;
GO

/*============================================================
1. Record Count Comparison
============================================================*/

SELECT
    (SELECT COUNT(*) FROM staging.Laboratory_Test_Results_Stage) AS Stage_Count,
    (SELECT COUNT(*) FROM master.Laboratory_Test_Results_Master) AS Master_Count,
    (SELECT COUNT(*) FROM staging.Laboratory_Test_Results_Stage)
    -
    (SELECT COUNT(*) FROM master.Laboratory_Test_Results_Master) AS Difference;
GO

/*============================================================
2. Distinct Records
============================================================*/

SELECT
COUNT(DISTINCT Lab_Test_Result_ID) AS Distinct_Lab_Results
FROM master.Laboratory_Test_Results_Master;
GO

/*============================================================
3. Missing Key Fields
============================================================*/

SELECT

SUM(CASE WHEN Lab_Test_Result_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Result_ID,

SUM(CASE WHEN Product_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Product,

SUM(CASE WHEN Quality_Inspection_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Inspection,

SUM(CASE WHEN Technician_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Technician

FROM master.Laboratory_Test_Results_Master;
GO

/*============================================================
4. Numeric Summary
============================================================*/

SELECT

MIN(Target_Value) AS Min_Target,
MAX(Target_Value) AS Max_Target,
AVG(Target_Value) AS Avg_Target,

MIN(Measured_Value) AS Min_Measured,
MAX(Measured_Value) AS Max_Measured,
AVG(Measured_Value) AS Avg_Measured,

MIN(Lower_Limit) AS Min_Lower,
MAX(Lower_Limit) AS Max_Lower,

MIN(Upper_Limit) AS Min_Upper,
MAX(Upper_Limit) AS Max_Upper

FROM master.Laboratory_Test_Results_Master;
GO

/*============================================================
5. Date Summary
============================================================*/

SELECT

MIN(Test_Date) AS First_Test_Date,
MAX(Test_Date) AS Last_Test_Date,

MIN(Test_DateTime) AS First_DateTime,
MAX(Test_DateTime) AS Last_DateTime

FROM master.Laboratory_Test_Results_Master;
GO

/*============================================================
6. Sample Data
============================================================*/

SELECT TOP (20) *
FROM master.Laboratory_Test_Results_Master
ORDER BY Lab_Test_Result_ID;
GO