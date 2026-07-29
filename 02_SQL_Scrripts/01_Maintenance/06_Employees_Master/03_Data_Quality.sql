USE Chocolate_Manufacturing_DW;
GO

--------------------------------------------------
-- 1 Total Rows
--------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM staging.Employees_Stage;
GO

--------------------------------------------------
-- 2 Missing Employee_ID
--------------------------------------------------
SELECT COUNT(*) AS Missing_Employee_ID
FROM staging.Employees_Stage
WHERE Employee_ID IS NULL
OR LTRIM(RTRIM(Employee_ID))='';
GO

--------------------------------------------------
-- 3 Duplicate Employee_ID
--------------------------------------------------
SELECT Employee_ID, COUNT(*) AS DuplicateCount
FROM staging.Employees_Stage
GROUP BY Employee_ID
HAVING COUNT(*) > 1;
GO

--------------------------------------------------
-- 4 Missing Employee_Code
--------------------------------------------------
SELECT COUNT(*) AS Missing_Employee_Code
FROM staging.Employees_Stage
WHERE Employee_Code IS NULL
OR LTRIM(RTRIM(Employee_Code))='';
GO

--------------------------------------------------
-- 5 Missing First_Name
--------------------------------------------------
SELECT COUNT(*) AS Missing_First_Name
FROM staging.Employees_Stage
WHERE First_Name IS NULL
OR LTRIM(RTRIM(First_Name))='';
GO

--------------------------------------------------
-- 6 Missing Last_Name
--------------------------------------------------
SELECT COUNT(*) AS Missing_Last_Name
FROM staging.Employees_Stage
WHERE Last_Name IS NULL
OR LTRIM(RTRIM(Last_Name))='';
GO

--------------------------------------------------
-- 7 Missing Department
--------------------------------------------------
SELECT COUNT(*) AS Missing_Department
FROM staging.Employees_Stage
WHERE Department IS NULL
OR LTRIM(RTRIM(Department))='';
GO

--------------------------------------------------
-- 8 Missing Plant
--------------------------------------------------
SELECT COUNT(*) AS Missing_Plant
FROM staging.Employees_Stage
WHERE Plant IS NULL
OR LTRIM(RTRIM(Plant))='';
GO

--------------------------------------------------
-- 9 Invalid Years Experience
--------------------------------------------------
SELECT *
FROM staging.Employees_Stage
WHERE TRY_CONVERT(SMALLINT, Years_Experience) IS NULL
AND Years_Experience IS NOT NULL
AND LTRIM(RTRIM(Years_Experience))<>'';
GO

--------------------------------------------------
--10 Invalid Hire Year
--------------------------------------------------
SELECT *
FROM staging.Employees_Stage
WHERE TRY_CONVERT(SMALLINT, Hire_Year) IS NULL
AND Hire_Year IS NOT NULL
AND LTRIM(RTRIM(Hire_Year))<>'';
GO

--------------------------------------------------
--11 Invalid Hourly Rate
--------------------------------------------------
SELECT *
FROM staging.Employees_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Hourly_Rate_USD) IS NULL
AND Hourly_Rate_USD IS NOT NULL
AND LTRIM(RTRIM(Hourly_Rate_USD))<>'';
GO

--------------------------------------------------
--12 Invalid Max Work Hours
--------------------------------------------------
SELECT *
FROM staging.Employees_Stage
WHERE TRY_CONVERT(SMALLINT, Max_Work_Hours_Day) IS NULL
AND Max_Work_Hours_Day IS NOT NULL
AND LTRIM(RTRIM(Max_Work_Hours_Day))<>'';
GO