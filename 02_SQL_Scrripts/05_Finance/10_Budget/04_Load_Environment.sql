USE Chocolate_Manufacturing_DW;
GO

/*============================================================
02_Load_Budget_Stage.sql
============================================================*/

TRUNCATE TABLE staging.Budget_Stage;
GO

BULK INSERT staging.Budget_Stage
FROM 'D:\Data Analysis\Industrial_Data_Projects\Chocolate_Manufacturing_DW\01_Raw_Data\07_Finance\03_Budget_72000.csv'
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
FROM staging.Budget_Stage;
GO

/*============================================================
Preview Data
============================================================*/

SELECT TOP (10) *
FROM staging.Budget_Stage;
GO