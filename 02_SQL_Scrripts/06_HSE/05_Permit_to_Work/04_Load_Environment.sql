USE Chocolate_Manufacturing_DW;
GO

/*============================================================
02_Load_Permit_to_Work_Stage.sql
============================================================*/

TRUNCATE TABLE staging.Permit_to_Work_Stage;
GO

BULK INSERT staging.Permit_to_Work_Stage
FROM 'D:\Data Analysis\Industrial_Data_Projects\Chocolate_Manufacturing_DW\01_Raw_Data\08_HSE\05_Permit_to_Work_50000.csv'
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
FROM staging.Permit_to_Work_Stage;
GO

/*============================================================
Preview Data
============================================================*/

SELECT TOP (10) *
FROM staging.Permit_to_Work_Stage;
GO