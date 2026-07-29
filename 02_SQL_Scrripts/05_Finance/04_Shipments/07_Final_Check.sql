USE Chocolate_Manufacturing_DW;
GO

/*============================================================
07_Final_Check_Shipments.sql
============================================================*/

------------------------------------------------------------
-- 1. Compare Stage vs Master
------------------------------------------------------------
SELECT

(SELECT COUNT(*) FROM staging.Shipments_Stage) AS Stage_Count,

(SELECT COUNT(*) FROM master.Shipments_Master) AS Master_Count,

(SELECT COUNT(*) FROM staging.Shipments_Stage)
-
(SELECT COUNT(*) FROM master.Shipments_Master) AS Difference;
GO

------------------------------------------------------------
-- 2. Distinct Shipment IDs
------------------------------------------------------------
SELECT
COUNT(DISTINCT Shipment_ID) AS Distinct_Shipments
FROM master.Shipments_Master;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Shipment_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Shipment_ID,

SUM(CASE WHEN Sales_Order_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Sales_Order,

SUM(CASE WHEN Customer_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Customer,

SUM(CASE WHEN Dispatch_Date IS NULL THEN 1 ELSE 0 END) AS Missing_Dispatch_Date

FROM master.Shipments_Master;
GO

------------------------------------------------------------
-- 4. Shipment Statistics
------------------------------------------------------------
SELECT

MIN(Packages_Count) AS Min_Packages,
MAX(Packages_Count) AS Max_Packages,
AVG(Packages_Count) AS Avg_Packages,

MIN(Gross_Weight_kg) AS Min_Gross_Weight,
MAX(Gross_Weight_kg) AS Max_Gross_Weight,
AVG(Gross_Weight_kg) AS Avg_Gross_Weight,

MIN(Net_Weight_kg) AS Min_Net_Weight,
MAX(Net_Weight_kg) AS Max_Net_Weight,
AVG(Net_Weight_kg) AS Avg_Net_Weight,

MIN(Freight_Cost_USD) AS Min_Freight,
MAX(Freight_Cost_USD) AS Max_Freight,
AVG(Freight_Cost_USD) AS Avg_Freight

FROM master.Shipments_Master;
GO

------------------------------------------------------------
-- 5. Date Range
------------------------------------------------------------
SELECT

MIN(Dispatch_Date) AS First_Dispatch_Date,

MAX(Dispatch_Date) AS Last_Dispatch_Date,

MIN(Estimated_Arrival_Date) AS First_Estimated_Arrival,

MAX(Estimated_Arrival_Date) AS Last_Estimated_Arrival

FROM master.Shipments_Master;
GO

------------------------------------------------------------
-- 6. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Shipments_Master
ORDER BY Shipment_ID;
GO