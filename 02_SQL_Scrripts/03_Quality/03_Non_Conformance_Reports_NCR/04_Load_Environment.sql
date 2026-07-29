USE Chocolate_Manufacturing_DW;
GO

/*============================================================
02_Load_Non_Conformance_Reports.sql
============================================================*/

TRUNCATE TABLE staging.Non_Conformance_Reports_Stage;
GO

BULK INSERT staging.Non_Conformance_Reports_Stage
FROM 'D:\Data Analysis\Industrial_Data_Projects\Chocolate_Manufacturing_DW\01_Raw_Data\03_Quality\03_Non_Conformance_Reports_NCR_50000.csv'
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

/*============================================================
Verify Load
============================================================*/

SELECT
    COUNT(*) AS Stage_Count
FROM staging.Non_Conformance_Reports_Stage;
GO

SELECT TOP (20) *
FROM staging.Non_Conformance_Reports_Stage;
GO