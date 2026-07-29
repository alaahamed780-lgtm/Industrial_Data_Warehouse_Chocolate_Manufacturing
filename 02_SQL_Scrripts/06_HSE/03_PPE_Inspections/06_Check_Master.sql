USE Chocolate_Manufacturing_DW;
GO

/*============================================================
06_Check_PPE_Inspections_Master.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM master.PPE_Inspections_Master;
GO

------------------------------------------------------------
-- 2. Preview Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.PPE_Inspections_Master
ORDER BY PPE_Inspection_ID;
GO

------------------------------------------------------------
-- 3. Missing Primary Key
------------------------------------------------------------
SELECT COUNT(*) AS Missing_PPE_Inspection_ID
FROM master.PPE_Inspections_Master
WHERE PPE_Inspection_ID IS NULL;
GO

------------------------------------------------------------
-- 4. Duplicate PPE Inspection IDs
------------------------------------------------------------
SELECT
    PPE_Inspection_ID,
    COUNT(*) AS DuplicateCount
FROM master.PPE_Inspections_Master
GROUP BY PPE_Inspection_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 5. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Inspection_Date IS NULL THEN 1 ELSE 0 END) AS Missing_Inspection_Date,

SUM(CASE WHEN Department IS NULL THEN 1 ELSE 0 END) AS Missing_Department,

SUM(CASE WHEN PPE_Type IS NULL THEN 1 ELSE 0 END) AS Missing_PPE_Type,

SUM(CASE WHEN Compliance_Status IS NULL THEN 1 ELSE 0 END) AS Missing_Compliance_Status

FROM master.PPE_Inspections_Master;
GO

------------------------------------------------------------
-- 6. Invalid Business Values
------------------------------------------------------------
SELECT *
FROM master.PPE_Inspections_Master
WHERE
Expiry_Date < Inspection_Date
OR Next_Inspection_Date < Inspection_Date
OR Replacement_Date < Inspection_Date;
GO

------------------------------------------------------------
-- 7. Summary Statistics
------------------------------------------------------------
SELECT

COUNT(*) AS Total_Inspections,

COUNT(CASE WHEN Defect_Found = 1 THEN 1 END) AS Defects_Found,

COUNT(CASE WHEN Replacement_Required = 1 THEN 1 END) AS Replacements_Required,

COUNT(DISTINCT PPE_Type) AS PPE_Types,

COUNT(DISTINCT Risk_Level) AS Risk_Levels

FROM master.PPE_Inspections_Master;
GO