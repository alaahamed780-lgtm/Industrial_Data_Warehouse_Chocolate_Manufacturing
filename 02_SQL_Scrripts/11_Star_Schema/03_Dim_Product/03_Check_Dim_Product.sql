USE Chocolate_Manufacturing_DW;
GO

--------------------------------------------------------
-- Total Rows
--------------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM dw.Dim_Product;
GO

--------------------------------------------------------
-- Preview Data
--------------------------------------------------------
SELECT TOP (10) *
FROM dw.Dim_Product;
GO

--------------------------------------------------------
-- Check Duplicate Product_ID
--------------------------------------------------------
SELECT
    Product_ID,
    COUNT(*) AS DuplicateCount
FROM dw.Dim_Product
GROUP BY Product_ID
HAVING COUNT(*) > 1;
GO

PRINT 'Dim_Product Check Completed Successfully';
GO