USE Chocolate_Manufacturing_DW;
GO

/*============================================================
07_Final_Check_BOM.sql
Final Validation
============================================================*/

------------------------------------------------------------
-- 1. Stage Count
------------------------------------------------------------
SELECT COUNT(*) AS Stage_Count
FROM staging.BOM_Master_Stage;
GO

------------------------------------------------------------
-- 2. Master Count
------------------------------------------------------------
SELECT COUNT(*) AS Master_Count
FROM master.BOM_Master;
GO

------------------------------------------------------------
-- 3. Compare Counts
------------------------------------------------------------
SELECT
    (SELECT COUNT(*) FROM staging.BOM_Master_Stage) AS Stage_Count,
    (SELECT COUNT(*) FROM master.BOM_Master) AS Master_Count,
    (
        (SELECT COUNT(*) FROM staging.BOM_Master_Stage)
        -
        (SELECT COUNT(*) FROM master.BOM_Master)
    ) AS Difference;
GO

------------------------------------------------------------
-- 4. Distinct BOMs
------------------------------------------------------------
SELECT
    COUNT(DISTINCT BOM_ID) AS Total_BOMs
FROM master.BOM_Master;
GO

------------------------------------------------------------
-- 5. Duplicate Primary Keys
------------------------------------------------------------
SELECT
    BOM_ID,
    Material_ID,
    Sequence,
    COUNT(*) AS DuplicateCount
FROM master.BOM_Master
GROUP BY
    BOM_ID,
    Material_ID,
    Sequence
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 6. Missing Keys
------------------------------------------------------------
SELECT
    SUM(CASE WHEN Product_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Product_ID,
    SUM(CASE WHEN Material_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Material_ID,
    SUM(CASE WHEN Supplier_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Supplier_ID
FROM master.BOM_Master;
GO

------------------------------------------------------------
-- 7. Quantity Summary
------------------------------------------------------------
SELECT
    MIN(Qty_Per_100) AS Min_Qty,
    MAX(Qty_Per_100) AS Max_Qty,
    AVG(Qty_Per_100) AS Avg_Qty
FROM master.BOM_Master;
GO

------------------------------------------------------------
-- 8. Cost Summary
------------------------------------------------------------
SELECT
    SUM(Cost_USD) AS Total_Cost,
    AVG(Cost_USD) AS Avg_Cost,
    MAX(Cost_USD) AS Max_Cost
FROM master.BOM_Master;
GO

------------------------------------------------------------
-- 9. Yield Summary
------------------------------------------------------------
SELECT
    AVG(Yield_Percent) AS Avg_Yield,
    AVG(Scrap_Percent) AS Avg_Scrap
FROM master.BOM_Master;
GO

------------------------------------------------------------
-- 10. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.BOM_Master
ORDER BY BOM_ID, Sequence;
GO