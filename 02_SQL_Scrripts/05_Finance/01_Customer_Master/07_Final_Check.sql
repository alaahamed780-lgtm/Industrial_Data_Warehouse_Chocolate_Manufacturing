USE Chocolate_Manufacturing_DW;
GO

/*============================================================
07_Final_Check_Customer_Master.sql
============================================================*/

------------------------------------------------------------
-- 1. Compare Stage vs Master
------------------------------------------------------------
SELECT

(SELECT COUNT(*) FROM staging.Customer_Master_Stage) AS Stage_Count,

(SELECT COUNT(*) FROM master.Customer_Master) AS Master_Count,

(SELECT COUNT(*) FROM staging.Customer_Master_Stage)
-
(SELECT COUNT(*) FROM master.Customer_Master) AS Difference;
GO

------------------------------------------------------------
-- 2. Distinct Customer IDs
------------------------------------------------------------
SELECT
COUNT(DISTINCT Customer_ID) AS Distinct_Customers
FROM master.Customer_Master;
GO

------------------------------------------------------------
-- 3. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Customer_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Customer_ID,

SUM(CASE WHEN Customer_Name IS NULL THEN 1 ELSE 0 END) AS Missing_Customer_Name,

SUM(CASE WHEN Customer_Code IS NULL THEN 1 ELSE 0 END) AS Missing_Customer_Code,

SUM(CASE WHEN Country IS NULL THEN 1 ELSE 0 END) AS Missing_Country

FROM master.Customer_Master;
GO

------------------------------------------------------------
-- 4. Customer Statistics
------------------------------------------------------------
SELECT

MIN(Credit_Limit_USD) AS Min_Credit_Limit,
MAX(Credit_Limit_USD) AS Max_Credit_Limit,
AVG(Credit_Limit_USD) AS Avg_Credit_Limit,

MIN(Annual_Sales_Target_USD) AS Min_Target,
MAX(Annual_Sales_Target_USD) AS Max_Target,
AVG(Annual_Sales_Target_USD) AS Avg_Target,

MIN(Customer_Rating) AS Min_Rating,
MAX(Customer_Rating) AS Max_Rating,
AVG(Customer_Rating) AS Avg_Rating

FROM master.Customer_Master;
GO

------------------------------------------------------------
-- 5. Date Range
------------------------------------------------------------
SELECT

MIN(Registration_Date) AS First_Registration,

MAX(Registration_Date) AS Last_Registration,

MIN(Last_Order_Date) AS First_Order,

MAX(Last_Order_Date) AS Last_Order

FROM master.Customer_Master;
GO

------------------------------------------------------------
-- 6. Sample Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Customer_Master
ORDER BY Customer_ID;
GO