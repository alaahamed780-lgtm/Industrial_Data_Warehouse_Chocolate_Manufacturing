USE Chocolate_Manufacturing_DW;
GO

/*=========================================================
1. Total Records
=========================================================*/
SELECT COUNT(*) AS TotalRows
FROM master.Work_Order_Operations_Master;
GO

/*=========================================================
2. First 20 Records
=========================================================*/
SELECT TOP (20) *
FROM master.Work_Order_Operations_Master
ORDER BY Operation_ID;
GO

/*=========================================================
3. Last 20 Records
=========================================================*/
SELECT TOP (20) *
FROM master.Work_Order_Operations_Master
ORDER BY Operation_ID DESC;
GO

/*=========================================================
4. Data Types Check
=========================================================*/
SELECT
    SQL_VARIANT_PROPERTY(Operation_No,'BaseType') AS Operation_No_Type,
    SQL_VARIANT_PROPERTY(Sequence,'BaseType') AS Sequence_Type,
    SQL_VARIANT_PROPERTY(Estimated_Hours,'BaseType') AS Estimated_Hours_Type,
    SQL_VARIANT_PROPERTY(Actual_Hours,'BaseType') AS Actual_Hours_Type,
    SQL_VARIANT_PROPERTY(Completion_Percent,'BaseType') AS Completion_Percent_Type,
    SQL_VARIANT_PROPERTY(Operation_Cost_USD,'BaseType') AS Operation_Cost_Type,
    SQL_VARIANT_PROPERTY(Labor_Cost_USD,'BaseType') AS Labor_Cost_Type,
    SQL_VARIANT_PROPERTY(Material_Cost_USD,'BaseType') AS Material_Cost_Type
FROM master.Work_Order_Operations_Master;
GO

/*=========================================================
5. Missing Primary Key
=========================================================*/
SELECT COUNT(*) AS Missing_Operation_ID
FROM master.Work_Order_Operations_Master
WHERE Operation_ID IS NULL;
GO

/*=========================================================
6. Duplicate Primary Key
=========================================================*/
SELECT
    Operation_ID,
    COUNT(*) AS DuplicateCount
FROM master.Work_Order_Operations_Master
GROUP BY Operation_ID
HAVING COUNT(*) > 1;
GO

/*=========================================================
7. Null Work Order ID
=========================================================*/
SELECT COUNT(*) AS Missing_Work_Order_ID
FROM master.Work_Order_Operations_Master
WHERE Work_Order_ID IS NULL;
GO

/*=========================================================
8. Date Validation
=========================================================*/
SELECT
    COUNT(*) AS Invalid_Dates
FROM master.Work_Order_Operations_Master
WHERE Planned_Start > Planned_Finish
   OR Actual_Start > Actual_Finish;
GO

/*=========================================================
9. Hours Validation
=========================================================*/
SELECT
    COUNT(*) AS Negative_Hours
FROM master.Work_Order_Operations_Master
WHERE Estimated_Hours < 0
   OR Actual_Hours < 0;
GO

/*=========================================================
10. Cost Validation
=========================================================*/
SELECT
    COUNT(*) AS Negative_Costs
FROM master.Work_Order_Operations_Master
WHERE Operation_Cost_USD < 0
   OR Labor_Cost_USD < 0
   OR Material_Cost_USD < 0;
GO

/*=========================================================
11. Completion Percent Validation
=========================================================*/
SELECT
    COUNT(*) AS Invalid_Completion_Percent
FROM master.Work_Order_Operations_Master
WHERE Completion_Percent < 0
   OR Completion_Percent > 100;
GO