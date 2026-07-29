USE Chocolate_Manufacturing_DW;
GO

SELECT COUNT(*) AS TotalRows
FROM master.Spare_Parts_Master;
GO

SELECT TOP (20) *
FROM master.Spare_Parts_Master;
GO

SELECT

SQL_VARIANT_PROPERTY(Unit_Cost_USD,'BaseType') AS Unit_Cost_Type,

SQL_VARIANT_PROPERTY(Min_Stock,'BaseType') AS MinStock_Type,

SQL_VARIANT_PROPERTY(Max_Stock,'BaseType') AS MaxStock_Type,

SQL_VARIANT_PROPERTY(Current_Stock,'BaseType') AS CurrentStock_Type,

SQL_VARIANT_PROPERTY(Lead_Time_Days,'BaseType') AS LeadTime_Type

FROM master.Spare_Parts_Master;
GO