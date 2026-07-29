USE Chocolate_Manufacturing_DW;
GO

/*============================================================
06_Check_CAPA_Master.sql
============================================================*/

------------------------------------------------------------
-- 1. Record Count
------------------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM master.CAPA_Corrective_Preventive_Actions_Master;
GO

------------------------------------------------------------
-- 2. Preview Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.CAPA_Corrective_Preventive_Actions_Master
ORDER BY CAPA_ID;
GO

------------------------------------------------------------
-- 3. Missing Primary Key
------------------------------------------------------------
SELECT COUNT(*) AS Missing_CAPA_ID
FROM master.CAPA_Corrective_Preventive_Actions_Master
WHERE CAPA_ID IS NULL;
GO

------------------------------------------------------------
-- 4. Duplicate CAPA IDs
------------------------------------------------------------
SELECT
    CAPA_ID,
    COUNT(*) AS DuplicateCount
FROM master.CAPA_Corrective_Preventive_Actions_Master
GROUP BY CAPA_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 5. Missing Critical Fields
------------------------------------------------------------
SELECT
    SUM(CASE WHEN NCR_ID IS NULL THEN 1 ELSE 0 END) AS Missing_NCR_ID,
    SUM(CASE WHEN Action_Owner_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Action_Owner,
    SUM(CASE WHEN Related_Product_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Product_ID
FROM master.CAPA_Corrective_Preventive_Actions_Master;
GO

------------------------------------------------------------
-- 6. Invalid Cost Values
------------------------------------------------------------
SELECT *
FROM master.CAPA_Corrective_Preventive_Actions_Master
WHERE Estimated_Cost_USD < 0
   OR Actual_Cost_USD < 0;
GO

------------------------------------------------------------
-- 7. Invalid Completion Dates
------------------------------------------------------------
SELECT *
FROM master.CAPA_Corrective_Preventive_Actions_Master
WHERE Actual_Completion_Date < Initiation_Date;
GO

------------------------------------------------------------
-- 8. Summary Statistics
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