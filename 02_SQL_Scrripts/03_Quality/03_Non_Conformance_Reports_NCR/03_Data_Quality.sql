USE Chocolate_Manufacturing_DW;
GO

/*============================================================
03_Data_Quality_Non_Conformance_Reports.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM staging.Non_Conformance_Reports_Stage;
GO

------------------------------------------------------------
-- 2. Duplicate NCR IDs
------------------------------------------------------------
SELECT
    NCR_ID,
    COUNT(*) AS DuplicateCount
FROM staging.Non_Conformance_Reports_Stage
GROUP BY NCR_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT
    SUM(CASE WHEN NCR_ID IS NULL OR LTRIM(RTRIM(NCR_ID))='' THEN 1 ELSE 0 END) AS Missing_NCR_ID,
    SUM(CASE WHEN Quality_Inspection_ID IS NULL OR LTRIM(RTRIM(Quality_Inspection_ID))='' THEN 1 ELSE 0 END) AS Missing_Inspection_ID,
    SUM(CASE WHEN Product_ID IS NULL OR LTRIM(RTRIM(Product_ID))='' THEN 1 ELSE 0 END) AS Missing_Product_ID,
    SUM(CASE WHEN Responsible_Employee_ID IS NULL OR LTRIM(RTRIM(Responsible_Employee_ID))='' THEN 1 ELSE 0 END) AS Missing_Responsible_Employee
FROM staging.Non_Conformance_Reports_Stage;
GO

------------------------------------------------------------
-- 4. Invalid Calendar Key
------------------------------------------------------------
SELECT *
FROM staging.Non_Conformance_Reports_Stage
WHERE TRY_CONVERT(INT, Calendar_Date_Key) IS NULL
AND NULLIF(LTRIM(RTRIM(Calendar_Date_Key)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 5. Invalid Report Date
------------------------------------------------------------
SELECT *
FROM staging.Non_Conformance_Reports_Stage
WHERE TRY_CONVERT(DATE, Report_Date) IS NULL
AND NULLIF(LTRIM(RTRIM(Report_Date)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 6. Invalid Report DateTime
------------------------------------------------------------
SELECT *
FROM staging.Non_Conformance_Reports_Stage
WHERE TRY_CONVERT(DATETIME2, Report_DateTime) IS NULL
AND NULLIF(LTRIM(RTRIM(Report_DateTime)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 7. Invalid Target Close Date
------------------------------------------------------------
SELECT *
FROM staging.Non_Conformance_Reports_Stage
WHERE TRY_CONVERT(DATE, Target_Close_Date) IS NULL
AND NULLIF(LTRIM(RTRIM(Target_Close_Date)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 8. Invalid Actual Close Date
------------------------------------------------------------
SELECT *
FROM staging.Non_Conformance_Reports_Stage
WHERE TRY_CONVERT(DATE, Actual_Close_Date) IS NULL
AND NULLIF(LTRIM(RTRIM(Actual_Close_Date)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 9. Invalid Estimated Cost
------------------------------------------------------------
SELECT *
FROM staging.Non_Conformance_Reports_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Estimated_Cost_USD) IS NULL
AND NULLIF(LTRIM(RTRIM(Estimated_Cost_USD)), '') IS NOT NULL;
GO

------------------------------------------------------------
-- 10. Severity Distribution
------------------------------------------------------------
SELECT
    Severity,
    COUNT(*) AS Total
FROM staging.Non_Conformance_Reports_Stage
GROUP BY Severity
ORDER BY Total DESC;
GO

------------------------------------------------------------
-- 11. Status Distribution
------------------------------------------------------------
SELECT
    Status,
    COUNT(*) AS Total
FROM staging.Non_Conformance_Reports_Stage
GROUP BY Status
ORDER BY Total DESC;
GO

------------------------------------------------------------
-- 12. Cost Statistics
------------------------------------------------------------
SELECT
    MIN(TRY_CONVERT(DECIMAL(18,2), Estimated_Cost_USD)) AS Min_Cost,
    MAX(TRY_CONVERT(DECIMAL(18,2), Estimated_Cost_USD)) AS Max_Cost,
    AVG(TRY_CONVERT(DECIMAL(18,2), Estimated_Cost_USD)) AS Avg_Cost
FROM staging.Non_Conformance_Reports_Stage;
GO

------------------------------------------------------------
-- 13. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM staging.Non_Conformance_Reports_Stage
ORDER BY NCR_ID;
GO