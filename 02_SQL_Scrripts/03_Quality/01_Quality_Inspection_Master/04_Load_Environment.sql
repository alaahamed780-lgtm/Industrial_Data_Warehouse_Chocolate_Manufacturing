USE Chocolate_Manufacturing_DW;
GO

/******************************************************************************
 Project : Chocolate Manufacturing Data Warehouse
 Module  : Quality
 Table   : Quality_Inspection_Stage
 Purpose : Load CSV File into Stage Table
******************************************************************************/

--===========================================================
-- Clear Stage Table
--===========================================================

TRUNCATE TABLE staging.Quality_Inspection_Stage;
GO

--===========================================================
-- Load CSV File
--===========================================================

BULK INSERT staging.Quality_Inspection_Stage
FROM 'D:\Data Analysis\Industrial_Data_Projects\Chocolate_Manufacturing_DW\01_Raw_Data\03_Quality\01_Quality_Inspection_80000.csv'
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

--===========================================================
-- Verify Load
--===========================================================

SELECT COUNT(*) AS Stage_Count
FROM staging.Quality_Inspection_Stage;
GO

SELECT TOP (20) *
FROM staging.Quality_Inspection_Stage;
GO