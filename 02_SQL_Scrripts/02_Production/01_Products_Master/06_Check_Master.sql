USE Chocolate_Manufacturing_DW;
GO

/*============================================================
06_Check_Download_Products_Master.sql
Compare Stage vs Master
============================================================*/

------------------------------------------------------------
-- 1. Stage Count
------------------------------------------------------------
SELECT COUNT(*) AS Stage_Count
FROM staging.Products_Master_Stage;
GO

------------------------------------------------------------
-- 2. Master Count
------------------------------------------------------------
SELECT COUNT(*) AS Master_Count
FROM master.Products_Master;
GO

------------------------------------------------------------
-- 3. Difference
------------------------------------------------------------
SELECT
    (SELECT COUNT(*) FROM staging.Products_Master_Stage) AS Stage_Count,
    (SELECT COUNT(*) FROM master.Products_Master) AS Master_Count,
    (
        (SELECT COUNT(*) FROM staging.Products_Master_Stage)
        -
        (SELECT COUNT(*) FROM master.Products_Master)
    ) AS Difference;
GO

------------------------------------------------------------
-- 4. Duplicate Product_ID
------------------------------------------------------------
SELECT
    Product_ID,
    COUNT(*) AS DuplicateCount
FROM master.Products_Master
GROUP BY Product_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 5. Missing Product_ID
------------------------------------------------------------
SELECT *
FROM master.Products_Master
WHERE Product_ID IS NULL
   OR LTRIM(RTRIM(Product_ID))='';
GO

------------------------------------------------------------
-- 6. Missing SKU
------------------------------------------------------------
SELECT *
FROM master.Products_Master
WHERE SKU IS NULL
   OR LTRIM(RTRIM(SKU))='';
GO

------------------------------------------------------------
-- 7. Missing Product Name
------------------------------------------------------------
SELECT *
FROM master.Products_Master
WHERE Product_Name IS NULL
   OR LTRIM(RTRIM(Product_Name))='';
GO

------------------------------------------------------------
-- 8. Invalid Cocoa Percent
------------------------------------------------------------
SELECT *
FROM master.Products_Master
WHERE Cocoa_Percent < 0
   OR Cocoa_Percent > 100;
GO

------------------------------------------------------------
-- 9. Invalid Net Weight
------------------------------------------------------------
SELECT *
FROM master.Products_Master
WHERE Net_Weight <= 0;
GO

------------------------------------------------------------
-- 10. Invalid Standard Cost
------------------------------------------------------------
SELECT *
FROM master.Products_Master
WHERE Standard_Cost < 0;
GO

------------------------------------------------------------
-- 11. Invalid Standard Price
------------------------------------------------------------
SELECT *
FROM master.Products_Master
WHERE Standard_Price < 0;
GO

------------------------------------------------------------
-- 12. Summary
------------------------------------------------------------
SELECT

MIN(Cocoa_Percent) AS Min_Cocoa,
MAX(Cocoa_Percent) AS Max_Cocoa,
AVG(Cocoa_Percent) AS Avg_Cocoa,

MIN(Net_Weight) AS Min_Weight,
MAX(Net_Weight) AS Max_Weight,
AVG(Net_Weight) AS Avg_Weight,

MIN(Standard_Cost) AS Min_Cost,
MAX(Standard_Cost) AS Max_Cost,
AVG(Standard_Cost) AS Avg_Cost,

MIN(Standard_Price) AS Min_Price,
MAX(Standard_Price) AS Max_Price,
AVG(Standard_Price) AS Avg_Price

FROM master.Products_Master;
GO

------------------------------------------------------------
-- End of File
------------------------------------------------------------