USE Chocolate_Manufacturing_DW;
GO

-------------------------------------------------------
-- عدد السجلات
-------------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM master.Work_Orders_Master;
GO

-------------------------------------------------------
-- أول 20 سجل
-------------------------------------------------------
SELECT TOP (20) *
FROM master.Work_Orders_Master;
GO

-------------------------------------------------------
-- آخر 20 سجل
-------------------------------------------------------
SELECT TOP (20) *
FROM master.Work_Orders_Master
ORDER BY Work_Order_ID DESC;
GO

-------------------------------------------------------
-- التحقق من عدم وجود مفاتيح فارغة
-------------------------------------------------------
SELECT COUNT(*) AS Missing_Work_Order_ID
FROM master.Work_Orders_Master
WHERE Work_Order_ID IS NULL
   OR LTRIM(RTRIM(Work_Order_ID))='';
GO

-------------------------------------------------------
-- التحقق من التكرار
-------------------------------------------------------
SELECT Work_Order_ID,
       COUNT(*) AS DuplicateCount
FROM master.Work_Orders_Master
GROUP BY Work_Order_ID
HAVING COUNT(*) > 1;
GO

-------------------------------------------------------
-- التحقق من أنواع البيانات
-------------------------------------------------------
SELECT TOP (1)

SQL_VARIANT_PROPERTY(Request_Date,'BaseType') AS Request_Date,

SQL_VARIANT_PROPERTY(Planned_Start,'BaseType') AS Planned_Start,

SQL_VARIANT_PROPERTY(Actual_Finish,'BaseType') AS Actual_Finish,

SQL_VARIANT_PROPERTY(Estimated_Labor_Hours,'BaseType') AS Estimated_Labor_Hours,

SQL_VARIANT_PROPERTY(Actual_Labor_Hours,'BaseType') AS Actual_Labor_Hours,

SQL_VARIANT_PROPERTY(Estimated_Material_Cost_USD,'BaseType') AS Estimated_Material_Cost,

SQL_VARIANT_PROPERTY(Actual_Material_Cost_USD,'BaseType') AS Actual_Material_Cost,

SQL_VARIANT_PROPERTY(Estimated_Total_Cost_USD,'BaseType') AS Estimated_Total_Cost,

SQL_VARIANT_PROPERTY(Actual_Total_Cost_USD,'BaseType') AS Actual_Total_Cost,

SQL_VARIANT_PROPERTY(Downtime_Hours,'BaseType') AS Downtime_Hours

FROM master.Work_Orders_Master;
GO