USE Chocolate_Manufacturing_DW;
GO

/*============================================================
06_Check_Customer_Complaints_Master.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM master.Customer_Complaints_Master;
GO

------------------------------------------------------------
-- 2. Preview Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Customer_Complaints_Master
ORDER BY Complaint_ID;
GO

------------------------------------------------------------
-- 3. Missing Primary Key
------------------------------------------------------------
SELECT COUNT(*) AS Missing_Complaint_ID
FROM master.Customer_Complaints_Master
WHERE Complaint_ID IS NULL;
GO

------------------------------------------------------------
-- 4. Duplicate Complaint IDs
------------------------------------------------------------
SELECT
    Complaint_ID,
    COUNT(*) AS DuplicateCount
FROM master.Customer_Complaints_Master
GROUP BY Complaint_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 5. Duplicate Complaint Numbers
------------------------------------------------------------
SELECT
    Complaint_Number,
    COUNT(*) AS DuplicateCount
FROM master.Customer_Complaints_Master
GROUP BY Complaint_Number
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 6. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Customer_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Customer,

SUM(CASE WHEN Complaint_Date IS NULL THEN 1 ELSE 0 END) AS Missing_Complaint_Date,

SUM(CASE WHEN Complaint_Category IS NULL THEN 1 ELSE 0 END) AS Missing_Category,

SUM(CASE WHEN Status IS NULL THEN 1 ELSE 0 END) AS Missing_Status

FROM master.Customer_Complaints_Master;
GO

------------------------------------------------------------
-- 7. Invalid Numeric Values
------------------------------------------------------------
SELECT *
FROM master.Customer_Complaints_Master
WHERE Compensation_USD < 0
   OR Customer_Satisfaction_After_Closure < 0
   OR Customer_Satisfaction_After_Closure > 5;
GO

------------------------------------------------------------
-- 8. Summary Statistics
------------------------------------------------------------
SELECT

MIN(Compensation_USD) AS Min_Compensation,
MAX(Compensation_USD) AS Max_Compensation,
AVG(Compensation_USD) AS Avg_Compensation,

MIN(Customer_Satisfaction_After_Closure) AS Min_Satisfaction,
MAX(Customer_Satisfaction_After_Closure) AS Max_Satisfaction,
AVG(Customer_Satisfaction_After_Closure) AS Avg_Satisfaction

FROM master.Customer_Complaints_Master;
GO