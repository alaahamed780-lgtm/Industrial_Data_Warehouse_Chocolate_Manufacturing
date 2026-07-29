USE Chocolate_Manufacturing_DW;
GO

TRUNCATE TABLE staging.Equipment_Master_Stage;
GO

BULK INSERT staging.Equipment_Master_Stage
FROM 'D:\Data Analysis\Industrial_Data_Projects\Chocolate_Manufacturing_DW\01_Raw_Data\00_Master\Equipment_Master_Final_100000.csv'
WITH
(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0A',
    TABLOCK,
    CODEPAGE = '65001'
);
GO