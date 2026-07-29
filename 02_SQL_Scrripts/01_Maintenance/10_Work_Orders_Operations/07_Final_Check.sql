USE Chocolate_Manufacturing_DW;
GO

/*=========================================================
1. Stage Count
=========================================================*/
SELECT COUNT(*) AS Stage_Count
FROM staging.Work_Order_Operations_Stage;
GO

/*=========================================================
2. Master Count
=========================================================*/
SELECT COUNT(*) AS Master_Count
FROM master.Work_Order_Operations_Master;
GO

/*=========================================================
3. Compare Counts
=========================================================*/
SELECT
(
    SELECT COUNT(*)
    FROM staging.Work_Order_Operations_Stage
) AS Stage_Count,

(
    SELECT COUNT(*)
    FROM master.Work_Order_Operations_Master
) AS Master_Count,

(
    SELECT COUNT(*)
    FROM staging.Work_Order_Operations_Stage
) -
(
    SELECT COUNT(*)
    FROM master.Work_Order_Operations_Master
) AS Difference;
GO

/*=========================================================
4. Distinct Operation_ID
=========================================================*/
SELECT
COUNT(DISTINCT Operation_ID) AS Distinct_Operation_IDs
FROM master.Work_Order_Operations_Master;
GO

/*=========================================================
5. Duplicate Check
=========================================================*/
SELECT
Operation_ID,
COUNT(*) AS DuplicateCount
FROM master.Work_Order_Operations_Master
GROUP BY Operation_ID
HAVING COUNT(*) > 1;
GO