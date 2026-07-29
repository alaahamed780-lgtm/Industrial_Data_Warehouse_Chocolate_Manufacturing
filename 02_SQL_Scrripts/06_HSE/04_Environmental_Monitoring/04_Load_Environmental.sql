USE Chocolate_Manufacturing_DW;
GO

/*============================================================
02_Load_Environmental_Monitoring_Stage.sql
============================================================*/

TRUNCATE TABLE staging.Environmental_Monitoring_Stage;
GO

BULK INSERT staging.Environmental_Monitoring_Stage
FROM 'D:\Data Analysis\Industrial_Data_Projects\Chocolate_Manufacturing_DW\01_Raw_Data\08_HSE\04_Environmental_Monitoring_50000.csv'
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
FROM staging.Environmental_Monitoring_Stage;
GO

/*============================================================
Preview Data
============================================================*/

SELECT TOP (10) *
FROM staging.Environmental_Monitoring_Stage;
GO