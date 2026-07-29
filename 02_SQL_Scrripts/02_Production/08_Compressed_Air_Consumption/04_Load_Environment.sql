USE Chocolate_Manufacturing_DW;
GO

/*============================================================
02_Load_Compressed_Air_Consumption_Stage.sql
============================================================*/

TRUNCATE TABLE staging.Compressed_Air_Consumption_Stage;
GO

BULK INSERT staging.Compressed_Air_Consumption_Stage
FROM 'D:\Data Analysis\Industrial_Data_Projects\Chocolate_Manufacturing_DW\01_Raw_Data\05_Utilities\04_Compressed_Air_Consumption_80000.csv'
WITH
(
    FORMAT='CSV',
    FIRSTROW=2,
    FIELDTERMINATOR=',',
    ROWTERMINATOR='0x0A',
    TABLOCK,
    CODEPAGE='65001',
    KEEPNULLS
);
GO

/*============================================================
Verify Row Count
============================================================*/

SELECT COUNT(*) AS Stage_Count
FROM staging.Compressed_Air_Consumption_Stage;
GO

/*============================================================
Preview Data
============================================================*/

SELECT TOP (10) *
FROM staging.Compressed_Air_Consumption_Stage;
GO