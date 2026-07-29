USE Chocolate_Manufacturing_DW;
GO

/*============================================================
02_Load_Warehouse_Transfers_Stage.sql
============================================================*/

TRUNCATE TABLE staging.Warehouse_Transfers_Stage;
GO

BULK INSERT staging.Warehouse_Transfers_Stage
FROM 'D:\Data Analysis\Industrial_Data_Projects\Chocolate_Manufacturing_DW\01_Raw_Data\04_Supplychain\11_Warehouse_Transfers_80000.csv'
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
FROM staging.Warehouse_Transfers_Stage;
GO

/*============================================================
Preview Data
============================================================*/

SELECT TOP (10) *
FROM staging.Warehouse_Transfers_Stage;
GO