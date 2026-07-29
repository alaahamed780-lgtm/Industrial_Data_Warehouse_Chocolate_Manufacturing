USE Chocolate_Manufacturing_DW;
GO

/*============================================================
02_Load_Goods_Receipt_Stage.sql
============================================================*/

TRUNCATE TABLE staging.Goods_Receipt_Stage;
GO

BULK INSERT staging.Goods_Receipt_Stage
FROM 'D:\Data Analysis\Industrial_Data_Projects\Chocolate_Manufacturing_DW\01_Raw_Data\04_Supplychain\09_Goods_Receipt_80000.csv'
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
FROM staging.Goods_Receipt_Stage;
GO

SELECT TOP (20) *
FROM staging.Goods_Receipt_Stage;
GO