USE Chocolate_Manufacturing_DW;
GO

/*============================================================
02_Load_Sales_Orders_Stage.sql
============================================================*/

TRUNCATE TABLE staging.Sales_Orders_Stage;
GO

BULK INSERT staging.Sales_Orders_Stage
FROM 'D:\Data Analysis\Industrial_Data_Projects\Chocolate_Manufacturing_DW\01_Raw_Data\06_Sales\02_Sales_Orders_80000.csv'
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
FROM staging.Sales_Orders_Stage;
GO

/*============================================================
Preview Data
============================================================*/

SELECT TOP (10) *
FROM staging.Sales_Orders_Stage;
GO