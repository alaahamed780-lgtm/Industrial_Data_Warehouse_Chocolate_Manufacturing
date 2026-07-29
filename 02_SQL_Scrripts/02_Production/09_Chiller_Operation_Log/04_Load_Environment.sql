USE Chocolate_Manufacturing_DW;
GO

/*============================================================
02_Load_Chiller_Operation_Log_Stage.sql
============================================================*/

TRUNCATE TABLE staging.Chiller_Operation_Log_Stage;
GO

BULK INSERT staging.Chiller_Operation_Log_Stage
FROM 'D:\Data Analysis\Industrial_Data_Projects\Chocolate_Manufacturing_DW\01_Raw_Data\05_Utilities\05_Chiller_Operation_Log_80000.csv'
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
FROM staging.Chiller_Operation_Log_Stage;
GO

/*============================================================
Preview Data
============================================================*/

SELECT TOP (10) *
FROM staging.Chiller_Operation_Log_Stage;
GO