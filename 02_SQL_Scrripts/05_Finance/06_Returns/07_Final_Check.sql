USE Chocolate_Manufacturing_DW;
GO

/*============================================================
07_Final_Check_Returns.sql
============================================================*/

------------------------------------------------------------
-- 1. Compare Stage vs Master
------------------------------------------------------------
SELECT

(SELECT COUNT(*) FROM staging.Returns_Stage) AS Stage_Count,

(SELECT COUNT(*) FROM master.Returns_Master) AS Master_Count,

(SELECT COUNT(*) FROM staging.Returns_Stage)
-
(SELECT COUNT(*) FROM master.Returns_Master) AS Difference;
GO

------------------------------------------------------------
-- 2. Distinct Return IDs
------------------------------------------------------------
SELECT
COUNT(DISTINCT Return_ID) AS Distinct_Returns
FROM master.Returns_Master;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Return_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Return_ID,

SUM(CASE WHEN Sales_Order_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Sales_Order,

SUM(CASE WHEN Delivery_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Delivery,

SUM(CASE WHEN Customer_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Customer

FROM master.Returns_Master;
GO

------------------------------------------------------------
-- 4. Return Statistics
------------------------------------------------------------
SELECT

MIN(Returned_Qty) AS Min_Returned_Qty,
MAX(Returned_Qty) AS Max_Returned_Qty,
AVG(Returned_Qty) AS Avg_Returned_Qty,

MIN(Accepted_Qty) AS Min_Accepted_Qty,
MAX(Accepted_Qty) AS Max_Accepted_Qty,
AVG(Accepted_Qty) AS Avg_Accepted_Qty,

MIN(Rejected_Qty) AS Min_Rejected_Qty,
MAX(Rejected_Qty) AS Max_Rejected_Qty,
AVG(Rejected_Qty) AS Avg_Rejected_Qty,

MIN(Return_Cost_USD) AS Min_Return_Cost,
MAX(Return_Cost_USD) AS Max_Return_Cost,
AVG(Return_Cost_USD) AS Avg_Return_Cost

FROM master.Returns_Master;
GO

------------------------------------------------------------
-- 5. Date Range
------------------------------------------------------------
SELECT

MIN(Return_Date) AS First_Return_Date,

MAX(Return_Date) AS Last_Return_Date,

MIN(Return_DateTime) AS First_Return_DateTime,

MAX(Return_DateTime) AS Last_Return_DateTime

FROM master.Returns_Master;
GO

------------------------------------------------------------
-- 6. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Returns_Master
ORDER BY Return_ID;
GO