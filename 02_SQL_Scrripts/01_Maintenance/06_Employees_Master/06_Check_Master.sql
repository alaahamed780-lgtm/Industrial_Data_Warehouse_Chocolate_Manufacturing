USE Chocolate_Manufacturing_DW;
GO

SELECT COUNT(*) AS TotalRows
FROM staging.Employees_Stage;
GO

SELECT TOP (20) *
FROM staging.Employees_Stage;
GO