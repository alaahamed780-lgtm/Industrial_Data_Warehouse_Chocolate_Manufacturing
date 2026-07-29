USE Chocolate_Manufacturing_DW;
GO

/*============================================================
03_Data_Quality_PPE_Inspections.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS Stage_Count
FROM staging.PPE_Inspections_Stage;
GO

------------------------------------------------------------
-- 2. Duplicate PPE Inspection IDs
------------------------------------------------------------
SELECT
    PPE_Inspection_ID,
    COUNT(*) AS DuplicateCount
FROM staging.PPE_Inspections_Stage
GROUP BY PPE_Inspection_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN PPE_Inspection_ID IS NULL
          OR LTRIM(RTRIM(PPE_Inspection_ID))='' THEN 1 ELSE 0 END) AS Missing_PPE_Inspection_ID,

SUM(CASE WHEN Inspection_Date IS NULL
          OR LTRIM(RTRIM(Inspection_Date))='' THEN 1 ELSE 0 END) AS Missing_Inspection_Date,

SUM(CASE WHEN Department IS NULL
          OR LTRIM(RTRIM(Department))='' THEN 1 ELSE 0 END) AS Missing_Department,

SUM(CASE WHEN PPE_Type IS NULL
          OR LTRIM(RTRIM(PPE_Type))='' THEN 1 ELSE 0 END) AS Missing_PPE_Type,

SUM(CASE WHEN Compliance_Status IS NULL
          OR LTRIM(RTRIM(Compliance_Status))='' THEN 1 ELSE 0 END) AS Missing_Compliance_Status

FROM staging.PPE_Inspections_Stage;
GO

------------------------------------------------------------
-- 4. Invalid Dates
------------------------------------------------------------
SELECT *
FROM staging.PPE_Inspections_Stage
WHERE

(TRY_CONVERT(DATE, Inspection_Date) IS NULL
AND NULLIF(LTRIM(RTRIM(Inspection_Date)), '') IS NOT NULL)

OR

(TRY_CONVERT(DATETIME, Inspection_DateTime) IS NULL
AND NULLIF(LTRIM(RTRIM(Inspection_DateTime)), '') IS NOT NULL)

OR

(TRY_CONVERT(DATE, Expiry_Date) IS NULL
AND NULLIF(LTRIM(RTRIM(Expiry_Date)), '') IS NOT NULL)

OR

(TRY_CONVERT(DATE, Last_Inspection_Date) IS NULL
AND NULLIF(LTRIM(RTRIM(Last_Inspection_Date)), '') IS NOT NULL)

OR

(TRY_CONVERT(DATE, Next_Inspection_Date) IS NULL
AND NULLIF(LTRIM(RTRIM(Next_Inspection_Date)), '') IS NOT NULL)

OR

(TRY_CONVERT(DATE, Replacement_Date) IS NULL
AND NULLIF(LTRIM(RTRIM(Replacement_Date)), '') IS NOT NULL);
GO

------------------------------------------------------------
-- 5. Summary Statistics
------------------------------------------------------------
SELECT

COUNT(*) AS Total_Inspections,

COUNT(DISTINCT PPE_Type) AS PPE_Types,

COUNT(DISTINCT Department) AS Departments,

COUNT(DISTINCT Plant) AS Plants,

COUNT(DISTINCT Compliance_Status) AS Compliance_Statuses

FROM staging.PPE_Inspections_Stage;
GO

------------------------------------------------------------
-- 6. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM staging.PPE_Inspections_Stage
ORDER BY PPE_Inspection_ID;
GO