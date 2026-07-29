USE Chocolate_Manufacturing_DW;
GO

/*==============================================================
1. Total Records
==============================================================*/
SELECT COUNT(*) AS TotalRows
FROM master.Work_Order_Materials_Master;
GO

/*==============================================================
2. First 20 Records
==============================================================*/
SELECT TOP (20) *
FROM master.Work_Order_Materials_Master
ORDER BY Material_Transaction_ID;
GO

/*==============================================================
3. Last 20 Records
==============================================================*/
SELECT TOP (20) *
FROM master.Work_Order_Materials_Master
ORDER BY Material_Transaction_ID DESC;
GO

/*==============================================================
4. Data Types
==============================================================*/
SELECT TOP (1)

SQL_VARIANT_PROPERTY(Issue_Date,'BaseType')            AS Issue_Date_Type,

SQL_VARIANT_PROPERTY(Requested_Qty,'BaseType')         AS Requested_Qty_Type,

SQL_VARIANT_PROPERTY(Issued_Qty,'BaseType')            AS Issued_Qty_Type,

SQL_VARIANT_PROPERTY(Returned_Qty,'BaseType')          AS Returned_Qty_Type,

SQL_VARIANT_PROPERTY(Unit_Cost_USD,'BaseType')         AS Unit_Cost_Type,

SQL_VARIANT_PROPERTY(Extended_Cost_USD,'BaseType')     AS Extended_Cost_Type,

SQL_VARIANT_PROPERTY(Stock_Before,'BaseType')          AS Stock_Before_Type,

SQL_VARIANT_PROPERTY(Stock_After,'BaseType')           AS Stock_After_Type,

SQL_VARIANT_PROPERTY(Critical_Spare,'BaseType')        AS Critical_Spare_Type

FROM master.Work_Order_Materials_Master;
GO

/*==============================================================
5. Missing Primary Key
==============================================================*/
SELECT COUNT(*) AS Missing_Material_Transaction_ID
FROM master.Work_Order_Materials_Master
WHERE Material_Transaction_ID IS NULL;
GO

/*==============================================================
6. Duplicate Primary Key
==============================================================*/
SELECT
    Material_Transaction_ID,
    COUNT(*) AS DuplicateCount
FROM master.Work_Order_Materials_Master
GROUP BY Material_Transaction_ID
HAVING COUNT(*) > 1;
GO

/*==============================================================
7. Missing Work Order ID
==============================================================*/
SELECT COUNT(*) AS Missing_Work_Order_ID
FROM master.Work_Order_Materials_Master
WHERE Work_Order_ID IS NULL;
GO

/*==============================================================
8. Missing Operation ID
==============================================================*/
SELECT COUNT(*) AS Missing_Operation_ID
FROM master.Work_Order_Materials_Master
WHERE Operation_ID IS NULL;
GO

/*==============================================================
9. Negative Quantities
==============================================================*/
SELECT COUNT(*) AS Negative_Qty
FROM master.Work_Order_Materials_Master
WHERE Requested_Qty < 0
   OR Issued_Qty < 0
   OR Returned_Qty < 0;
GO

/*==============================================================
10. Negative Costs
==============================================================*/
SELECT COUNT(*) AS Negative_Cost
FROM master.Work_Order_Materials_Master
WHERE Unit_Cost_USD < 0
   OR Extended_Cost_USD < 0;
GO