USE Chocolate_Manufacturing_DW;
GO

/*============================================================
02_Load_Sales_Order_Items_Stage.sql
============================================================*/

TRUNCATE TABLE staging.Sales_Order_Items_Stage;
GO

BULK INSERT staging.Sales_Order_Items_Stage
FROM 'D:\Data Analysis\Industrial_Data_Projects\Chocolate_Manufacturing_DW\01_Raw_Data\06_Sales\03_Sales_Order_Items_160000.csv'
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
FROM staging.Sales_Order_Items_Stage;
GO

/*============================================================
Preview Data
============================================================*/

SELECT TOP (10) *
FROM staging.Sales_Order_Items_Stage;
GO