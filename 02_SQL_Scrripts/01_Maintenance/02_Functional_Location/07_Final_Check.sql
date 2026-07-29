USE Chocolate_Manufacturing_DW;
GO

SELECT COUNT(*) AS TotalRows
FROM master.Functional_Location_Master;
GO

SELECT TOP (20) *
FROM master.Functional_Location_Master;
GO

SELECT
SQL_VARIANT_PROPERTY(Commissioning_Year,'BaseType') AS Commissioning_Year_Type,
SQL_VARIANT_PROPERTY(Latitude_Zone,'BaseType') AS Latitude_Type,
SQL_VARIANT_PROPERTY(Longitude_Zone,'BaseType') AS Longitude_Type,
SQL_VARIANT_PROPERTY(Inspection_Frequency_Days,'BaseType') AS Inspection_Type
FROM master.Functional_Location_Master;
GO