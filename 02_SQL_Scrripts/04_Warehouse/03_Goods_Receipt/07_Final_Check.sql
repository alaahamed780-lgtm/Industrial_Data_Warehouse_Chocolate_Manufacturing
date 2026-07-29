USE Chocolate_Manufacturing_DW;
GO

/*============================================================
07_Final_Check_Goods_Receipt.sql
============================================================*/

------------------------------------------------------------
-- 1. Compare Stage vs Master
------------------------------------------------------------
SELECT

(SELECT COUNT(*) 
 FROM staging.Goods_Receipt_Stage) AS Stage_Count,

(SELECT COUNT(*) 
 FROM master.Goods_Receipt_Master) AS Master_Count,

(SELECT COUNT(*) 
 FROM staging.Goods_Receipt_Stage)
-
(SELECT COUNT(*) 
 FROM master.Goods_Receipt_Master) AS Difference;

GO

------------------------------------------------------------
-- 2. Distinct Goods Receipts
------------------------------------------------------------
SELECT
COUNT(DISTINCT Goods_Receipt_ID) AS Distinct_GR
FROM master.Goods_Receipt_Master;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Goods_Receipt_ID IS NULL THEN 1 ELSE 0 END) AS Missing_GR_ID,

SUM(CASE WHEN Purchase_Order_ID IS NULL THEN 1 ELSE 0 END) AS Missing_PO_ID,

SUM(CASE WHEN Vendor_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Vendor

FROM master.Goods_Receipt_Master;
GO

------------------------------------------------------------
-- 4. Cost Statistics
------------------------------------------------------------
SELECT

MIN(Unit_Cost_USD) AS Min_Unit_Cost,
MAX(Unit_Cost_USD) AS Max_Unit_Cost,
AVG(Unit_Cost_USD) AS Avg_Unit_Cost,

MIN(Total_Cost_USD) AS Min_Total_Cost,
MAX(Total_Cost_USD) AS Max_Total_Cost,
AVG(Total_Cost_USD) AS Avg_Total_Cost

FROM master.Goods_Receipt_Master;
GO

------------------------------------------------------------
-- 5. Date Range
------------------------------------------------------------
SELECT

MIN(Receipt_Date) AS First_Receipt,
MAX(Receipt_Date) AS Last_Receipt

FROM master.Goods_Receipt_Master;
GO

------------------------------------------------------------
-- 6. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Goods_Receipt_Master
ORDER BY Goods_Receipt_ID;
GO