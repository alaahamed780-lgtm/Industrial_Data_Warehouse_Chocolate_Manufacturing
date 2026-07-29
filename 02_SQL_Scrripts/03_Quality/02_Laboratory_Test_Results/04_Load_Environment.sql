USE Chocolate_Manufacturing_DW;
GO

TRUNCATE TABLE staging.Laboratory_Test_Results_Stage;
GO

BULK INSERT staging.Laboratory_Test_Results_Stage
FROM 'D:\Data Analysis\Industrial_Data_Projects\Chocolate_Manufacturing_DW\01_Raw_Data\03_Quality\02_Laboratory_Test_Results_80000.csv'
WITH
(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0A',
    TABLOCK,
    CODEPAGE = '65001',
    KEEPNULLS
);
GO

SELECT COUNT(*) AS Stage_Count
FROM staging.Laboratory_Test_Results_Stage;
GO

SELECT TOP (20) *
FROM staging.Laboratory_Test_Results_Stage;
GO