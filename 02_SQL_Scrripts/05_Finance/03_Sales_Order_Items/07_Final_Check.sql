USE Chocolate_Manufacturing_DW;
GO

/*============================================================
07_Final_Check_Sales_Order_Items.sql
============================================================*/

------------------------------------------------------------
-- 1. Compare Stage vs Master
------------------------------------------------------------
SELECT

(SELECT COUNT(*) FROM staging.Sales_Order_Items_Stage) AS Stage_Count,

(SELECT COUNT(*) FROM master.Sales_Order_Items_Master) AS Master_Count,

(SELECT COUNT(*) FROM staging.Sales_Order_Items_Stage)
-
(SELECT COUNT(*) FROM master.Sales_Order_Items_Master) AS Difference;
GO

------------------------------------------------------------
-- 2. Distinct Item IDs
------------------------------------------------------------
SELECT
COUNT(DISTINCT Sales_Order_Item_ID) AS Distinct_Items
FROM master.Sales_Order_Items_Master;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Sales_Order_Item_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Item_ID,

SUM(CASE WHEN Sales_Order_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Order_ID,

SUM(CASE WHEN Product_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Product,

SUM(CASE WHEN Ordered_Qty IS NULL THEN 1 ELSE 0 END) AS Missing_Ordered_Qty

FROM master.Sales_Order_Items_Master;
GO

------------------------------------------------------------
-- 4. Financial Statistics
------------------------------------------------------------
SELECT

MIN(Unit_Price_USD) AS Min_Unit_Price,
MAX(Unit_Price_USD) AS Max_Unit_Price,
AVG(Unit_Price_USD) AS Avg_Unit_Price,

MIN(Discount_USD) AS Min_Discount,
MAX(Discount_USD) AS Max_Discount,
AVG(Discount_USD) AS Avg_Discount,

MIN(Tax_USD) AS Min_Tax,
MAX(Tax_USD) AS Max_Tax,
AVG(Tax_USD) AS Avg_Tax,

MIN(Net_Amount_USD) AS Min_Net_Amount,
MAX(Net_Amount_USD) AS Max_Net_Amount,
AVG(Net_Amount_USD) AS Avg_Net_Amount

FROM master.Sales_Order_Items_Master;
GO

------------------------------------------------------------
-- 5. Date Range
------------------------------------------------------------
SELECT

MIN(Requested_Date) AS First_Requested_Date,

MAX(Requested_Date) AS Last_Requested_Date,

MIN(Delivery_Date) AS First_Delivery_Date,

MAX(Delivery_Date) AS Last_Delivery_Date

FROM master.Sales_Order_Items_Master;
GO

------------------------------------------------------------
-- 6. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Sales_Order_Items_Master
ORDER BY Sales_Order_Item_ID;
GO