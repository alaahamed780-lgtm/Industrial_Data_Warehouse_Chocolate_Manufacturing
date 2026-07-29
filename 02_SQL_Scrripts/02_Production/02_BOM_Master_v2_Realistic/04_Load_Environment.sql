USE Chocolate_Manufacturing_DW;
GO

/*=========================================================
 Clear Stage Table
=========================================================*/

TRUNCATE TABLE staging.BOM_Master_Stage;
GO

/*=========================================================
 Load CSV File
=========================================================*/

BULK INSERT staging.BOM_Master_Stage
FROM 'D:\Data Analysis\Industrial_Data_Projects\Chocolate_Manufacturing_DW\01_Raw_Data\01_Production\BOM_Master_v2_Realistic.csv'
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

/*=========================================================
 Verify Load
=========================================================*/

SELECT COUNT(*) AS TotalRows
FROM staging.BOM_Master_Stage;
GO

SELECT TOP (20) *
FROM staging.BOM_Master_Stage;
GO