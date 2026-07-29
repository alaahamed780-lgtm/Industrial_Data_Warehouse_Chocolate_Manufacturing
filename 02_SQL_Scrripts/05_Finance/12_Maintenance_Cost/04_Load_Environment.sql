USE Chocolate_Manufacturing_DW;
GO

/*============================================================
02_Load_Maintenance_Cost_Stage.sql
============================================================*/

TRUNCATE TABLE staging.Maintenance_Cost_Stage;
GO

BULK INSERT staging.Maintenance_Cost_Stage
FROM 'D:\Data Analysis\Industrial_Data_Projects\Chocolate_Manufacturing_DW\01_Raw_Data\07_Finance\05_Maintenance_Cost_80000.csv'
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

/*============================================================
Verify Load
============================================================*/

SELECT COUNT(*) AS Stage_Count
FROM staging.Maintenance_Cost_Stage;
GO

/*============================================================
Preview Data
============================================================*/

SELECT TOP (10) *
FROM staging.Maintenance_Cost_Stage;
GO