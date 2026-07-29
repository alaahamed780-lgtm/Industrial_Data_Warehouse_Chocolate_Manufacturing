USE Chocolate_Manufacturing_DW;
GO

/*============================================================
06_Check_Environmental_Monitoring_Master.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM master.Environmental_Monitoring_Master;
GO

------------------------------------------------------------
-- 2. Preview Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Environmental_Monitoring_Master
ORDER BY Environmental_Record_ID;
GO

------------------------------------------------------------
-- 3. Missing Primary Key
------------------------------------------------------------
SELECT COUNT(*) AS Missing_Environmental_Record_ID
FROM master.Environmental_Monitoring_Master
WHERE Environmental_Record_ID IS NULL;
GO

------------------------------------------------------------
-- 4. Duplicate Environmental Record IDs
------------------------------------------------------------
SELECT
    Environmental_Record_ID,
    COUNT(*) AS DuplicateCount
FROM master.Environmental_Monitoring_Master
GROUP BY Environmental_Record_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 5. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Monitoring_Date IS NULL THEN 1 ELSE 0 END) AS Missing_Monitoring_Date,

SUM(CASE WHEN Monitoring_Type IS NULL THEN 1 ELSE 0 END) AS Missing_Monitoring_Type,

SUM(CASE WHEN Parameter IS NULL THEN 1 ELSE 0 END) AS Missing_Parameter,

SUM(CASE WHEN Compliance_Status IS NULL THEN 1 ELSE 0 END) AS Missing_Compliance_Status

FROM master.Environmental_Monitoring_Master;
GO

------------------------------------------------------------
-- 6. Invalid Business Values
------------------------------------------------------------
SELECT *
FROM master.Environmental_Monitoring_Master
WHERE
Measured_Value < 0
OR Lower_Limit < 0
OR Upper_Limit < 0
OR Ambient_Temperature_C < -50
OR Humidity_Percent < 0
OR Humidity_Percent > 100
OR Wind_Speed_mps < 0
OR Estimated_Environmental_Cost_USD < 0;
GO

------------------------------------------------------------
-- 7. Summary Statistics
------------------------------------------------------------
SELECT

MIN(Measured_Value) AS Min_Measured_Value,
MAX(Measured_Value) AS Max_Measured_Value,
AVG(Measured_Value) AS Avg_Measured_Value,

COUNT(DISTINCT Monitoring_Type) AS Monitoring_Types,

COUNT(DISTINCT Parameter) AS Parameters,

COUNT(CASE WHEN Regulatory_Report_Required = 1 THEN 1 END)
AS Regulatory_Reports

FROM master.Environmental_Monitoring_Master;
GO