USE Chocolate_Manufacturing_DW;
GO

-- إجمالي عدد السجلات
SELECT COUNT(*) AS TotalRows
FROM master.Failure_Codes_Master;
GO

-- عرض أول 20 سجل
SELECT TOP (20) *
FROM master.Failure_Codes_Master;
GO

-- التأكد من أنواع البيانات
SELECT
    SQL_VARIANT_PROPERTY(Probability,'BaseType') AS Probability_Type,
    SQL_VARIANT_PROPERTY(Risk_Priority,'BaseType') AS RiskPriority_Type,
    SQL_VARIANT_PROPERTY(Estimated_Downtime_Hours,'BaseType') AS Downtime_Type,
    SQL_VARIANT_PROPERTY(Estimated_Repair_Hours,'BaseType') AS Repair_Type,
    SQL_VARIANT_PROPERTY(Created_Year,'BaseType') AS CreatedYear_Type
FROM master.Failure_Codes_Master;
GO