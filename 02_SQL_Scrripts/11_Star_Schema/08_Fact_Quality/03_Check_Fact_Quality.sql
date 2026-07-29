USE Chocolate_Manufacturing_DW;
GO

--------------------------------------------------
-- Total Rows
--------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM dw.Fact_Quality;
GO

--------------------------------------------------
-- Preview Data
--------------------------------------------------
SELECT TOP (10) *
FROM dw.Fact_Quality;
GO

--------------------------------------------------
-- Check Duplicate Quality_Inspection_ID
--------------------------------------------------
SELECT
    Quality_Inspection_ID,
    COUNT(*) AS DuplicateCount
FROM dw.Fact_Quality
GROUP BY Quality_Inspection_ID
HAVING COUNT(*) > 1;
GO

--------------------------------------------------
-- Missing Date Key
--------------------------------------------------
SELECT
COUNT(*) AS Missing_Date_Key
FROM dw.Fact_Quality
WHERE Date_Key IS NULL;
GO

--------------------------------------------------
-- Missing Product Key
--------------------------------------------------
SELECT
COUNT(*) AS Missing_Product_Key
FROM dw.Fact_Quality
WHERE Product_Key IS NULL;
GO

--------------------------------------------------
-- Missing Equipment Key
--------------------------------------------------
SELECT
COUNT(*) AS Missing_Equipment_Key
FROM dw.Fact_Quality
WHERE Equipment_Key IS NULL;
GO

--------------------------------------------------
-- Missing Employee Key
--------------------------------------------------
SELECT
COUNT(*) AS Missing_Employee_Key
FROM dw.Fact_Quality
WHERE Employee_Key IS NULL;
GO

--------------------------------------------------
-- Quality Summary
--------------------------------------------------
SELECT

COUNT(*) AS Total_Inspections,

SUM(Sample_Size) AS Total_Samples,

AVG(Target_Value) AS Avg_Target_Value,

AVG(Measured_Value) AS Avg_Measured_Value,

AVG(Lower_Limit) AS Avg_Lower_Limit,

AVG(Upper_Limit) AS Avg_Upper_Limit

FROM dw.Fact_Quality;
GO

PRINT 'Fact_Quality Check Completed Successfully';
GO