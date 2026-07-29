USE Chocolate_Manufacturing_DW;
GO

/*============================================================
07_Final_Check_Purchase_Orders.sql
============================================================*/

------------------------------------------------------------
-- 1. Compare Stage vs Master
------------------------------------------------------------
SELECT
    (SELECT COUNT(*) FROM staging.Purchase_Orders_Stage) AS Stage_Count,
    (SELECT COUNT(*) FROM master.Purchase_Orders_Master) AS Master_Count,
    (SELECT COUNT(*) FROM staging.Purchase_Orders_Stage)
    -
    (SELECT COUNT(*) FROM master.Purchase_Orders_Master) AS Difference;
GO

------------------------------------------------------------
-- 2. Distinct Purchase Orders
------------------------------------------------------------
SELECT
COUNT(DISTINCT Purchase_Order_ID) AS Distinct_POs
FROM master.Purchase_Orders_Master;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT
SUM(CASE WHEN Purchase_Order_ID IS NULL THEN 1 ELSE 0 END) AS Missing_PO_ID,
SUM(CASE WHEN Vendor_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Vendor,
SUM(CASE WHEN Buyer_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Buyer,
SUM(CASE WHEN Product_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Product
FROM master.Purchase_Orders_Master;
GO

------------------------------------------------------------
-- 4. Amount Statistics
------------------------------------------------------------
SELECT
MIN(Unit_Price_USD) AS Min_Price,
MAX(Unit_Price_USD) AS Max_Price,
AVG(Unit_Price_USD) AS Avg_Price,

MIN(Total_Amount_USD) AS Min_Total,
MAX(Total_Amount_USD) AS Max_Total,
AVG(Total_Amount_USD) AS Avg_Total
FROM master.Purchase_Orders_Master;
GO

------------------------------------------------------------
-- 5. Date Summary
------------------------------------------------------------
SELECT
MIN(PO_Date) AS First_PO,
MAX(PO_Date) AS Last_PO,
MIN(Delivery_Date) AS First_Delivery,
MAX(Delivery_Date) AS Last_Delivery
FROM master.Purchase_Orders_Master;
GO

------------------------------------------------------------
-- 6. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Purchase_Orders_Master
ORDER BY Purchase_Order_ID;
GO