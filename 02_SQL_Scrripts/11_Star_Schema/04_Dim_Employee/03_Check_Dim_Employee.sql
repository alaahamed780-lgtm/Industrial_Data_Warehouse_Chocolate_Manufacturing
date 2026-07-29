USE Chocolate_Manufacturing_DW;
GO

SELECT COUNT(*) AS TotalRows
FROM dw.Dim_Employee;
GO

SELECT TOP (10) *
FROM dw.Dim_Employee;
GO

SELECT
Employee_ID,
COUNT(*) AS DuplicateCount
FROM dw.Dim_Employee
GROUP BY Employee_ID
HAVING COUNT(*) > 1;
GO

PRINT 'Dim_Employee Check Completed Successfully';
GO