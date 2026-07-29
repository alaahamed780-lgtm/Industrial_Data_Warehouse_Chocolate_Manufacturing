USE Chocolate_Manufacturing_DW;
GO

/*==========================================================
Clear Stage Table
==========================================================*/

TRUNCATE TABLE staging.Downtime_Events_Stage;
GO

/*==========================================================
Load CSV File
==========================================================*/

BULK INSERT staging.Downtime_Events_Stage
FROM 'D:\Data Analysis\Industrial_Data_Projects\Chocolate_Manufacturing_DW\01_Raw_Data\02_Maintenance\Downtime_Events_200000.csv'
WITH
(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0A',
    TABLOCK,
    CODEPAGE = '65001'
);
GO

/*==========================================================
Verify Row Count
==========================================================*/

SELECT
    COUNT(*) AS TotalRows
FROM staging.Downtime_Events_Stage;
GO

/*==========================================================
Preview Data
==========================================================*/

SELECT TOP (20) *
FROM staging.Downtime_Events_Stage;
GO