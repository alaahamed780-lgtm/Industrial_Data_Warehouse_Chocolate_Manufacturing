USE Chocolate_Manufacturing_DW;
GO

/*============================================================
06_Check_Maintenance_Cost_Master.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM master.Maintenance_Cost_Master;
GO

------------------------------------------------------------
-- 2. Preview Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Maintenance_Cost_Master
ORDER BY Maintenance_Cost_ID;
GO

------------------------------------------------------------
-- 3. Missing Primary Key
------------------------------------------------------------
SELECT COUNT(*) AS Missing_Maintenance_Cost_ID
FROM master.Maintenance_Cost_Master
WHERE Maintenance_Cost_ID IS NULL;
GO

------------------------------------------------------------
-- 4. Duplicate Maintenance Cost IDs
------------------------------------------------------------
SELECT
    Maintenance_Cost_ID,
    COUNT(*) AS DuplicateCount
FROM master.Maintenance_Cost_Master
GROUP BY Maintenance_Cost_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 5. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Work_Order_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Work_Order,

SUM(CASE WHEN Equipment_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Equipment,

SUM(CASE WHEN Cost_Center_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Cost_Center,

SUM(CASE WHEN GL_Account_ID IS NULL THEN 1 ELSE 0 END) AS Missing_GL_Account

FROM master.Maintenance_Cost_Master;
GO

------------------------------------------------------------
-- 6. Invalid Values
------------------------------------------------------------
SELECT *
FROM master.Maintenance_Cost_Master
WHERE Labor_Hours < 0
   OR Labor_Cost_USD < 0
   OR Spare_Parts_Cost_USD < 0
   OR External_Service_Cost_USD < 0
   OR Tool_Cost_USD < 0
   OR Energy_Cost_USD < 0
   OR Utilities_Cost_USD < 0
   OR Overhead_Cost_USD < 0
   OR Total_Maintenance_Cost_USD < 0
   OR Downtime_Min < 0
   OR MTTR_Min < 0;
GO

------------------------------------------------------------
-- 7. Summary Statistics
------------------------------------------------------------
SELECT

MIN(Total_Maintenance_Cost_USD) AS Min_Total_Cost,
MAX(Total_Maintenance_Cost_USD) AS Max_Total_Cost,
AVG(Total_Maintenance_Cost_USD) AS Avg_Total_Cost,

MIN(Downtime_Min) AS Min_Downtime,
MAX(Downtime_Min) AS Max_Downtime,
AVG(Downtime_Min) AS Avg_Downtime,

MIN(MTTR_Min) AS Min_MTTR,
MAX(MTTR_Min) AS Max_MTTR,
AVG(MTTR_Min) AS Avg_MTTR

FROM master.Maintenance_Cost_Master;
GO