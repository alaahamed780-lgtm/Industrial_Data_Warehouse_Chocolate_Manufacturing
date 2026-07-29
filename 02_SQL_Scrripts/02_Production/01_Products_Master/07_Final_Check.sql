USE Chocolate_Manufacturing_DW;
GO

/*============================================================
07_Final_Check_Products_Master.sql
Final Verification
============================================================*/

------------------------------------------------------------
-- Stage Count
------------------------------------------------------------
SELECT COUNT(*) AS Stage_Count
FROM staging.Products_Master_Stage;
GO

------------------------------------------------------------
-- Master Count
------------------------------------------------------------
SELECT COUNT(*) AS Master_Count
FROM master.Products_Master;
GO

------------------------------------------------------------
-- Compare Counts
------------------------------------------------------------
SELECT
    (SELECT COUNT(*) FROM staging.Products_Master_Stage) AS Stage_Count,
    (SELECT COUNT(*) FROM master.Products_Master) AS Master_Count,
    (SELECT COUNT(*) FROM staging.Products_Master_Stage)
    -
    (SELECT COUNT(*) FROM master.Products_Master) AS Difference;
GO

------------------------------------------------------------
-- Duplicate Product_ID
------------------------------------------------------------
SELECT
    Product_ID,
    COUNT(*) AS DuplicateCount
FROM master.Products_Master
GROUP BY Product_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- Final Summary
------------------------------------------------------------
SELECT

COUNT(*) AS Total_Products,

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
-- Sample Records
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Products_Master
ORDER BY Product_ID;
GO

------------------------------------------------------------
-- End of File
------------------------------------------------------------