USE Chocolate_Manufacturing_DW;
GO

-- تنظيف الـ Stage
TRUNCATE TABLE staging.Failure_Codes_Stage;
GO

-- تحميل البيانات من ملف CSV
BULK INSERT staging.Failure_Codes_Stage
FROM 'D:\Data Analysis\Industrial_Data_Projects\Chocolate_Manufacturing_DW\01_Raw_Data\00_Master\Failure_Codes_Master_50000.csv'
WITH
(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0A',
    CODEPAGE = '65001',
    TABLOCK
);
GO

-- التحقق من نجاح التحميل
SELECT COUNT(*) AS TotalRows
FROM staging.Failure_Codes_Stage;
GO

SELECT TOP (20) *
FROM staging.Failure_Codes_Stage;
GO