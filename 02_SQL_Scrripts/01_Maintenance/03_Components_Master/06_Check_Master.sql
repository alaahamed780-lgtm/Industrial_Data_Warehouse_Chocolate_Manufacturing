USE Chocolate_Manufacturing_DW;
GO

SELECT COUNT(*) AS TotalRows
FROM staging.Components_Stage;
GO

SELECT TOP (20) *
FROM staging.Components_Stage;
GO