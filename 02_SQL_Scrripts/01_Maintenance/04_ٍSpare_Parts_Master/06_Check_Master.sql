USE Chocolate_Manufacturing_DW;
GO

SELECT COUNT(*) AS TotalRows
FROM staging.Spare_Parts_Stage;
GO

SELECT TOP (20) *
FROM staging.Spare_Parts_Stage;
GO