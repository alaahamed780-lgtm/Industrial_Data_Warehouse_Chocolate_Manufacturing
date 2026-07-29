USE Chocolate_Manufacturing_DW;
GO

/*============================================================
06_Check_Non_Conformance_Reports_Master.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM master.Non_Conformance_Reports_Master;
GO

------------------------------------------------------------
-- 2. Preview Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Non_Conformance_Reports_Master
ORDER BY NCR_ID;
GO

------------------------------------------------------------
-- 3. Missing Primary Key
------------------------------------------------------------
SELECT COUNT(*) AS Missing_NCR_ID
FROM master.Non_Conformance_Reports_Master
WHERE NCR_ID IS NULL;
GO

------------------------------------------------------------
-- 4. Duplicate Primary Key
------------------------------------------------------------
SELECT
    NCR_ID,
    COUNT(*) AS DuplicateCount
FROM master.Non_Conformance_Reports_Master
GROUP BY NCR_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 5. Missing Product_ID
------------------------------------------------------------
SELECT COUNT(*) AS Missing_Product_ID
FROM master.Non_Conformance_Reports_Master
WHERE Product_ID IS NULL;
GO

------------------------------------------------------------
-- 6. Missing Quality_Inspection_ID
------------------------------------------------------------
SELECT COUNT(*) AS Missing_Inspection_ID
FROM master.Non_Conformance_Reports_Master
WHERE Quality_Inspection_ID IS NULL;
GO

------------------------------------------------------------
-- 7. Missing Responsible Employee
------------------------------------------------------------
SELECT COUNT(*) AS Missing_Responsible_Employee
FROM master.Non_Conformance_Reports_Master
WHERE Responsible_Employee_ID IS NULL;
GO

------------------------------------------------------------
-- 8. Invalid Cost
------------------------------------------------------------
SELECT COUNT(*) AS Invalid_Cost
FROM master.Non_Conformance_Reports_Master
WHERE Estimated_Cost_USD < 0;
GO

------------------------------------------------------------
-- 9. Invalid Close Dates
------------------------------------------------------------
SELECT *
FROM master.Non_Conformance_Reports_Master
WHERE Actual_Close_Date < Report_Date;
GO

------------------------------------------------------------
-- 10. Summary
------------------------------------------------------------
SELECT

COUNT(*) AS TotalRows,

MIN(Estimated_Cost_USD) AS Min_Cost,
MAX(Estimated_Cost_USD) AS Max_Cost,
AVG(Estimated_Cost_USD) AS Avg_Cost

FROM master.Non_Conformance_Reports_Master;
GO