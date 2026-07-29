USE Chocolate_Manufacturing_DW;
GO

------------------------------------------------------------
-- 02_Load_Calendar_Stage.sql
-- Load Calendar Dimension CSV into Stage Table
------------------------------------------------------------

TRUNCATE TABLE staging.Calendar_Dimension_Stage;
GO

BULK INSERT staging.Calendar_Dimension_Stage
FROM 'D:\Data Analysis\Industrial_Data_Projects\Chocolate_Manufacturing_DW\01_Raw_Data\09_Dimension Data\Calendar_Dimension_2020_2025_Final.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0A',
    TABLOCK,
    CODEPAGE = '65001',
    KEEPNULLS
);
GO

PRINT 'Calendar_Dimension_Stage Loaded Successfully';
GO