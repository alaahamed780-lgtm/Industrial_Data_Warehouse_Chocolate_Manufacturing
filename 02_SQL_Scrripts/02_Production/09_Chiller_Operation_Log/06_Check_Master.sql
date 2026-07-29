USE Chocolate_Manufacturing_DW;
GO

/*============================================================
06_Check_Chiller_Operation_Log_Master.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM master.Chiller_Operation_Log_Master;
GO

------------------------------------------------------------
-- 2. Preview Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Chiller_Operation_Log_Master
ORDER BY Chiller_Log_ID;
GO

------------------------------------------------------------
-- 3. Missing Primary Key
------------------------------------------------------------
SELECT COUNT(*) AS Missing_Chiller_Log_ID
FROM master.Chiller_Operation_Log_Master
WHERE Chiller_Log_ID IS NULL;
GO

------------------------------------------------------------
-- 4. Duplicate IDs
------------------------------------------------------------
SELECT
    Chiller_Log_ID,
    COUNT(*) AS DuplicateCount
FROM master.Chiller_Operation_Log_Master
GROUP BY Chiller_Log_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 5. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Chiller_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Chiller,

SUM(CASE WHEN Equipment_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Equipment,

SUM(CASE WHEN Power_Consumption_kWh IS NULL THEN 1 ELSE 0 END) AS Missing_Power,

SUM(CASE WHEN Cooling_Load_TR IS NULL THEN 1 ELSE 0 END) AS Missing_Cooling_Load

FROM master.Chiller_Operation_Log_Master;
GO

------------------------------------------------------------
-- 6. Negative Values
------------------------------------------------------------
SELECT *
FROM master.Chiller_Operation_Log_Master
WHERE Power_Consumption_kWh < 0
   OR Cooling_Load_TR < 0
   OR Runtime_Min < 0;
GO

------------------------------------------------------------
-- 7. Invalid COP
------------------------------------------------------------
SELECT *
FROM master.Chiller_Operation_Log_Master
WHERE COP <= 0
   OR COP > 10;
GO

------------------------------------------------------------
-- 8. Invalid Temperatures
------------------------------------------------------------
SELECT *
FROM master.Chiller_Operation_Log_Master
WHERE Evaporator_Inlet_Temp_C < -50
   OR Evaporator_Outlet_Temp_C < -50
   OR Condenser_Inlet_Temp_C < -50
   OR Condenser_Outlet_Temp_C < -50;
GO

------------------------------------------------------------
-- 9. Summary Statistics
------------------------------------------------------------
SELECT

MIN(Cooling_Load_TR) AS Min_Load,
MAX(Cooling_Load_TR) AS Max_Load,
AVG(Cooling_Load_TR) AS Avg_Load,

MIN(COP) AS Min_COP,
MAX(COP) AS Max_COP,
AVG(COP) AS Avg_COP,

MIN(Power_Consumption_kWh) AS Min_Power,
MAX(Power_Consumption_kWh) AS Max_Power,
AVG(Power_Consumption_kWh) AS Avg_Power

FROM master.Chiller_Operation_Log_Master;
GO