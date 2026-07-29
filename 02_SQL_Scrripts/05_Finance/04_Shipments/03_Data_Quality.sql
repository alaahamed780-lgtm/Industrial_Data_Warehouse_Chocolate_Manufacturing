USE Chocolate_Manufacturing_DW;
GO

/*============================================================
03_Data_Quality_Shipments.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS Stage_Count
FROM staging.Shipments_Stage;
GO

------------------------------------------------------------
-- 2. Duplicate Shipment IDs
------------------------------------------------------------
SELECT
    Shipment_ID,
    COUNT(*) AS DuplicateCount
FROM staging.Shipments_Stage
GROUP BY Shipment_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Shipment_ID IS NULL
          OR LTRIM(RTRIM(Shipment_ID))='' THEN 1 ELSE 0 END) AS Missing_Shipment_ID,

SUM(CASE WHEN Shipment_Number IS NULL
          OR LTRIM(RTRIM(Shipment_Number))='' THEN 1 ELSE 0 END) AS Missing_Shipment_Number,

SUM(CASE WHEN Sales_Order_ID IS NULL
          OR LTRIM(RTRIM(Sales_Order_ID))='' THEN 1 ELSE 0 END) AS Missing_Sales_Order,

SUM(CASE WHEN Dispatch_Date IS NULL
          OR LTRIM(RTRIM(Dispatch_Date))='' THEN 1 ELSE 0 END) AS Missing_Dispatch_Date

FROM staging.Shipments_Stage;
GO

------------------------------------------------------------
-- 4. Invalid Dates
------------------------------------------------------------
SELECT *
FROM staging.Shipments_Stage
WHERE

(TRY_CONVERT(DATE, Dispatch_Date) IS NULL
 AND NULLIF(LTRIM(RTRIM(Dispatch_Date)), '') IS NOT NULL)

OR

(TRY_CONVERT(DATE, Estimated_Arrival_Date) IS NULL
 AND NULLIF(LTRIM(RTRIM(Estimated_Arrival_Date)), '') IS NOT NULL)

OR

(TRY_CONVERT(DATE, Actual_Arrival_Date) IS NULL
 AND NULLIF(LTRIM(RTRIM(Actual_Arrival_Date)), '') IS NOT NULL);
GO

------------------------------------------------------------
-- 5. Invalid Numeric Values
------------------------------------------------------------
SELECT *
FROM staging.Shipments_Stage
WHERE

(TRY_CONVERT(INT, Packages_Count) IS NULL
 AND NULLIF(LTRIM(RTRIM(Packages_Count)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(18,2), Gross_Weight_kg) IS NULL
 AND NULLIF(LTRIM(RTRIM(Gross_Weight_kg)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(18,2), Net_Weight_kg) IS NULL
 AND NULLIF(LTRIM(RTRIM(Net_Weight_kg)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(18,2), Volume_m3) IS NULL
 AND NULLIF(LTRIM(RTRIM(Volume_m3)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(18,2), Freight_Cost_USD) IS NULL
 AND NULLIF(LTRIM(RTRIM(Freight_Cost_USD)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(18,2), Insurance_Cost_USD) IS NULL
 AND NULLIF(LTRIM(RTRIM(Insurance_Cost_USD)), '') IS NOT NULL);
GO

------------------------------------------------------------
-- 6. Summary Statistics
------------------------------------------------------------
SELECT

MIN(TRY_CONVERT(INT, Packages_Count)) AS Min_Packages,
MAX(TRY_CONVERT(INT, Packages_Count)) AS Max_Packages,
AVG(TRY_CONVERT(FLOAT, Packages_Count)) AS Avg_Packages,

MIN(TRY_CONVERT(DECIMAL(18,2), Gross_Weight_kg)) AS Min_Gross_Weight,
MAX(TRY_CONVERT(DECIMAL(18,2), Gross_Weight_kg)) AS Max_Gross_Weight,
AVG(TRY_CONVERT(DECIMAL(18,2), Gross_Weight_kg)) AS Avg_Gross_Weight,

MIN(TRY_CONVERT(DECIMAL(18,2), Freight_Cost_USD)) AS Min_Freight,
MAX(TRY_CONVERT(DECIMAL(18,2), Freight_Cost_USD)) AS Max_Freight,
AVG(TRY_CONVERT(DECIMAL(18,2), Freight_Cost_USD)) AS Avg_Freight

FROM staging.Shipments_Stage;
GO

------------------------------------------------------------
-- 7. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM staging.Shipments_Stage
ORDER BY Shipment_ID;
GO