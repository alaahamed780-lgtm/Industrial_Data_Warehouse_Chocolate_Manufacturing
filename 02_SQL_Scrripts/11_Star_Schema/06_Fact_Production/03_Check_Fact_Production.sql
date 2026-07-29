USE Chocolate_Manufacturing_DW;
GO

---------------------------------------------------------
-- Total Rows
---------------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM dw.Fact_Production;
GO

---------------------------------------------------------
-- Preview Data
---------------------------------------------------------
SELECT TOP (10) *
FROM dw.Fact_Production;
GO

---------------------------------------------------------
-- Check Duplicate Production_Order_ID
---------------------------------------------------------
SELECT
    Production_Order_ID,
    COUNT(*) AS DuplicateCount
FROM dw.Fact_Production
GROUP BY Production_Order_ID
HAVING COUNT(*) > 1;
GO

---------------------------------------------------------
-- Missing Date Key
---------------------------------------------------------
SELECT COUNT(*) AS Missing_Date_Key
FROM dw.Fact_Production
WHERE Date_Key IS NULL;
GO

---------------------------------------------------------
-- Missing Product Key
---------------------------------------------------------
SELECT COUNT(*) AS Missing_Product_Key
FROM dw.Fact_Production
WHERE Product_Key IS NULL;
GO

---------------------------------------------------------
-- Missing Equipment Key
---------------------------------------------------------
SELECT COUNT(*) AS Missing_Equipment_Key
FROM dw.Fact_Production
WHERE Equipment_Key IS NULL;
GO

---------------------------------------------------------
-- Production Summary
---------------------------------------------------------
SELECT
    SUM(Planned_Qty) AS Total_Planned_Qty,
    SUM(Produced_Qty) AS Total_Produced_Qty,
    SUM(Scrap_Qty) AS Total_Scrap_Qty,
    AVG(Yield_Percent) AS Avg_Yield_Percent
FROM dw.Fact_Production;
GO

---------------------------------------------------------
-- Cost Summary
---------------------------------------------------------
SELECT
    SUM(Planned_Cost) AS Total_Planned_Cost,
    SUM(Actual_Cost) AS Total_Actual_Cost
FROM dw.Fact_Production;
GO

PRINT 'Fact_Production Check Completed Successfully';
GO