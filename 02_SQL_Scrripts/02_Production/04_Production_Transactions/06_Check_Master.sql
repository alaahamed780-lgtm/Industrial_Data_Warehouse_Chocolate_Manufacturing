USE Chocolate_Manufacturing_DW;
GO

/*============================================================
06_Check_Production_Transactions.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM master.Production_Transactions_Master;
GO

------------------------------------------------------------
-- 2. Preview Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Production_Transactions_Master
ORDER BY Production_Transaction_ID;
GO

------------------------------------------------------------
-- 3. Missing Primary Key
------------------------------------------------------------
SELECT COUNT(*) AS Missing_Transaction_ID
FROM master.Production_Transactions_Master
WHERE Production_Transaction_ID IS NULL;
GO

------------------------------------------------------------
-- 4. Duplicate Primary Key
------------------------------------------------------------
SELECT
    Production_Transaction_ID,
    COUNT(*) AS DuplicateCount
FROM master.Production_Transactions_Master
GROUP BY Production_Transaction_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 5. Missing Production_Order_ID
------------------------------------------------------------
SELECT COUNT(*) AS Missing_Production_Order_ID
FROM master.Production_Transactions_Master
WHERE Production_Order_ID IS NULL;
GO

------------------------------------------------------------
-- 6. Missing Product_ID
------------------------------------------------------------
SELECT COUNT(*) AS Missing_Product_ID
FROM master.Production_Transactions_Master
WHERE Product_ID IS NULL;
GO

------------------------------------------------------------
-- 7. Missing Equipment_ID
------------------------------------------------------------
SELECT COUNT(*) AS Missing_Equipment_ID
FROM master.Production_Transactions_Master
WHERE Equipment_ID IS NULL;
GO

------------------------------------------------------------
-- 8. Invalid Yield
------------------------------------------------------------
SELECT COUNT(*) AS Invalid_Yield
FROM master.Production_Transactions_Master
WHERE Yield_Percent < 0
   OR Yield_Percent > 100;
GO

------------------------------------------------------------
-- 9. Invalid Runtime
------------------------------------------------------------
SELECT COUNT(*) AS Invalid_Runtime
FROM master.Production_Transactions_Master
WHERE Runtime_Min < 0;
GO

------------------------------------------------------------
-- 10. Summary
------------------------------------------------------------
SELECT
    COUNT(*) AS TotalRows,
    MIN(Input_Raw_Material_kg) AS Min_Input,
    MAX(Input_Raw_Material_kg) AS Max_Input,
    AVG(Input_Raw_Material_kg) AS Avg_Input,

    MIN(Output_Finished_Goods_kg) AS Min_Output,
    MAX(Output_Finished_Goods_kg) AS Max_Output,
    AVG(Output_Finished_Goods_kg) AS Avg_Output,

    MIN(Cost_USD) AS Min_Cost,
    MAX(Cost_USD) AS Max_Cost,
    AVG(Cost_USD) AS Avg_Cost
FROM master.Production_Transactions_Master;
GO