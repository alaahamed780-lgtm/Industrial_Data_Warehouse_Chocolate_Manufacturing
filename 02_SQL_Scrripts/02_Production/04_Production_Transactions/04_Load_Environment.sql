USE Chocolate_Manufacturing_DW;
GO

/*==============================================================
Load Production Transactions Stage
==============================================================*/

TRUNCATE TABLE staging.Production_Transactions_Stage;
GO

BULK INSERT staging.Production_Transactions_Stage
FROM 'D:\Data Analysis\Industrial_Data_Projects\Chocolate_Manufacturing_DW\01_Raw_Data\01_Production\Production_Transactions_80000.csv'
WITH
(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0A',
    TABLOCK,
    KEEPNULLS
);
GO

/*==============================================================
Verify Load
==============================================================*/

SELECT COUNT(*) AS TotalRows
FROM staging.Production_Transactions_Stage;
GO

SELECT TOP (20) *
FROM staging.Production_Transactions_Stage;
GO