USE Chocolate_Manufacturing_DW;
GO

/*============================================================
02_Load_CAPA_Stage.sql
============================================================*/

TRUNCATE TABLE staging.CAPA_Corrective_Preventive_Actions_Stage;
GO

BULK INSERT staging.CAPA_Corrective_Preventive_Actions_Stage
FROM 'D:\Data Analysis\Industrial_Data_Projects\Chocolate_Manufacturing_DW\01_Raw_Data\03_Quality\04_CAPA_Corrective_Preventive_Actions_50000.csv'
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

SELECT COUNT(*) AS Stage_Count
FROM staging.CAPA_Corrective_Preventive_Actions_Stage;
GO

SELECT TOP (20) *
FROM staging.CAPA_Corrective_Preventive_Actions_Stage;
GO