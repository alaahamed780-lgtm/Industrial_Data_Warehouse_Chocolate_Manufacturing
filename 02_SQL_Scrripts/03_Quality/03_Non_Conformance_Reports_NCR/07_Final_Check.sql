USE Chocolate_Manufacturing_DW;
GO

/*============================================================
07_Final_Check_Non_Conformance_Reports.sql
============================================================*/

------------------------------------------------------------
-- 1. Compare Stage vs Master
------------------------------------------------------------
SELECT
    (SELECT COUNT(*) FROM staging.Non_Conformance_Reports_Stage) AS Stage_Count,
    (SELECT COUNT(*) FROM master.Non_Conformance_Reports_Master) AS Master_Count,
    (
        SELECT COUNT(*) FROM staging.Non_Conformance_Reports_Stage
    ) -
    (
        SELECT COUNT(*) FROM master.Non_Conformance_Reports_Master
    ) AS Difference;
GO

------------------------------------------------------------
-- 2. Distinct NCR IDs
------------------------------------------------------------
SELECT
COUNT(DISTINCT NCR_ID) AS Distinct_NCRs
FROM master.Non_Conformance_Reports_Master;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT
SUM(CASE WHEN NCR_ID IS NULL THEN 1 ELSE 0 END) AS Missing_NCR_ID,
SUM(CASE WHEN Product_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Product_ID,
SUM(CASE WHEN Quality_Inspection_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Inspection_ID,
SUM(CASE WHEN Responsible_Employee_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Responsible_Employee
FROM master.Non_Conformance_Reports_Master;
GO

------------------------------------------------------------
-- 4. Cost Statistics
------------------------------------------------------------
SELECT
MIN(Estimated_Cost_USD) AS Min_Cost,
MAX(Estimated_Cost_USD) AS Max_Cost,
AVG(Estimated_Cost_USD) AS Avg_Cost
FROM master.Non_Conformance_Reports_Master;
GO

------------------------------------------------------------
-- 5. Date Summary
------------------------------------------------------------
SELECT
MIN(Report_Date) AS First_Report,
MAX(Report_Date) AS Last_Report,
MIN(Target_Close_Date) AS First_Target_Close,
MAX(Target_Close_Date) AS Last_Target_Close
FROM master.Non_Conformance_Reports_Master;
GO

------------------------------------------------------------
-- 6. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Non_Conformance_Reports_Master
ORDER BY NCR_ID;
GO