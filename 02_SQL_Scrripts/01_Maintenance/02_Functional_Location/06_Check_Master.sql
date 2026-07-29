USE Chocolate_Manufacturing_DW;
GO

SELECT COUNT(*) AS TotalRows
FROM staging.Functional_Location_Stage;
GO

SELECT TOP (20) *
FROM staging.Functional_Location_Stage;
GO