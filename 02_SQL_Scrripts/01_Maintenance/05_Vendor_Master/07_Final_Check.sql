USE Chocolate_Manufacturing_DW;
GO

SELECT COUNT(*) AS TotalRows
FROM master.Vendor_Master;
GO

SELECT TOP (20) *
FROM master.Vendor_Master;
GO

SELECT

SQL_VARIANT_PROPERTY(Lead_Time_Days,'BaseType') AS LeadTime_Type,

SQL_VARIANT_PROPERTY(On_Time_Delivery_Percent,'BaseType') AS Delivery_Type,

SQL_VARIANT_PROPERTY(Quality_Rating,'BaseType') AS Quality_Type,

SQL_VARIANT_PROPERTY(Vendor_Rating,'BaseType') AS VendorRating_Type,

SQL_VARIANT_PROPERTY(Approved_Date,'BaseType') AS ApprovedDate_Type,

SQL_VARIANT_PROPERTY(Annual_Spend_USD,'BaseType') AS AnnualSpend_Type

FROM master.Vendor_Master;
GO