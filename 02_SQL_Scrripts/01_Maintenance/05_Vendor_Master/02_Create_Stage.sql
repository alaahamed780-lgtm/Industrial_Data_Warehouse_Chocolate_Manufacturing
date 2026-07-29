USE Chocolate_Manufacturing_DW;
GO

IF OBJECT_ID('staging.Vendor_Stage','U') IS NOT NULL
    DROP TABLE staging.Vendor_Stage;
GO

CREATE TABLE staging.Vendor_Stage
(
    Vendor_ID NVARCHAR(255),
    Vendor_Code NVARCHAR(255),
    Vendor_Name NVARCHAR(255),
    Vendor_Type NVARCHAR(255),
    Category NVARCHAR(255),

    Country NVARCHAR(255),
    City NVARCHAR(255),
    Region NVARCHAR(255),
    Status NVARCHAR(255),

    OEM_Flag NVARCHAR(255),
    Preferred_Vendor NVARCHAR(255),

    Manufacturer_Brand NVARCHAR(255),
    Contact_Department NVARCHAR(255),

    Email NVARCHAR(255),
    Phone NVARCHAR(255),
    Website NVARCHAR(255),

    Payment_Terms NVARCHAR(255),
    Currency NVARCHAR(255),

    Lead_Time_Days NVARCHAR(255),

    On_Time_Delivery_Percent NVARCHAR(255),

    Quality_Rating NVARCHAR(255),
    Vendor_Rating NVARCHAR(255),

    Approved_Date NVARCHAR(255),

    Contract_End_Year NVARCHAR(255),

    Supplied_Category NVARCHAR(255),

    Critical_Supplier NVARCHAR(255),

    Warehouse_Service NVARCHAR(255),

    Emergency_Support NVARCHAR(255),

    MOQ NVARCHAR(255),

    Annual_Spend_USD NVARCHAR(255),

    Incoterm NVARCHAR(255),

    Cost_Center NVARCHAR(255),

    Plant NVARCHAR(255),

    Area NVARCHAR(255),

    Notes NVARCHAR(MAX)
);
GO