USE Chocolate_Manufacturing_DW;
GO

/*============================================================
03_Data_Quality_Production_Transactions.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM staging.Production_Transactions_Stage;
GO

------------------------------------------------------------
-- 2. Duplicate Transaction_ID
------------------------------------------------------------
SELECT
    Production_Transaction_ID,
    COUNT(*) AS DuplicateCount
FROM staging.Production_Transactions_Stage
GROUP BY Production_Transaction_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 3. Missing Transaction_ID
------------------------------------------------------------
SELECT *
FROM staging.Production_Transactions_Stage
WHERE Production_Transaction_ID IS NULL
   OR LTRIM(RTRIM(Production_Transaction_ID))='';
GO

------------------------------------------------------------
-- 4. Missing Production_Order_ID
------------------------------------------------------------
SELECT *
FROM staging.Production_Transactions_Stage
WHERE Production_Order_ID IS NULL
   OR LTRIM(RTRIM(Production_Order_ID))='';
GO

------------------------------------------------------------
-- 5. Missing Product_ID
------------------------------------------------------------
SELECT *
FROM staging.Production_Transactions_Stage
WHERE Product_ID IS NULL
   OR LTRIM(RTRIM(Product_ID))='';
GO

------------------------------------------------------------
-- 6. Missing Equipment_ID
------------------------------------------------------------
SELECT *
FROM staging.Production_Transactions_Stage
WHERE Equipment_ID IS NULL
   OR LTRIM(RTRIM(Equipment_ID))='';
GO

------------------------------------------------------------
-- 7. Invalid Input Material
------------------------------------------------------------
SELECT *
FROM staging.Production_Transactions_Stage
WHERE TRY_CONVERT(DECIMAL(18,2),Input_Raw_Material_kg) IS NULL
AND NULLIF(LTRIM(RTRIM(Input_Raw_Material_kg)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 8. Invalid Output Material
------------------------------------------------------------
SELECT *
FROM staging.Production_Transactions_Stage
WHERE TRY_CONVERT(DECIMAL(18,2),Output_Finished_Goods_kg) IS NULL
AND NULLIF(LTRIM(RTRIM(Output_Finished_Goods_kg)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 9. Invalid Scrap
------------------------------------------------------------
SELECT *
FROM staging.Production_Transactions_Stage
WHERE TRY_CONVERT(DECIMAL(18,2),Scrap_kg) IS NULL
AND NULLIF(LTRIM(RTRIM(Scrap_kg)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 10. Invalid Yield
------------------------------------------------------------
SELECT *
FROM staging.Production_Transactions_Stage
WHERE TRY_CONVERT(DECIMAL(5,2),Yield_Percent) NOT BETWEEN 0 AND 100;
GO

------------------------------------------------------------
-- 11. Invalid Runtime
------------------------------------------------------------
SELECT *
FROM staging.Production_Transactions_Stage
WHERE TRY_CONVERT(INT,Runtime_Min) IS NULL
AND NULLIF(LTRIM(RTRIM(Runtime_Min)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 12. Invalid Energy
------------------------------------------------------------
SELECT *
FROM staging.Production_Transactions_Stage
WHERE TRY_CONVERT(DECIMAL(18,2),Energy_kWh) IS NULL
AND NULLIF(LTRIM(RTRIM(Energy_kWh)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 13. Invalid Cost
------------------------------------------------------------
SELECT *
FROM staging.Production_Transactions_Stage
WHERE TRY_CONVERT(DECIMAL(18,2),Cost_USD) IS NULL
AND NULLIF(LTRIM(RTRIM(Cost_USD)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 14. Invalid Transaction Date
------------------------------------------------------------
SELECT *
FROM staging.Production_Transactions_Stage
WHERE TRY_CONVERT(DATE,Transaction_Date) IS NULL
AND NULLIF(LTRIM(RTRIM(Transaction_Date)),'') IS NOT NULL;
GO

------------------------------------------------------------
-- 15. Summary
------------------------------------------------------------
SELECT

COUNT(*) AS TotalRows,

COUNT(DISTINCT Production_Transaction_ID) AS Total_Transactions,

MIN(TRY_CONVERT(decimal(18,2),Input_Raw_Material_kg)) AS Min_Input,

MAX(TRY_CONVERT(decimal(18,2),Input_Raw_Material_kg)) AS Max_Input,

AVG(TRY_CONVERT(decimal(18,2),Input_Raw_Material_kg)) AS Avg_Input,

MIN(TRY_CONVERT(decimal(18,2),Output_Finished_Goods_kg)) AS Min_Output,

MAX(TRY_CONVERT(decimal(18,2),Output_Finished_Goods_kg)) AS Max_Output,

AVG(TRY_CONVERT(decimal(18,2),Output_Finished_Goods_kg)) AS Avg_Output,

AVG(TRY_CONVERT(decimal(18,2),Cost_USD)) AS Avg_Cost

FROM staging.Production_Transactions_Stage;
GO