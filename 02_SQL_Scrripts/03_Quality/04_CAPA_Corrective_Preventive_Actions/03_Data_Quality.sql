USE Chocolate_Manufacturing_DW;
GO

/*============================================================
03_Data_Quality_CAPA.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM staging.CAPA_Corrective_Preventive_Actions_Stage;
GO

------------------------------------------------------------
-- 2. Duplicate CAPA IDs
------------------------------------------------------------
SELECT
    CAPA_ID,
    COUNT(*) AS DuplicateCount
FROM staging.CAPA_Corrective_Preventive_Actions_Stage
GROUP BY CAPA_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT
    SUM(CASE WHEN CAPA_ID IS NULL OR LTRIM(RTRIM(CAPA_ID))='' THEN 1 ELSE 0 END) AS Missing_CAPA_ID,
    SUM(CASE WHEN NCR_ID IS NULL OR LTRIM(RTRIM(NCR_ID))='' THEN 1 ELSE 0 END) AS Missing_NCR_ID,
    SUM(CASE WHEN Action_Owner_ID IS NULL OR LTRIM(RTRIM(Action_Owner_ID))='' THEN 1 ELSE 0 END) AS Missing_Action_Owner,
    SUM(CASE WHEN Related_Product_ID IS NULL OR LTRIM(RTRIM(Related_Product_ID))='' THEN 1 ELSE 0 END) AS Missing_Product_ID
FROM staging.CAPA_Corrective_Preventive_Actions_Stage;
GO

------------------------------------------------------------
-- 4. Invalid Calendar Date Key
------------------------------------------------------------
SELECT *
FROM staging.CAPA_Corrective_Preventive_Actions_Stage
WHERE TRY_CONVERT(INT, Calendar_Date_Key) IS NULL
AND NULLIF(LTRIM(RTRIM(Calendar_Date_Key)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 5. Invalid Initiation Date
------------------------------------------------------------
SELECT *
FROM staging.CAPA_Corrective_Preventive_Actions_Stage
WHERE TRY_CONVERT(DATE, Initiation_Date) IS NULL
AND NULLIF(LTRIM(RTRIM(Initiation_Date)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 6. Invalid Target Completion Date
------------------------------------------------------------
SELECT *
FROM staging.CAPA_Corrective_Preventive_Actions_Stage
WHERE TRY_CONVERT(DATE, Target_Completion_Date) IS NULL
AND NULLIF(LTRIM(RTRIM(Target_Completion_Date)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 7. Invalid Actual Completion Date
------------------------------------------------------------
SELECT *
FROM staging.CAPA_Corrective_Preventive_Actions_Stage
WHERE TRY_CONVERT(DATE, Actual_Completion_Date) IS NULL
AND NULLIF(LTRIM(RTRIM(Actual_Completion_Date)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 8. Invalid Effectiveness Check Date
------------------------------------------------------------
SELECT *
FROM staging.CAPA_Corrective_Preventive_Actions_Stage
WHERE TRY_CONVERT(DATE, Effectiveness_Check_Date) IS NULL
AND NULLIF(LTRIM(RTRIM(Effectiveness_Check_Date)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 9. Invalid Estimated Cost
------------------------------------------------------------
SELECT *
FROM staging.CAPA_Corrective_Preventive_Actions_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Estimated_Cost_USD) IS NULL
AND NULLIF(LTRIM(RTRIM(Estimated_Cost_USD)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 10. Invalid Actual Cost
------------------------------------------------------------
SELECT *
FROM staging.CAPA_Corrective_Preventive_Actions_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Actual_Cost_USD) IS NULL
AND NULLIF(LTRIM(RTRIM(Actual_Cost_USD)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 11. Status Distribution
------------------------------------------------------------
SELECT
    Status,
    COUNT(*) AS Total
FROM staging.CAPA_Corrective_Preventive_Actions_Stage
GROUP BY Status
ORDER BY Total DESC;
GO

------------------------------------------------------------
-- 12. Priority Distribution
------------------------------------------------------------
SELECT
    Priority,
    COUNT(*) AS Total
FROM staging.CAPA_Corrective_Preventive_Actions_Stage
GROUP BY Priority
ORDER BY Total DESC;
GO

------------------------------------------------------------
-- 13. Cost Statistics
------------------------------------------------------------
SELECT
    MIN(TRY_CONVERT(DECIMAL(18,2), Estimated_Cost_USD)) AS Min_Estimated_Cost,
    MAX(TRY_CONVERT(DECIMAL(18,2), Estimated_Cost_USD)) AS Max_Estimated_Cost,
    AVG(TRY_CONVERT(DECIMAL(18,2), Estimated_Cost_USD)) AS Avg_Estimated_Cost,

    MIN(TRY_CONVERT(DECIMAL(18,2), Actual_Cost_USD)) AS Min_Actual_Cost,
    MAX(TRY_CONVERT(DECIMAL(18,2), Actual_Cost_USD)) AS Max_Actual_Cost,
    AVG(TRY_CONVERT(DECIMAL(18,2), Actual_Cost_USD)) AS Avg_Actual_Cost
FROM staging.CAPA_Corrective_Preventive_Actions_Stage;
GO

------------------------------------------------------------
-- 14. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM staging.CAPA_Corrective_Preventive_Actions_Stage
ORDER BY CAPA_ID;
GO