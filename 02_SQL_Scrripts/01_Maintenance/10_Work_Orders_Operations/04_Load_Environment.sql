USE Chocolate_Manufacturing_DW;
GO

/*=========================================================
  Clear Stage Table
=========================================================*/
TRUNCATE TABLE staging.Work_Order_Operations_Stage;
GO

/*=========================================================
  Load CSV File
=========================================================*/
BULK INSERT staging.Work_Order_Operations_Stage
FROM 'D:\Data Analysis\Industrial_Data_Projects\Chocolate_Manufacturing_DW\01_Raw_Data\02_Maintenance\Work_Order_Operations_200000.csv'
WITH
(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0A',
    CODEPAGE = '65001',
    KEEPNULLS,
    TABLOCK
);
GO

/*=========================================================
  Validation
=========================================================*/

-- Total Records
SELECT COUNT(*) AS TotalRows
FROM staging.Work_Order_Operations_Stage;
GO

-- First 20 Records
SELECT TOP (20) *
FROM staging.Work_Order_Operations_Stage;
GO

-- Last 20 Records
SELECT TOP (20) *
FROM staging.Work_Order_Operations_Stage
ORDER BY Operation_ID DESC;
GO