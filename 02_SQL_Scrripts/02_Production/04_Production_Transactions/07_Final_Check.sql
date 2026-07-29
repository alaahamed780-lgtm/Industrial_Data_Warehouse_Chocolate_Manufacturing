USE Chocolate_Manufacturing_DW;
GO

/*============================================================
07_Final_Check_Production_Transactions.sql
============================================================*/

SELECT COUNT(*) AS Stage_Count
FROM staging.Production_Transactions_Stage;
GO

SELECT COUNT(*) AS Master_Count
FROM master.Production_Transactions_Master;
GO

SELECT
    (SELECT COUNT(*) FROM staging.Production_Transactions_Stage) AS Stage_Count,
    (SELECT COUNT(*) FROM master.Production_Transactions_Master) AS Master_Count,
    (SELECT COUNT(*) FROM staging.Production_Transactions_Stage)
    -
    (SELECT COUNT(*) FROM master.Production_Transactions_Master) AS Difference;
GO

SELECT
    COUNT(DISTINCT Production_Transaction_ID) AS Distinct_Transactions
FROM master.Production_Transactions_Master;
GO

SELECT
    Production_Transaction_ID,
    COUNT(*) AS DuplicateCount
FROM master.Production_Transactions_Master
GROUP BY Production_Transaction_ID
HAVING COUNT(*) > 1;
GO

SELECT
    SUM(CASE WHEN Production_Order_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Production_Order,
    SUM(CASE WHEN Product_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Product,
    SUM(CASE WHEN Equipment_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Equipment
FROM master.Production_Transactions_Master;
GO

SELECT
    AVG(Yield_Percent) AS Avg_Yield,
    AVG(Runtime_Min) AS Avg_Runtime,
    AVG(Energy_kWh) AS Avg_Energy,
    AVG(Cost_USD) AS Avg_Cost
FROM master.Production_Transactions_Master;
GO

SELECT TOP (20) *
FROM master.Production_Transactions_Master
ORDER BY Production_Transaction_ID;
GO