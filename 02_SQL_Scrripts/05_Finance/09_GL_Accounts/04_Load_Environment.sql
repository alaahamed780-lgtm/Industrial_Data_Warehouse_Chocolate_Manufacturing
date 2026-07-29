USE Chocolate_Manufacturing_DW;
GO

/*============================================================
02_Load_GL_Accounts_Stage.sql
============================================================*/

TRUNCATE TABLE staging.GL_Accounts_Stage;
GO

BULK INSERT staging.GL_Accounts_Stage
FROM 'D:\Data Analysis\Industrial_Data_Projects\Chocolate_Manufacturing_DW\01_Raw_Data\07_Finance\02_GL_Accounts_5000.csv'
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
FROM staging.GL_Accounts_Stage;
GO

/*============================================================
Preview Data
============================================================*/

SELECT TOP (10) *
FROM staging.GL_Accounts_Stage;
GO