USE Chocolate_Manufacturing_DW;
GO

/*=========================================================
03_Data_Quality_BOM.sql
Data Quality Checks for BOM Stage
=========================================================*/


/*=========================================================
1. Total Records
=========================================================*/

SELECT COUNT(*) AS TotalRows
FROM staging.BOM_Master_Stage;
GO


/*=========================================================
2. Duplicate BOM + Material
=========================================================*/

SELECT
    BOM_ID,
    Material_ID,
    COUNT(*) AS DuplicateCount
FROM staging.BOM_Master_Stage
GROUP BY
    BOM_ID,
    Material_ID
HAVING COUNT(*) > 1;
GO


/*=========================================================
3. Missing BOM_ID
=========================================================*/

SELECT *
FROM staging.BOM_Master_Stage
WHERE NULLIF(LTRIM(RTRIM(BOM_ID)), '') IS NULL;
GO


/*=========================================================
4. Missing Product_ID
=========================================================*/

SELECT *
FROM staging.BOM_Master_Stage
WHERE NULLIF(LTRIM(RTRIM(Product_ID)), '') IS NULL;
GO


/*=========================================================
5. Missing Material_ID
=========================================================*/

SELECT *
FROM staging.BOM_Master_Stage
WHERE NULLIF(LTRIM(RTRIM(Material_ID)), '') IS NULL;
GO


/*=========================================================
6. Invalid Effective_From
=========================================================*/

SELECT *
FROM staging.BOM_Master_Stage
WHERE TRY_CONVERT(DATE, Effective_From) IS NULL
AND NULLIF(LTRIM(RTRIM(Effective_From)), '') IS NOT NULL;
GO


/*=========================================================
7. Invalid Effective_To
=========================================================*/

SELECT *
FROM staging.BOM_Master_Stage
WHERE TRY_CONVERT(DATE, Effective_To) IS NULL
AND NULLIF(LTRIM(RTRIM(Effective_To)), '') IS NOT NULL;
GO


/*=========================================================
8. Invalid Qty_Per_100
=========================================================*/

SELECT *
FROM staging.BOM_Master_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Qty_Per_100) IS NULL
AND NULLIF(LTRIM(RTRIM(Qty_Per_100)), '') IS NOT NULL;
GO


/*=========================================================
9. Qty <= 0
=========================================================*/

SELECT *
FROM staging.BOM_Master_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Qty_Per_100) <= 0;
GO


/*=========================================================
10. Invalid Cost
=========================================================*/

SELECT *
FROM staging.BOM_Master_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Cost_USD) IS NULL
AND NULLIF(LTRIM(RTRIM(Cost_USD)), '') IS NOT NULL;
GO


/*=========================================================
11. Cost < 0
=========================================================*/

SELECT *
FROM staging.BOM_Master_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Cost_USD) < 0;
GO


/*=========================================================
12. Invalid Yield %
=========================================================*/

SELECT *
FROM staging.BOM_Master_Stage
WHERE TRY_CONVERT(DECIMAL(5,2), Yield_Percent) NOT BETWEEN 0 AND 100;
GO


/*=========================================================
13. Invalid Scrap %
=========================================================*/

SELECT *
FROM staging.BOM_Master_Stage
WHERE TRY_CONVERT(DECIMAL(5,2), Scrap_Percent) NOT BETWEEN 0 AND 100;
GO


/*=========================================================
14. Missing Supplier
=========================================================*/

SELECT *
FROM staging.BOM_Master_Stage
WHERE NULLIF(LTRIM(RTRIM(Supplier_ID)), '') IS NULL;
GO


/*=========================================================
15. Missing Sequence
=========================================================*/

SELECT *
FROM staging.BOM_Master_Stage
WHERE NULLIF(LTRIM(RTRIM(Sequence)), '') IS NULL;
GO


/*=========================================================
16. Summary
=========================================================*/

SELECT

COUNT(*) AS Total_Records,

COUNT(DISTINCT BOM_ID) AS Total_BOMs,

COUNT(DISTINCT Product_ID) AS Total_Products,

COUNT(DISTINCT Material_ID) AS Total_Materials,

MIN(TRY_CONVERT(decimal(18,2),Qty_Per_100)) AS Min_Qty,

MAX(TRY_CONVERT(decimal(18,2),Qty_Per_100)) AS Max_Qty,

AVG(TRY_CONVERT(decimal(18,2),Qty_Per_100)) AS Avg_Qty,

MIN(TRY_CONVERT(decimal(18,2),Cost_USD)) AS Min_Cost,

MAX(TRY_CONVERT(decimal(18,2),Cost_USD)) AS Max_Cost,

AVG(TRY_CONVERT(decimal(18,2),Cost_USD)) AS Avg_Cost

FROM staging.BOM_Master_Stage;
GO