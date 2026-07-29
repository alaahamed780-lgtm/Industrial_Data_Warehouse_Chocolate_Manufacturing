USE Chocolate_Manufacturing_DW;
GO

/*============================================================
03_Data_Quality_Deliveries.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS Stage_Count
FROM staging.Deliveries_Stage;
GO

------------------------------------------------------------
-- 2. Duplicate Delivery IDs
------------------------------------------------------------
SELECT
    Delivery_ID,
    COUNT(*) AS DuplicateCount
FROM staging.Deliveries_Stage
GROUP BY Delivery_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Delivery_ID IS NULL
          OR LTRIM(RTRIM(Delivery_ID))='' THEN 1 ELSE 0 END) AS Missing_Delivery_ID,

SUM(CASE WHEN Shipment_ID IS NULL
          OR LTRIM(RTRIM(Shipment_ID))='' THEN 1 ELSE 0 END) AS Missing_Shipment_ID,

SUM(CASE WHEN Customer_ID IS NULL
          OR LTRIM(RTRIM(Customer_ID))='' THEN 1 ELSE 0 END) AS Missing_Customer_ID,

SUM(CASE WHEN Delivery_Date IS NULL
          OR LTRIM(RTRIM(Delivery_Date))='' THEN 1 ELSE 0 END) AS Missing_Delivery_Date

FROM staging.Deliveries_Stage;
GO

------------------------------------------------------------
-- 4. Invalid Dates
------------------------------------------------------------
SELECT *
FROM staging.Deliveries_Stage
WHERE

(TRY_CONVERT(DATE, Delivery_Date) IS NULL
 AND NULLIF(LTRIM(RTRIM(Delivery_Date)), '') IS NOT NULL)

OR

(TRY_CONVERT(DATETIME, Delivery_DateTime) IS NULL
 AND NULLIF(LTRIM(RTRIM(Delivery_DateTime)), '') IS NOT NULL);
GO

------------------------------------------------------------
-- 5. Invalid Numeric Values
------------------------------------------------------------
SELECT *
FROM staging.Deliveries_Stage
WHERE

(TRY_CONVERT(INT, Delivery_Time_Min) IS NULL
 AND NULLIF(LTRIM(RTRIM(Delivery_Time_Min)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(18,2), Delivered_Qty) IS NULL
 AND NULLIF(LTRIM(RTRIM(Delivered_Qty)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(18,2), Rejected_Qty) IS NULL
 AND NULLIF(LTRIM(RTRIM(Rejected_Qty)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(18,2), Return_Qty) IS NULL
 AND NULLIF(LTRIM(RTRIM(Return_Qty)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(18,2), Freight_Cost_USD) IS NULL
 AND NULLIF(LTRIM(RTRIM(Freight_Cost_USD)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(18,2), Delivery_Cost_USD) IS NULL
 AND NULLIF(LTRIM(RTRIM(Delivery_Cost_USD)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(10,6), GPS_Latitude) IS NULL
 AND NULLIF(LTRIM(RTRIM(GPS_Latitude)), '') IS NOT NULL)

OR

(TRY_CONVERT(DECIMAL(10,6), GPS_Longitude) IS NULL
 AND NULLIF(LTRIM(RTRIM(GPS_Longitude)), '') IS NOT NULL);
GO

------------------------------------------------------------
-- 6. Summary Statistics
------------------------------------------------------------
SELECT

MIN(TRY_CONVERT(DECIMAL(18,2), Delivered_Qty)) AS Min_Delivered_Qty,
MAX(TRY_CONVERT(DECIMAL(18,2), Delivered_Qty)) AS Max_Delivered_Qty,
AVG(TRY_CONVERT(DECIMAL(18,2), Delivered_Qty)) AS Avg_Delivered_Qty,

MIN(TRY_CONVERT(DECIMAL(18,2), Delivery_Cost_USD)) AS Min_Delivery_Cost,
MAX(TRY_CONVERT(DECIMAL(18,2), Delivery_Cost_USD)) AS Max_Delivery_Cost,
AVG(TRY_CONVERT(DECIMAL(18,2), Delivery_Cost_USD)) AS Avg_Delivery_Cost,

MIN(TRY_CONVERT(INT, Delivery_Time_Min)) AS Min_Delivery_Time,
MAX(TRY_CONVERT(INT, Delivery_Time_Min)) AS Max_Delivery_Time,
AVG(TRY_CONVERT(FLOAT, Delivery_Time_Min)) AS Avg_Delivery_Time

FROM staging.Deliveries_Stage;
GO

------------------------------------------------------------
-- 7. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM staging.Deliveries_Stage
ORDER BY Delivery_ID;
GO