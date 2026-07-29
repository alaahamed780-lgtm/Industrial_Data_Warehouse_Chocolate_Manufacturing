USE Chocolate_Manufacturing_DW;
GO

/*============================================================
07_Final_Check_Safety_Training.sql
============================================================*/

------------------------------------------------------------
-- 1. Compare Stage vs Master
------------------------------------------------------------
SELECT

(SELECT COUNT(*) FROM staging.Safety_Training_Stage) AS Stage_Count,

(SELECT COUNT(*) FROM master.Safety_Training_Master) AS Master_Count,

(SELECT COUNT(*) FROM staging.Safety_Training_Stage)
-
(SELECT COUNT(*) FROM master.Safety_Training_Master) AS Difference;
GO

------------------------------------------------------------
-- 2. Distinct Training Records
------------------------------------------------------------
SELECT
COUNT(DISTINCT Training_Record_ID) AS Distinct_Training_Records
FROM master.Safety_Training_Master;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Training_Record_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Training_Record_ID,

SUM(CASE WHEN Employee_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Employee_ID,

SUM(CASE WHEN Training_Date IS NULL THEN 1 ELSE 0 END) AS Missing_Training_Date,

SUM(CASE WHEN Training_Course IS NULL THEN 1 ELSE 0 END) AS Missing_Training_Course

FROM master.Safety_Training_Master;
GO

------------------------------------------------------------
-- 4. Training Summary
------------------------------------------------------------
SELECT

COUNT(*) AS Total_Training_Records,

COUNT(DISTINCT Department) AS Departments,

COUNT(DISTINCT Training_Category) AS Training_Categories,

COUNT(DISTINCT Pass_Status) AS Pass_Statuses,

COUNT(DISTINCT Plant) AS Plants

FROM master.Safety_Training_Master;
GO

------------------------------------------------------------
-- 5. Date Range
------------------------------------------------------------
SELECT

MIN(Training_Date) AS First_Training_Date,

MAX(Training_Date) AS Last_Training_Date,

MIN(Next_Training_Date) AS First_Next_Training,

MAX(Next_Training_Date) AS Last_Next_Training

FROM master.Safety_Training_Master;
GO

------------------------------------------------------------
-- 6. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Safety_Training_Master
ORDER BY Training_Record_ID;
GO