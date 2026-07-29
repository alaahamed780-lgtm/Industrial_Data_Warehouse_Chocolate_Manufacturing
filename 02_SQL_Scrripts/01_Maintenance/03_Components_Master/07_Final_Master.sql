USE Chocolate_Manufacturing_DW;
GO

SELECT COUNT(*) AS TotalRows
FROM master.Components_Master;
GO

SELECT TOP (20) *
FROM master.Components_Master;
GO

SELECT
SQL_VARIANT_PROPERTY(Weight_kg,'BaseType') AS Weight_Type,
SQL_VARIANT_PROPERTY(Qty_Per_Equipment,'BaseType') AS Qty_Type,
SQL_VARIANT_PROPERTY(Installation_Date,'BaseType') AS Installation_Date_Type,
SQL_VARIANT_PROPERTY(Replacement_Cost_USD,'BaseType') AS Replacement_Cost_Type,
SQL_VARIANT_PROPERTY(Lead_Time_Days,'BaseType') AS Lead_Time_Type
FROM master.Components_Master;
GO