USE Chocolate_Manufacturing_DW;
GO

/*=========================================================
 Clear Stage Table
=========================================================*/

TRUNCATE TABLE staging.Products_Master_Stage;
GO

/*=========================================================
 Load CSV File
=========================================================*/

BULK INSERT staging.Products_Master_Stage
FROM 'D:\Data Analysis\Industrial_Data_Projects\Chocolate_Manufacturing_DW\01_Raw_Data\01_Production\Products_Master_50000.csv'
WITH
(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0A',
    CODEPAGE = '65001',
    TABLOCK,
    KEEPNULLS
);
GO

/*=========================================================
 Verify Load
=========================================================*/

SELECT
    COUNT(*) AS TotalRows
FROM staging.Products_Master_Stage;
GO

SELECT TOP (20) *
FROM staging.Products_Master_Stage;
GO