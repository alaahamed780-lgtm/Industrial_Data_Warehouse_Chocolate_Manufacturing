USE Chocolate_Manufacturing_DW;
GO

/*=========================================================
1. Total Rows
=========================================================*/

SELECT COUNT(*) AS TotalRows
FROM staging.Products_Master_Stage;
GO

/*=========================================================
2. Duplicate Product_ID
=========================================================*/

SELECT
    Product_ID,
    COUNT(*) AS DuplicateCount
FROM staging.Products_Master_Stage
GROUP BY Product_ID
HAVING COUNT(*) > 1;
GO

/*=========================================================
3. Missing Product_ID
=========================================================*/

SELECT *
FROM staging.Products_Master_Stage
WHERE NULLIF(LTRIM(RTRIM(Product_ID)), '') IS NULL;
GO

/*=========================================================
4. Missing Product Name
=========================================================*/

SELECT *
FROM staging.Products_Master_Stage
WHERE NULLIF(LTRIM(RTRIM(Product_Name)), '') IS NULL;
GO

/*=========================================================
5. Missing Barcode
=========================================================*/

SELECT *
FROM staging.Products_Master_Stage
WHERE NULLIF(LTRIM(RTRIM(Barcode)), '') IS NULL;
GO

/*=========================================================
6. Invalid Net Weight
=========================================================*/

SELECT *
FROM staging.Products_Master_Stage
WHERE TRY_CONVERT(DECIMAL(10,2), Net_Weight) IS NULL
AND NULLIF(LTRIM(RTRIM(Net_Weight)), '') IS NOT NULL;
GO

/*=========================================================
7. Invalid Standard Cost
=========================================================*/

SELECT *
FROM staging.Products_Master_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Standard_Cost) IS NULL
AND NULLIF(LTRIM(RTRIM(Standard_Cost)), '') IS NOT NULL;
GO

/*=========================================================
8. Invalid Standard Price
=========================================================*/

SELECT *
FROM staging.Products_Master_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Standard_Price) IS NULL
AND NULLIF(LTRIM(RTRIM(Standard_Price)), '') IS NOT NULL;
GO