USE Chocolate_Manufacturing_DW;
GO

-------------------------------------------------------
-- 1. Total Records
-------------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM staging.Work_Orders_Stage;
GO

-------------------------------------------------------
-- 2. First 20 Records
-------------------------------------------------------
SELECT TOP (20) *
FROM staging.Work_Orders_Stage;
GO

-------------------------------------------------------
-- 3. Last 20 Records
-------------------------------------------------------
SELECT TOP (20) *
FROM staging.Work_Orders_Stage
ORDER BY Work_Order_ID DESC;
GO

-------------------------------------------------------
-- 4. Missing Primary Key
-------------------------------------------------------
SELECT COUNT(*) AS Missing_Work_Order_ID
FROM staging.Work_Orders_Stage
WHERE Work_Order_ID IS NULL
   OR LTRIM(RTRIM(Work_Order_ID))='';
GO

-------------------------------------------------------
-- 5. Duplicate Primary Key
-------------------------------------------------------
SELECT Work_Order_ID,
       COUNT(*) AS DuplicateCount
FROM staging.Work_Orders_Stage
GROUP BY Work_Order_ID
HAVING COUNT(*) > 1;
GO