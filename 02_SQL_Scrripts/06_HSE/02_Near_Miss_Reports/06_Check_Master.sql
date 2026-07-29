USE Chocolate_Manufacturing_DW;
GO

/*============================================================
06_Check_Near_Miss_Reports_Master.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM master.Near_Miss_Reports_Master;
GO

------------------------------------------------------------
-- 2. Preview Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Near_Miss_Reports_Master
ORDER BY Near_Miss_ID;
GO

------------------------------------------------------------
-- 3. Missing Primary Key
------------------------------------------------------------
SELECT COUNT(*) AS Missing_Near_Miss_ID
FROM master.Near_Miss_Reports_Master
WHERE Near_Miss_ID IS NULL;
GO

------------------------------------------------------------
-- 4. Duplicate Near Miss IDs
------------------------------------------------------------
SELECT
    Near_Miss_ID,
    COUNT(*) AS DuplicateCount
FROM master.Near_Miss_Reports_Master
GROUP BY Near_Miss_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 5. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Report_Date IS NULL THEN 1 ELSE 0 END) AS Missing_Report_Date,

SUM(CASE WHEN Department IS NULL THEN 1 ELSE 0 END) AS Missing_Department,

SUM(CASE WHEN Hazard_Category IS NULL THEN 1 ELSE 0 END) AS Missing_Hazard_Category,

SUM(CASE WHEN Potential_Severity IS NULL THEN 1 ELSE 0 END) AS Missing_Potential_Severity

FROM master.Near_Miss_Reports_Master;
GO

------------------------------------------------------------
-- 6. Invalid Values
------------------------------------------------------------
SELECT *
FROM master.Near_Miss_Reports_Master
WHERE
Risk_Rating_Before < 0
OR Risk_Rating_After < 0
OR Estimated_Loss_Avoided_USD < 0;
GO

------------------------------------------------------------
-- 7. Summary Statistics
------------------------------------------------------------
SELECT

MIN(Risk_Rating_Before) AS Min_Risk_Before,
MAX(Risk_Rating_Before) AS Max_Risk_Before,
AVG(CAST(Risk_Rating_Before AS FLOAT)) AS Avg_Risk_Before,

MIN(Risk_Rating_After) AS Min_Risk_After,
MAX(Risk_Rating_After) AS Max_Risk_After,
AVG(CAST(Risk_Rating_After AS FLOAT)) AS Avg_Risk_After,

MIN(Estimated_Loss_Avoided_USD) AS Min_Loss_Avoided,
MAX(Estimated_Loss_Avoided_USD) AS Max_Loss_Avoided,
AVG(Estimated_Loss_Avoided_USD) AS Avg_Loss_Avoided

FROM master.Near_Miss_Reports_Master;
GO