USE Chocolate_Manufacturing_DW;
GO

/*============================================================
02_Load_Customer_Complaints_Stage.sql
============================================================*/

TRUNCATE TABLE staging.Customer_Complaints_Stage;
GO

BULK INSERT staging.Customer_Complaints_Stage
FROM 'D:\Data Analysis\Industrial_Data_Projects\Chocolate_Manufacturing_DW\01_Raw_Data\06_Sales\07_Customer_Complaints_50000.csv'
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
FROM staging.Customer_Complaints_Stage;
GO

/*============================================================
Preview Data
============================================================*/

SELECT TOP (10) *
FROM staging.Customer_Complaints_Stage;
GO