USE Chocolate_Manufacturing_DW;
GO

/*==============================================================
  Clean Stage Table
==============================================================*/

TRUNCATE TABLE staging.Work_Order_Materials_Stage;
GO

/*==============================================================
  Load CSV File
==============================================================*/

BULK INSERT staging.Work_Order_Materials_Stage
FROM 'D:\Data Analysis\Industrial_Data_Projects\Chocolate_Manufacturing_DW\01_Raw_Data\02_Maintenance\Work_Order_Materials_200000.csv'
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

/*==============================================================
  Verify Row Count
==============================================================*/

SELECT
    COUNT(*) AS TotalRows
FROM staging.Work_Order_Materials_Stage;
GO

/*==============================================================
  Preview Data
==============================================================*/

SELECT TOP (20) *
FROM staging.Work_Order_Materials_Stage;
GO