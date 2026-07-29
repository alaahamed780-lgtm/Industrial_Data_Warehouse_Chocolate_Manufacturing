USE Chocolate_Manufacturing_DW;
GO

/*==============================================================
Load Production Orders CSV into Stage
==============================================================*/

TRUNCATE TABLE staging.Production_Orders_Stage;
GO

BULK INSERT staging.Production_Orders_Stage
FROM 'D:\Data Analysis\Industrial_Data_Projects\Chocolate_Manufacturing_DW\01_Raw_Data\01_Production\Production_Orders_100000.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0A',
    CODEPAGE = '65001',
    TABLOCK,
    KEEPNULLS
);
GO

/*==============================================================
Verify Load
==============================================================*/

SELECT COUNT(*) AS TotalRows
FROM staging.Production_Orders_Stage;
GO

SELECT TOP (20) *
FROM staging.Production_Orders_Stage;
GO