USE Chocolate_Manufacturing_DW;
GO

/*============================================================
02_Load_Purchase_Orders_Stage.sql
============================================================*/

TRUNCATE TABLE staging.Purchase_Orders_Stage;
GO

BULK INSERT staging.Purchase_Orders_Stage
FROM 'D:\Data Analysis\Industrial_Data_Projects\Chocolate_Manufacturing_DW\01_Raw_Data\04_Supplychain\08_Purchase_Orders_80000.csv'
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
Verify Load
============================================================*/

SELECT COUNT(*) AS Stage_Count
FROM staging.Purchase_Orders_Stage;
GO

SELECT TOP (20) *
FROM staging.Purchase_Orders_Stage;
GO