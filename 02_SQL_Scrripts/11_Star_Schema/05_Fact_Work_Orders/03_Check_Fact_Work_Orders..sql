USE Chocolate_Manufacturing_DW;
GO

------------------------------------------------------------
-- Total Rows
------------------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM dw.Fact_Work_Orders;
GO

------------------------------------------------------------
-- Preview Data
------------------------------------------------------------
SELECT TOP (10) *
FROM dw.Fact_Work_Orders;
GO

------------------------------------------------------------
-- Duplicate Work Orders
------------------------------------------------------------
SELECT
    Work_Order_ID,
    COUNT(*) AS DuplicateCount
FROM dw.Fact_Work_Orders
GROUP BY Work_Order_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- Missing Date Dimension
------------------------------------------------------------
SELECT COUNT(*) AS Missing_Date_Key
FROM dw.Fact_Work_Orders
WHERE Date_Key IS NULL;
GO

------------------------------------------------------------
-- Missing Equipment Dimension
------------------------------------------------------------
SELECT COUNT(*) AS Missing_Equipment_Key
FROM dw.Fact_Work_Orders
WHERE Equipment_Key IS NULL;
GO

------------------------------------------------------------
-- Missing Employee Dimension
------------------------------------------------------------
SELECT COUNT(*) AS Missing_Employee_Key
FROM dw.Fact_Work_Orders
WHERE Employee_Key IS NULL;
GO

------------------------------------------------------------
-- Total Downtime
------------------------------------------------------------
SELECT
    SUM(Downtime_Hours) AS Total_Downtime_Hours
FROM dw.Fact_Work_Orders;
GO

------------------------------------------------------------
-- Total Actual Labor Hours
------------------------------------------------------------
SELECT
    SUM(Actual_Labor_Hours) AS Total_Actual_Labor_Hours
FROM dw.Fact_Work_Orders;
GO

------------------------------------------------------------
-- Total Actual Maintenance Cost
------------------------------------------------------------
SELECT
    SUM(Actual_Total_Cost_USD) AS Total_Maintenance_Cost
FROM dw.Fact_Work_Orders;
GO

PRINT 'Fact_Work_Orders Check Completed Successfully';
GO