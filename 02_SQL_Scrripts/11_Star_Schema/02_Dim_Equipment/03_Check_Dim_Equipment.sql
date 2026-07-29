USE Chocolate_Manufacturing_DW;
GO

-- Total Rows
SELECT COUNT(*) AS TotalRows
FROM dw.Dim_Equipment;
GO

-- Preview Data
SELECT TOP (10) *
FROM dw.Dim_Equipment;
GO

-- Check for Duplicate Equipment_ID
SELECT
    Equipment_ID,
    COUNT(*) AS DuplicateCount
FROM dw.Dim_Equipment
GROUP BY Equipment_ID
HAVING COUNT(*) > 1;
GO

PRINT 'Dim_Equipment Check Completed Successfully';
GO