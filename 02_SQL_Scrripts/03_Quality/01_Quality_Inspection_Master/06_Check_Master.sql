USE Chocolate_Manufacturing_DW;
GO

/*============================================================
06_Check_Quality_Inspection_Master.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM master.Quality_Inspection_Master;
GO

------------------------------------------------------------
-- 2. Preview Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Quality_Inspection_Master
ORDER BY Quality_Inspection_ID;
GO

------------------------------------------------------------
-- 3. Missing Primary Key
------------------------------------------------------------
SELECT COUNT(*) AS Missing_Quality_Inspection_ID
FROM master.Quality_Inspection_Master
WHERE Quality_Inspection_ID IS NULL;
GO

------------------------------------------------------------
-- 4. Duplicate Primary Key
------------------------------------------------------------
SELECT
    Quality_Inspection_ID,
    COUNT(*) AS DuplicateCount
FROM master.Quality_Inspection_Master
GROUP BY Quality_Inspection_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 5. Missing Product_ID
------------------------------------------------------------
SELECT COUNT(*) AS Missing_Product_ID
FROM master.Quality_Inspection_Master
WHERE Product_ID IS NULL;
GO

------------------------------------------------------------
-- 6. Missing Production_Order_ID
------------------------------------------------------------
SELECT COUNT(*) AS Missing_Production_Order_ID
FROM master.Quality_Inspection_Master
WHERE Production_Order_ID IS NULL;
GO

------------------------------------------------------------
-- 7. Invalid Sample Size
------------------------------------------------------------
SELECT COUNT(*) AS Invalid_Sample_Size
FROM master.Quality_Inspection_Master
WHERE Sample_Size <= 0;
GO

------------------------------------------------------------
-- 8. Invalid Limits
------------------------------------------------------------
SELECT *
FROM master.Quality_Inspection_Master
WHERE Lower_Limit > Upper_Limit;
GO

------------------------------------------------------------
-- 9. Invalid Measured Values
------------------------------------------------------------
SELECT *
FROM master.Quality_Inspection_Master
WHERE Measured_Value < Lower_Limit
   OR Measured_Value > Upper_Limit;
GO

------------------------------------------------------------
-- 10. Summary
------------------------------------------------------------
SELECT

COUNT(*) AS TotalRows,

MIN(Sample_Size) AS Min_Sample_Size,
MAX(Sample_Size) AS Max_Sample_Size,
AVG(Sample_Size) AS Avg_Sample_Size,

MIN(Measured_Value) AS Min_Value,
MAX(Measured_Value) AS Max_Value,
AVG(Measured_Value) AS Avg_Value

FROM master.Quality_Inspection_Master;
GO