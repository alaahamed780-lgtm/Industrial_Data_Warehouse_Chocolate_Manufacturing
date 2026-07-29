USE Chocolate_Manufacturing_DW;
GO

/*============================================================
06_Check_Shipments_Master.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM master.Shipments_Master;
GO

------------------------------------------------------------
-- 2. Preview Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Shipments_Master
ORDER BY Shipment_ID;
GO

------------------------------------------------------------
-- 3. Missing Primary Key
------------------------------------------------------------
SELECT COUNT(*) AS Missing_Shipment_ID
FROM master.Shipments_Master
WHERE Shipment_ID IS NULL;
GO

------------------------------------------------------------
-- 4. Duplicate Shipment IDs
------------------------------------------------------------
SELECT
    Shipment_ID,
    COUNT(*) AS DuplicateCount
FROM master.Shipments_Master
GROUP BY Shipment_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 5. Duplicate Shipment Numbers
------------------------------------------------------------
SELECT
    Shipment_Number,
    COUNT(*) AS DuplicateCount
FROM master.Shipments_Master
GROUP BY Shipment_Number
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 6. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Sales_Order_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Sales_Order,

SUM(CASE WHEN Customer_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Customer,

SUM(CASE WHEN Dispatch_Date IS NULL THEN 1 ELSE 0 END) AS Missing_Dispatch_Date,

SUM(CASE WHEN Shipment_Status IS NULL THEN 1 ELSE 0 END) AS Missing_Status

FROM master.Shipments_Master;
GO

------------------------------------------------------------
-- 7. Invalid Numeric Values
------------------------------------------------------------
SELECT *
FROM master.Shipments_Master
WHERE Packages_Count < 0
   OR Gross_Weight_kg < 0
   OR Net_Weight_kg < 0
   OR Volume_m3 < 0
   OR Freight_Cost_USD < 0
   OR Insurance_Cost_USD < 0;
GO

------------------------------------------------------------
-- 8. Summary Statistics
------------------------------------------------------------
SELECT

MIN(Packages_Count) AS Min_Packages,
MAX(Packages_Count) AS Max_Packages,
AVG(Packages_Count) AS Avg_Packages,

MIN(Gross_Weight_kg) AS Min_Gross_Weight,
MAX(Gross_Weight_kg) AS Max_Gross_Weight,
AVG(Gross_Weight_kg) AS Avg_Gross_Weight,

MIN(Freight_Cost_USD) AS Min_Freight,
MAX(Freight_Cost_USD) AS Max_Freight,
AVG(Freight_Cost_USD) AS Avg_Freight

FROM master.Shipments_Master;
GO