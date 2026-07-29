USE Chocolate_Manufacturing_DW;
GO

/*============================================================
02_Load_Returns_Stage.sql
============================================================*/

TRUNCATE TABLE staging.Returns_Stage;
GO

BULK INSERT staging.Returns_Stage
FROM 'D:\Data Analysis\Industrial_Data_Projects\Chocolate_Manufacturing_DW\01_Raw_Data\06_Sales\06_Returns_50000.csv'
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

SELECT
    COUNT(*) AS Stage_Count
FROM staging.Returns_Stage;
GO

/*============================================================
Preview Data
============================================================*/

SELECT TOP (10) *
FROM staging.Returns_Stage;
GO