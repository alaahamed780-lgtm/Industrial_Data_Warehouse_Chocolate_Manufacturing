USE Chocolate_Manufacturing_DW;
GO

-------------------------------------------------------
-- Missing Equipment_ID
-------------------------------------------------------
SELECT COUNT(*) AS Missing_Equipment_ID
FROM staging.Work_Orders_Stage
WHERE Equipment_ID IS NULL
   OR LTRIM(RTRIM(Equipment_ID))='';
GO

-------------------------------------------------------
-- Missing Component_ID
-------------------------------------------------------
SELECT COUNT(*) AS Missing_Component_ID
FROM staging.Work_Orders_Stage
WHERE Component_ID IS NULL
   OR LTRIM(RTRIM(Component_ID))='';
GO

-------------------------------------------------------
-- Missing Failure_Code_ID
-------------------------------------------------------
SELECT COUNT(*) AS Missing_Failure_Code_ID
FROM staging.Work_Orders_Stage
WHERE Failure_Code_ID IS NULL
   OR LTRIM(RTRIM(Failure_Code_ID))='';
GO

-------------------------------------------------------
-- Invalid Estimated Labor Hours
-------------------------------------------------------
SELECT *
FROM staging.Work_Orders_Stage
WHERE TRY_CONVERT(DECIMAL(10,2),Estimated_Labor_Hours) IS NULL
AND Estimated_Labor_Hours IS NOT NULL
AND LTRIM(RTRIM(Estimated_Labor_Hours))<>'';
GO

-------------------------------------------------------
-- Invalid Actual Labor Hours
-------------------------------------------------------
SELECT *
FROM staging.Work_Orders_Stage
WHERE TRY_CONVERT(DECIMAL(10,2),Actual_Labor_Hours) IS NULL
AND Actual_Labor_Hours IS NOT NULL
AND LTRIM(RTRIM(Actual_Labor_Hours))<>'';
GO

-------------------------------------------------------
-- Invalid Estimated Material Cost
-------------------------------------------------------
SELECT *
FROM staging.Work_Orders_Stage
WHERE TRY_CONVERT(DECIMAL(18,2),Estimated_Material_Cost_USD) IS NULL
AND Estimated_Material_Cost_USD IS NOT NULL
AND LTRIM(RTRIM(Estimated_Material_Cost_USD))<>'';
GO

-------------------------------------------------------
-- Invalid Actual Material Cost
-------------------------------------------------------
SELECT *
FROM staging.Work_Orders_Stage
WHERE TRY_CONVERT(DECIMAL(18,2),Actual_Material_Cost_USD) IS NULL
AND Actual_Material_Cost_USD IS NOT NULL
AND LTRIM(RTRIM(Actual_Material_Cost_USD))<>'';
GO

-------------------------------------------------------
-- Invalid Estimated Total Cost
-------------------------------------------------------
SELECT *
FROM staging.Work_Orders_Stage
WHERE TRY_CONVERT(DECIMAL(18,2),Estimated_Total_Cost_USD) IS NULL
AND Estimated_Total_Cost_USD IS NOT NULL
AND LTRIM(RTRIM(Estimated_Total_Cost_USD))<>'';
GO

-------------------------------------------------------
-- Invalid Actual Total Cost
-------------------------------------------------------
SELECT *
FROM staging.Work_Orders_Stage
WHERE TRY_CONVERT(DECIMAL(18,2),Actual_Total_Cost_USD) IS NULL
AND Actual_Total_Cost_USD IS NOT NULL
AND LTRIM(RTRIM(Actual_Total_Cost_USD))<>'';
GO

-------------------------------------------------------
-- Invalid Downtime Hours
-------------------------------------------------------
SELECT *
FROM staging.Work_Orders_Stage
WHERE TRY_CONVERT(DECIMAL(10,2),Downtime_Hours) IS NULL
AND Downtime_Hours IS NOT NULL
AND LTRIM(RTRIM(Downtime_Hours))<>'';
GO