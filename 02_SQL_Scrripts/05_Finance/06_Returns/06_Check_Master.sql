USE Chocolate_Manufacturing_DW;
GO

/*============================================================
06_Check_Returns_Master.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM master.Returns_Master;
GO

------------------------------------------------------------
-- 2. Preview Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Returns_Master
ORDER BY Return_ID;
GO

------------------------------------------------------------
-- 3. Missing Primary Key
------------------------------------------------------------
SELECT COUNT(*) AS Missing_Return_ID
FROM master.Returns_Master
WHERE Return_ID IS NULL;
GO

------------------------------------------------------------
-- 4. Duplicate Return IDs
------------------------------------------------------------
SELECT
    Return_ID,
    COUNT(*) AS DuplicateCount
FROM master.Returns_Master
GROUP BY Return_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 5. Duplicate Return Numbers
------------------------------------------------------------
SELECT
    Return_Number,
    COUNT(*) AS DuplicateCount
FROM master.Returns_Master
GROUP BY Return_Number
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 6. Missing Critical Fields
------------------------------------------------------------
SELECT

SUM(CASE WHEN Sales_Order_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Sales_Order,

SUM(CASE WHEN Delivery_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Delivery,

SUM(CASE WHEN Customer_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Customer,

SUM(CASE WHEN Return_Date IS NULL THEN 1 ELSE 0 END) AS Missing_Return_Date

FROM master.Returns_Master;
GO

------------------------------------------------------------
-- 7. Invalid Numeric Values
------------------------------------------------------------
SELECT *
FROM master.Returns_Master
WHERE Returned_Qty < 0
   OR Accepted_Qty < 0
   OR Rejected_Qty < 0
   OR Return_Cost_USD < 0
   OR Recovery_Value_USD < 0;
GO

------------------------------------------------------------
-- 8. Summary Statistics
------------------------------------------------------------
SELECT

MIN(Returned_Qty) AS Min_Returned_Qty,
MAX(Returned_Qty) AS Max_Returned_Qty,
AVG(Returned_Qty) AS Avg_Returned_Qty,

MIN(Return_Cost_USD) AS Min_Return_Cost,
MAX(Return_Cost_USD) AS Max_Return_Cost,
AVG(Return_Cost_USD) AS Avg_Return_Cost,

MIN(Recovery_Value_USD) AS Min_Recovery_Value,
MAX(Recovery_Value_USD) AS Max_Recovery_Value,
AVG(Recovery_Value_USD) AS Avg_Recovery_Value

FROM master.Returns_Master;
GO