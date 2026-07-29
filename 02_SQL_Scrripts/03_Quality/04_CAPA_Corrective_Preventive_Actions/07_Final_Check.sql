USE Chocolate_Manufacturing_DW;
GO

/*============================================================
07_Final_Check_CAPA.sql
============================================================*/

------------------------------------------------------------
-- 1. Compare Stage vs Master
------------------------------------------------------------
SELECT
    (SELECT COUNT(*) FROM staging.CAPA_Corrective_Preventive_Actions_Stage) AS Stage_Count,
    (SELECT COUNT(*) FROM master.CAPA_Corrective_Preventive_Actions_Master) AS Master_Count,
    (
        SELECT COUNT(*) FROM staging.CAPA_Corrective_Preventive_Actions_Stage
    ) -
    (
        SELECT COUNT(*) FROM master.CAPA_Corrective_Preventive_Actions_Master
    ) AS Difference;
GO

------------------------------------------------------------
-- 2. Distinct CAPA IDs
------------------------------------------------------------
SELECT
COUNT(DISTINCT CAPA_ID) AS Distinct_CAPA
FROM master.CAPA_Corrective_Preventive_Actions_Master;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT
SUM(CASE WHEN CAPA_ID IS NULL THEN 1 ELSE 0 END) AS Missing_CAPA_ID,
SUM(CASE WHEN NCR_ID IS NULL THEN 1 ELSE 0 END) AS Missing_NCR_ID,
SUM(CASE WHEN Action_Owner_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Action_Owner,
SUM(CASE WHEN Related_Product_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Product_ID
FROM master.CAPA_Corrective_Preventive_Actions_Master;
GO

------------------------------------------------------------
-- 4. Cost Statistics
------------------------------------------------------------
SELECT
MIN(Estimated_Cost_USD) AS Min_Estimated_Cost,
MAX(Estimated_Cost_USD) AS Max_Estimated_Cost,
AVG(Estimated_Cost_USD) AS Avg_Estimated_Cost,

MIN(Actual_Cost_USD) AS Min_Actual_Cost,
MAX(Actual_Cost_USD) AS Max_Actual_Cost,
AVG(Actual_Cost_USD) AS Avg_Actual_Cost
FROM master.CAPA_Corrective_Preventive_Actions_Master;
GO

------------------------------------------------------------
-- 5. Date Summary
------------------------------------------------------------
SELECT
MIN(Initiation_Date) AS First_CAPA,
MAX(Initiation_Date) AS Last_CAPA,
MIN(Target_Completion_Date) AS First_Target_Date,
MAX(Target_Completion_Date) AS Last_Target_Date
FROM master.CAPA_Corrective_Preventive_Actions_Master;
GO

------------------------------------------------------------
-- 6. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.CAPA_Corrective_Preventive_Actions_Master
ORDER BY CAPA_ID;
GO