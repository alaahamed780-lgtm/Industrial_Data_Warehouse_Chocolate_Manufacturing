USE Chocolate_Manufacturing_DW;
GO

/*==============================================================
1. Stage Count
==============================================================*/
SELECT COUNT(*) AS Stage_Count
FROM staging.Work_Order_Materials_Stage;
GO

/*==============================================================
2. Master Count
==============================================================*/
SELECT COUNT(*) AS Master_Count
FROM master.Work_Order_Materials_Master;
GO

/*==============================================================
3. Compare Stage vs Master
==============================================================*/
SELECT
    (SELECT COUNT(*) FROM staging.Work_Order_Materials_Stage) AS Stage_Count,
    (SELECT COUNT(*) FROM master.Work_Order_Materials_Master) AS Master_Count,
    (
        (SELECT COUNT(*) FROM staging.Work_Order_Materials_Stage)
        -
        (SELECT COUNT(*) FROM master.Work_Order_Materials_Master)
    ) AS Difference;
GO

/*==============================================================
4. Distinct Material Transactions
==============================================================*/
SELECT
    COUNT(DISTINCT Material_Transaction_ID) AS Distinct_Transactions
FROM master.Work_Order_Materials_Master;
GO

/*==============================================================
5. Duplicate Material Transactions
==============================================================*/
SELECT
    Material_Transaction_ID,
    COUNT(*) AS DuplicateCount
FROM master.Work_Order_Materials_Master
GROUP BY Material_Transaction_ID
HAVING COUNT(*) > 1;
GO

/*==============================================================
6. Missing Foreign Keys
==============================================================*/
SELECT
    SUM(CASE WHEN Work_Order_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Work_Order_ID,
    SUM(CASE WHEN Operation_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Operation_ID,
    SUM(CASE WHEN Spare_Part_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Spare_Part_ID
FROM master.Work_Order_Materials_Master;
GO

/*==============================================================
7. Cost Summary
==============================================================*/
SELECT
    SUM(Unit_Cost_USD) AS Total_Unit_Cost,
    SUM(Extended_Cost_USD) AS Total_Extended_Cost,
    AVG(Unit_Cost_USD) AS Avg_Unit_Cost
FROM master.Work_Order_Materials_Master;
GO