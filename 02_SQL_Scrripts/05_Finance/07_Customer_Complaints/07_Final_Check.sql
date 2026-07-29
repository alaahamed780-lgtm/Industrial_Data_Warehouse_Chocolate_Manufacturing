USE Chocolate_Manufacturing_DW;
GO

/*============================================================
07_Final_Check_Customer_Complaints.sql
============================================================*/

------------------------------------------------------------
-- 1. Compare Stage vs Master
------------------------------------------------------------
SELECT

(SELECT COUNT(*) FROM staging.Customer_Complaints_Stage) AS Stage_Count,

(SELECT COUNT(*) FROM master.Customer_Complaints_Master) AS Master_Count,

(SELECT COUNT(*) FROM staging.Customer_Complaints_Stage)
-
(SELECT COUNT(*) FROM master.Customer_Complaints_Master) AS Difference;
GO

------------------------------------------------------------
-- 2. Distinct Complaint IDs
------------------------------------------------------------
SELECT
COUNT(DISTINCT Complaint_ID) AS Distinct_Complaints
FROM master.Customer_Complaints_Master;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Complaint_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Complaint_ID,

SUM(CASE WHEN Customer_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Customer,

SUM(CASE WHEN Complaint_Date IS NULL THEN 1 ELSE 0 END) AS Missing_Complaint_Date,

SUM(CASE WHEN Complaint_Category IS NULL THEN 1 ELSE 0 END) AS Missing_Category

FROM master.Customer_Complaints_Master;
GO

------------------------------------------------------------
-- 4. Complaint Statistics
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

------------------------------------------------------------
-- 5. Date Range
------------------------------------------------------------
SELECT

MIN(Complaint_Date) AS First_Complaint_Date,
MAX(Complaint_Date) AS Last_Complaint_Date,

MIN(Response_Date) AS First_Response_Date,
MAX(Response_Date) AS Last_Response_Date,

MIN(Actual_Close_Date) AS First_Close_Date,
MAX(Actual_Close_Date) AS Last_Close_Date

FROM master.Customer_Complaints_Master;
GO

------------------------------------------------------------
-- 6. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Customer_Complaints_Master
ORDER BY Complaint_ID;
GO