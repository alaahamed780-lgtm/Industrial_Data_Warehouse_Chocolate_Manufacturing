USE Chocolate_Manufacturing_DW;
GO

/*============================================================
03_Data_Quality_Production_Orders.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM staging.Production_Orders_Stage;
GO

------------------------------------------------------------
-- 2. Missing Production_Order_ID
------------------------------------------------------------
SELECT *
FROM staging.Production_Orders_Stage
WHERE Production_Order_ID IS NULL
   OR LTRIM(RTRIM(Production_Order_ID))='';
GO

------------------------------------------------------------
-- 3. Duplicate Production_Order_ID
------------------------------------------------------------
SELECT
    Production_Order_ID,
    COUNT(*) AS DuplicateCount
FROM staging.Production_Orders_Stage
GROUP BY Production_Order_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 4. Missing Product_ID
------------------------------------------------------------
SELECT *
FROM staging.Production_Orders_Stage
WHERE Product_ID IS NULL
   OR LTRIM(RTRIM(Product_ID))='';
GO

------------------------------------------------------------
-- 5. Missing BOM_ID
------------------------------------------------------------
SELECT *
FROM staging.Production_Orders_Stage
WHERE BOM_ID IS NULL
   OR LTRIM(RTRIM(BOM_ID))='';
GO

------------------------------------------------------------
-- 6. Missing Recipe_ID
------------------------------------------------------------
SELECT *
FROM staging.Production_Orders_Stage
WHERE Recipe_ID IS NULL
   OR LTRIM(RTRIM(Recipe_ID))='';
GO

------------------------------------------------------------
-- 7. Invalid Planned_Qty
------------------------------------------------------------
SELECT *
FROM staging.Production_Orders_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Planned_Qty) IS NULL
AND Planned_Qty IS NOT NULL
AND LTRIM(RTRIM(Planned_Qty))<>'';
GO

------------------------------------------------------------
-- 8. Invalid Produced_Qty
------------------------------------------------------------
SELECT *
FROM staging.Production_Orders_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Produced_Qty) IS NULL
AND Produced_Qty IS NOT NULL
AND LTRIM(RTRIM(Produced_Qty))<>'';
GO

------------------------------------------------------------
-- 9. Invalid Scrap_Qty
------------------------------------------------------------
SELECT *
FROM staging.Production_Orders_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Scrap_Qty) IS NULL
AND Scrap_Qty IS NOT NULL
AND LTRIM(RTRIM(Scrap_Qty))<>'';
GO

------------------------------------------------------------
-- 10. Invalid Yield_Percent
------------------------------------------------------------
SELECT *
FROM staging.Production_Orders_Stage
WHERE TRY_CONVERT(DECIMAL(5,2), Yield_Percent) IS NULL
AND Yield_Percent IS NOT NULL
AND LTRIM(RTRIM(Yield_Percent))<>'';
GO

------------------------------------------------------------
-- 11. Invalid Planned_Start
------------------------------------------------------------
SELECT *
FROM staging.Production_Orders_Stage
WHERE TRY_CONVERT(DATETIME2, Planned_Start) IS NULL
AND Planned_Start IS NOT NULL
AND LTRIM(RTRIM(Planned_Start))<>'';
GO

------------------------------------------------------------
-- 12. Invalid Planned_End
------------------------------------------------------------
SELECT *
FROM staging.Production_Orders_Stage
WHERE TRY_CONVERT(DATETIME2, Planned_End) IS NULL
AND Planned_End IS NOT NULL
AND LTRIM(RTRIM(Planned_End))<>'';
GO

------------------------------------------------------------
-- 13. Invalid Actual_Start
------------------------------------------------------------
SELECT *
FROM staging.Production_Orders_Stage
WHERE TRY_CONVERT(DATETIME2, Actual_Start) IS NULL
AND Actual_Start IS NOT NULL
AND LTRIM(RTRIM(Actual_Start))<>'';
GO

------------------------------------------------------------
-- 14. Invalid Actual_End
------------------------------------------------------------
SELECT *
FROM staging.Production_Orders_Stage
WHERE TRY_CONVERT(DATETIME2, Actual_End) IS NULL
AND Actual_End IS NOT NULL
AND LTRIM(RTRIM(Actual_End))<>'';
GO

------------------------------------------------------------
-- 15. Invalid Planned_Cost
------------------------------------------------------------
SELECT *
FROM staging.Production_Orders_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Planned_Cost) IS NULL
AND Planned_Cost IS NOT NULL
AND LTRIM(RTRIM(Planned_Cost))<>'';
GO

------------------------------------------------------------
-- 16. Invalid Actual_Cost
------------------------------------------------------------
SELECT *
FROM staging.Production_Orders_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Actual_Cost) IS NULL
AND Actual_Cost IS NOT NULL
AND LTRIM(RTRIM(Actual_Cost))<>'';
GO

------------------------------------------------------------
-- 17. Summary
------------------------------------------------------------
SELECT

COUNT(*) AS TotalRows,

COUNT(DISTINCT Production_Order_ID) AS Total_Orders,

MIN(TRY_CONVERT(DECIMAL(18,2),Planned_Qty)) AS Min_Planned_Qty,
MAX(TRY_CONVERT(DECIMAL(18,2),Planned_Qty)) AS Max_Planned_Qty,
AVG(TRY_CONVERT(DECIMAL(18,2),Planned_Qty)) AS Avg_Planned_Qty,

MIN(TRY_CONVERT(DECIMAL(18,2),Produced_Qty)) AS Min_Produced_Qty,
MAX(TRY_CONVERT(DECIMAL(18,2),Produced_Qty)) AS Max_Produced_Qty,
AVG(TRY_CONVERT(DECIMAL(18,2),Produced_Qty)) AS Avg_Produced_Qty,

MIN(TRY_CONVERT(DECIMAL(18,2),Actual_Cost)) AS Min_Cost,
MAX(TRY_CONVERT(DECIMAL(18,2),Actual_Cost)) AS Max_Cost,
AVG(TRY_CONVERT(DECIMAL(18,2),Actual_Cost)) AS Avg_Cost

FROM staging.Production_Orders_Stage;
GO