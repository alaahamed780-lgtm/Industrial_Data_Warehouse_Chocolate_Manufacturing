USE Chocolate_Manufacturing_DW;
GO

/*============================================================
02_Load_Inventory_Balance_Stage.sql
============================================================*/

TRUNCATE TABLE staging.Inventory_Balance_Stage;
GO

BULK INSERT staging.Inventory_Balance_Stage
FROM 'D:\Data Analysis\Industrial_Data_Projects\Chocolate_Manufacturing_DW\01_Raw_Data\04_Supplychain\12_Inventory_Balance_80000.csv'
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
FROM staging.Inventory_Balance_Stage;
GO

/*============================================================
Preview Data
============================================================*/

SELECT TOP (10) *
FROM staging.Inventory_Balance_Stage;
GO