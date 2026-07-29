USE Chocolate_Manufacturing_DW;
GO

/*============================================================
07_Final_Check_Production_Orders.sql
============================================================*/

------------------------------------------------------------
-- 1. Stage Count
------------------------------------------------------------
SELECT COUNT(*) AS Stage_Count
FROM staging.Production_Orders_Stage;
GO

------------------------------------------------------------
-- 2. Master Count
------------------------------------------------------------
SELECT COUNT(*) AS Master_Count
FROM master.Production_Orders_Master;
GO

------------------------------------------------------------
-- 3. Compare Counts
------------------------------------------------------------
SELECT
    (SELECT COUNT(*) FROM staging.Production_Orders_Stage) AS Stage_Count,
    (SELECT COUNT(*) FROM master.Production_Orders_Master) AS Master_Count,
    (
        SELECT COUNT(*) FROM staging.Production_Orders_Stage
    ) -
    (
        SELECT COUNT(*) FROM master.Production_Orders_Master
    ) AS Difference;
GO

------------------------------------------------------------
-- 4. Distinct Production Orders
------------------------------------------------------------
SELECT
    COUNT(DISTINCT Production_Order_ID) AS Distinct_Orders
FROM master.Production_Orders_Master;
GO

------------------------------------------------------------
-- 5. Duplicate Production Orders
------------------------------------------------------------
SELECT
    Production_Order_ID,
    COUNT(*) AS DuplicateCount
FROM master.Production_Orders_Master
GROUP BY Production_Order_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 6. Missing Keys
------------------------------------------------------------
SELECT
    SUM(CASE WHEN Product_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Product_ID,
    SUM(CASE WHEN BOM_ID IS NULL THEN 1 ELSE 0 END) AS Missing_BOM_ID,
    SUM(CASE WHEN Equipment_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Equipment_ID
FROM master.Production_Orders_Master;
GO

------------------------------------------------------------
-- 7. Quantity Summary
------------------------------------------------------------
SELECT
    MIN(Planned_Qty) AS Min_Planned_Qty,
    MAX(Planned_Qty) AS Max_Planned_Qty,
    AVG(Planned_Qty) AS Avg_Planned_Qty,

    MIN(Produced_Qty) AS Min_Produced_Qty,
    MAX(Produced_Qty) AS Max_Produced_Qty,
    AVG(Produced_Qty) AS Avg_Produced_Qty,

    MIN(Scrap_Qty) AS Min_Scrap_Qty,
    MAX(Scrap_Qty) AS Max_Scrap_Qty,
    AVG(Scrap_Qty) AS Avg_Scrap_Qty
FROM master.Production_Orders_Master;
GO

------------------------------------------------------------
-- 8. Cost Summary
------------------------------------------------------------
SELECT
    SUM(Planned_Cost) AS Total_Planned_Cost,
    SUM(Actual_Cost) AS Total_Actual_Cost,
    AVG(Planned_Cost) AS Avg_Planned_Cost,
    AVG(Actual_Cost) AS Avg_Actual_Cost
FROM master.Production_Orders_Master;
GO

------------------------------------------------------------
-- 9. Date Summary
------------------------------------------------------------
SELECT
    MIN(Planned_Start) AS First_Planned_Start,
    MAX(Planned_End) AS Last_Planned_End,
    MIN(Actual_Start) AS First_Actual_Start,
    MAX(Actual_End) AS Last_Actual_End
FROM master.Production_Orders_Master;
GO

------------------------------------------------------------
-- 10. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Production_Orders_Master
ORDER BY Production_Order_ID;
GO