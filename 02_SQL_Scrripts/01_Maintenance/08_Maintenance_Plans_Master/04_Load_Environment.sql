USE Chocolate_Manufacturing_DW;
GO

TRUNCATE TABLE staging.Maintenance_Plans_Stage;
GO

BULK INSERT staging.Maintenance_Plans_Stage
FROM 'D:\Data Analysis\Industrial_Data_Projects\Chocolate_Manufacturing_DW\01_Raw_Data\00_Master\Maintenance_Plans_Master_100000.csv'
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