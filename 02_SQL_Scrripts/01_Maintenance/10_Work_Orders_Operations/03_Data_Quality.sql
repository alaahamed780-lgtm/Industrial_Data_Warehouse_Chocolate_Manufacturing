USE Chocolate_Manufacturing_DW;
GO

/*=========================================================
1. Total Records
=========================================================*/
SELECT COUNT(*) AS TotalRows
FROM staging.Work_Order_Operations_Stage;
GO

/*=========================================================
2. Missing Primary Key
=========================================================*/
SELECT COUNT(*) AS Missing_Operation_ID
FROM staging.Work_Order_Operations_Stage
WHERE Operation_ID IS NULL
   OR LTRIM(RTRIM(Operation_ID))='';
GO

/*=========================================================
3. Duplicate Primary Key
=========================================================*/
SELECT
    Operation_ID,
    COUNT(*) AS DuplicateCount
FROM staging.Work_Order_Operations_Stage
GROUP BY Operation_ID
HAVING COUNT(*)>1;
GO

/*=========================================================
4. Missing Work Order ID
=========================================================*/
SELECT COUNT(*) AS Missing_Work_Order_ID
FROM staging.Work_Order_Operations_Stage
WHERE Work_Order_ID IS NULL
   OR LTRIM(RTRIM(Work_Order_ID))='';
GO

/*=========================================================
5. Invalid Operation Number
=========================================================*/
SELECT *
FROM staging.Work_Order_Operations_Stage
WHERE NULLIF(LTRIM(RTRIM(Operation_No)),'') IS NOT NULL
AND TRY_CONVERT(SMALLINT,Operation_No) IS NULL;
GO

/*=========================================================
6. Invalid Sequence
=========================================================*/
SELECT *
FROM staging.Work_Order_Operations_Stage
WHERE NULLIF(LTRIM(RTRIM([Sequence])),'') IS NOT NULL
AND TRY_CONVERT(SMALLINT,[Sequence]) IS NULL;
GO

/*=========================================================
7. Invalid Planned Start
=========================================================*/
SELECT *
FROM staging.Work_Order_Operations_Stage
WHERE NULLIF(LTRIM(RTRIM(Planned_Start)),'') IS NOT NULL
AND TRY_CONVERT(DATETIME2,Planned_Start) IS NULL;
GO

/*=========================================================
8. Invalid Actual Start
=========================================================*/
SELECT *
FROM staging.Work_Order_Operations_Stage
WHERE NULLIF(LTRIM(RTRIM(Actual_Start)),'') IS NOT NULL
AND TRY_CONVERT(DATETIME2,Actual_Start) IS NULL;
GO

/*=========================================================
9. Invalid Planned Finish
=========================================================*/
SELECT *
FROM staging.Work_Order_Operations_Stage
WHERE NULLIF(LTRIM(RTRIM(Planned_Finish)),'') IS NOT NULL
AND TRY_CONVERT(DATETIME2,Planned_Finish) IS NULL;
GO

/*=========================================================
10. Invalid Actual Finish
=========================================================*/
SELECT *
FROM staging.Work_Order_Operations_Stage
WHERE NULLIF(LTRIM(RTRIM(Actual_Finish)),'') IS NOT NULL
AND TRY_CONVERT(DATETIME2,Actual_Finish) IS NULL;
GO

/*=========================================================
11. Invalid Estimated Hours
=========================================================*/
SELECT *
FROM staging.Work_Order_Operations_Stage
WHERE NULLIF(LTRIM(RTRIM(Estimated_Hours)),'') IS NOT NULL
AND TRY_CONVERT(DECIMAL(10,2),Estimated_Hours) IS NULL;
GO

/*=========================================================
12. Invalid Actual Hours
=========================================================*/
SELECT *
FROM staging.Work_Order_Operations_Stage
WHERE NULLIF(LTRIM(RTRIM(Actual_Hours)),'') IS NOT NULL
AND TRY_CONVERT(DECIMAL(10,2),Actual_Hours) IS NULL;
GO

/*=========================================================
13. Invalid Operation Cost USD
=========================================================*/
SELECT *
FROM staging.Work_Order_Operations_Stage
WHERE NULLIF(LTRIM(RTRIM(Operation_Cost_USD)),'') IS NOT NULL
AND TRY_CONVERT(DECIMAL(18,2),Operation_Cost_USD) IS NULL;
GO

/*=========================================================
14. Invalid Labor Cost USD
=========================================================*/
SELECT *
FROM staging.Work_Order_Operations_Stage
WHERE NULLIF(LTRIM(RTRIM(Labor_Cost_USD)),'') IS NOT NULL
AND TRY_CONVERT(DECIMAL(18,2),Labor_Cost_USD) IS NULL;
GO

/*=========================================================
15. Invalid Material Cost USD
=========================================================*/
SELECT *
FROM staging.Work_Order_Operations_Stage
WHERE NULLIF(LTRIM(RTRIM(Material_Cost_USD)),'') IS NOT NULL
AND TRY_CONVERT(DECIMAL(18,2),Material_Cost_USD) IS NULL;
GO

/*=========================================================
16. Invalid Completion Percentage
=========================================================*/
SELECT *
FROM staging.Work_Order_Operations_Stage
WHERE NULLIF(LTRIM(RTRIM([Completion_%])),'') IS NOT NULL
AND TRY_CONVERT(SMALLINT,[Completion_%]) IS NULL;
GO