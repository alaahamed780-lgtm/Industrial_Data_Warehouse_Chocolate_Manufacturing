USE Chocolate_Manufacturing_DW;
GO

--------------------------------------------------
-- Total Rows
--------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM dw.Fact_Inventory;
GO

--------------------------------------------------
-- Preview Data
--------------------------------------------------
SELECT TOP (10) *
FROM dw.Fact_Inventory;
GO

--------------------------------------------------
-- Check Duplicate Inventory_Transaction_ID
--------------------------------------------------
SELECT
    Inventory_Transaction_ID,
    COUNT(*) AS DuplicateCount
FROM dw.Fact_Inventory
GROUP BY Inventory_Transaction_ID
HAVING COUNT(*) > 1;
GO

--------------------------------------------------
-- Missing Product Key
--------------------------------------------------
SELECT
COUNT(*) AS Missing_Product_Key
FROM dw.Fact_Inventory
WHERE Product_Key IS NULL;
GO

--------------------------------------------------
-- Missing Employee Key
--------------------------------------------------
SELECT
COUNT(*) AS Missing_Employee_Key
FROM dw.Fact_Inventory
WHERE Employee_Key IS NULL;
GO

--------------------------------------------------
-- Missing Date Key
--------------------------------------------------
SELECT
COUNT(*) AS Missing_Date_Key
FROM dw.Fact_Inventory
WHERE Date_Key IS NULL;
GO

--------------------------------------------------
-- Inventory Summary
--------------------------------------------------
SELECT

SUM(Quantity) AS Total_Quantity,

SUM(Extended_Cost_USD) AS Total_Inventory_Cost,

AVG(Unit_Cost_USD) AS Avg_Unit_Cost,

AVG(Stock_Before) AS Avg_Stock_Before,

AVG(Stock_After) AS Avg_Stock_After

FROM dw.Fact_Inventory;
GO

PRINT 'Fact_Inventory Check Completed Successfully';
GO