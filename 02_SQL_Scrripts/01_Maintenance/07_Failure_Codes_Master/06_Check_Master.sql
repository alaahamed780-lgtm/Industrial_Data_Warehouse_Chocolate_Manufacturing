USE Chocolate_Manufacturing_DW;
GO

-- عدد السجلات
SELECT COUNT(*) AS TotalRows
FROM staging.Failure_Codes_Stage;
GO

-- معاينة أول 20 سجل
SELECT TOP (20) *
FROM staging.Failure_Codes_Stage;
GO