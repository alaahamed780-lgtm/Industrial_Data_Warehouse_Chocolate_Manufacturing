USE Chocolate_Manufacturing_DW;
GO

/*==============================================================
1. Total Records
==============================================================*/
SELECT COUNT(*) AS TotalRows
FROM staging.Work_Order_Materials_Stage;
GO

/*==============================================================
2. Missing Material_Transaction_ID
==============================================================*/
SELECT COUNT(*) AS Missing_Material_Transaction_ID
FROM staging.Work_Order_Materials_Stage
WHERE NULLIF(LTRIM(RTRIM(Material_Transaction_ID)),'') IS NULL;
GO

/*==============================================================
3. Duplicate Material_Transaction_ID
==============================================================*/
SELECT
    Material_Transaction_ID,
    COUNT(*) AS DuplicateCount
FROM staging.Work_Order_Materials_Stage
GROUP BY Material_Transaction_ID
HAVING COUNT(*) > 1;
GO

/*==============================================================
4. Missing Work_Order_ID
==============================================================*/
SELECT COUNT(*) AS Missing_Work_Order_ID
FROM staging.Work_Order_Materials_Stage
WHERE NULLIF(LTRIM(RTRIM(Work_Order_ID)),'') IS NULL;
GO

/*==============================================================
5. Missing Operation_ID
==============================================================*/
SELECT COUNT(*) AS Missing_Operation_ID
FROM staging.Work_Order_Materials_Stage
WHERE NULLIF(LTRIM(RTRIM(Operation_ID)),'') IS NULL;
GO

/*==============================================================
6. Invalid Issue_Date
==============================================================*/
SELECT *
FROM staging.Work_Order_Materials_Stage
WHERE NULLIF(LTRIM(RTRIM(Issue_Date)),'') IS NOT NULL
AND TRY_CONVERT(DATETIME2, Issue_Date) IS NULL;
GO

/*==============================================================
7. Invalid Requested_Qty
==============================================================*/
SELECT *
FROM staging.Work_Order_Materials_Stage
WHERE NULLIF(LTRIM(RTRIM(Requested_Qty)),'') IS NOT NULL
AND TRY_CONVERT(DECIMAL(18,2), Requested_Qty) IS NULL;
GO

/*==============================================================
8. Invalid Issued_Qty
==============================================================*/
SELECT *
FROM staging.Work_Order_Materials_Stage
WHERE NULLIF(LTRIM(RTRIM(Issued_Qty)),'') IS NOT NULL
AND TRY_CONVERT(DECIMAL(18,2), Issued_Qty) IS NULL;
GO

/*==============================================================
9. Invalid Returned_Qty
==============================================================*/
SELECT *
FROM staging.Work_Order_Materials_Stage
WHERE NULLIF(LTRIM(RTRIM(Returned_Qty)),'') IS NOT NULL
AND TRY_CONVERT(DECIMAL(18,2), Returned_Qty) IS NULL;
GO

/*==============================================================
10. Invalid Unit_Cost_USD
==============================================================*/
SELECT *
FROM staging.Work_Order_Materials_Stage
WHERE NULLIF(LTRIM(RTRIM(Unit_Cost_USD)),'') IS NOT NULL
AND TRY_CONVERT(DECIMAL(18,2), Unit_Cost_USD) IS NULL;
GO

/*==============================================================
11. Invalid Extended_Cost_USD
==============================================================*/
SELECT *
FROM staging.Work_Order_Materials_Stage
WHERE NULLIF(LTRIM(RTRIM(Extended_Cost_USD)),'') IS NOT NULL
AND TRY_CONVERT(DECIMAL(18,2), Extended_Cost_USD) IS NULL;
GO

/*==============================================================
12. Invalid Stock_Before
==============================================================*/
SELECT *
FROM staging.Work_Order_Materials_Stage
WHERE NULLIF(LTRIM(RTRIM(Stock_Before)),'') IS NOT NULL
AND TRY_CONVERT(DECIMAL(18,2), Stock_Before) IS NULL;
GO

/*==============================================================
13. Invalid Stock_After
==============================================================*/
SELECT *
FROM staging.Work_Order_Materials_Stage
WHERE NULLIF(LTRIM(RTRIM(Stock_After)),'') IS NOT NULL
AND TRY_CONVERT(DECIMAL(18,2), Stock_After) IS NULL;
GO

/*==============================================================
14. Invalid Critical_Spare
(Expected values: Yes / No / 0 / 1 / True / False)
==============================================================*/
SELECT *
FROM staging.Work_Order_Materials_Stage
WHERE NULLIF(LTRIM(RTRIM(Critical_Spare)),'') IS NOT NULL
AND UPPER(LTRIM(RTRIM(Critical_Spare)))
NOT IN ('YES','NO','TRUE','FALSE','1','0');
GO

/*==============================================================
15. Missing Spare_Part_ID
==============================================================*/
SELECT COUNT(*) AS Missing_Spare_Part_ID
FROM staging.Work_Order_Materials_Stage
WHERE NULLIF(LTRIM(RTRIM(Spare_Part_ID)),'') IS NULL;
GO

/*==============================================================
16. Missing Vendor_ID
==============================================================*/
SELECT COUNT(*) AS Missing_Vendor_ID
FROM staging.Work_Order_Materials_Stage
WHERE NULLIF(LTRIM(RTRIM(Vendor_ID)),'') IS NULL;
GO

/*==============================================================
17. Summary
==============================================================*/
SELECT
    COUNT(*) AS TotalRows,
    COUNT(Material_Transaction_ID) AS MaterialTransactionIDs,
    COUNT(Work_Order_ID) AS WorkOrders,
    COUNT(Operation_ID) AS Operations
FROM staging.Work_Order_Materials_Stage;
GO