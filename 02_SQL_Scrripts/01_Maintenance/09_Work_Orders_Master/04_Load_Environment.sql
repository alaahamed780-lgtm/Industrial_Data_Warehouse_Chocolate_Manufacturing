USE Chocolate_Manufacturing_DW;
GO

-------------------------------------------------------
-- تنظيف جدول Stage
-------------------------------------------------------
TRUNCATE TABLE staging.Work_Orders_Stage;
GO

-------------------------------------------------------
-- تحميل ملف CSV
-------------------------------------------------------
BULK INSERT staging.Work_Orders_Stage
FROM 'D:\Data Analysis\Industrial_Data_Projects\Chocolate_Manufacturing_DW\01_Raw_Data\02_Maintenance\Work_Orders_Master_150000.csv'
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

-------------------------------------------------------
-- التحقق من التحميل
-------------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM staging.Work_Orders_Stage;
GO

-------------------------------------------------------
-- أول 20 سجل
-------------------------------------------------------
SELECT TOP (20) *
FROM staging.Work_Orders_Stage;
GO

-------------------------------------------------------
-- آخر 20 سجل
-------------------------------------------------------
SELECT TOP (20) *
FROM staging.Work_Orders_Stage
ORDER BY Work_Order_ID DESC;
GO