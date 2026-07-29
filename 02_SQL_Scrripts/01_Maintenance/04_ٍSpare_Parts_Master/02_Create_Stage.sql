USE Chocolate_Manufacturing_DW;
GO

DROP TABLE IF EXISTS staging.Spare_Parts_Stage;
GO

CREATE TABLE staging.Spare_Parts_Stage
(
    Spare_Part_ID NVARCHAR(255),
    Part_Number NVARCHAR(255),
    Part_Name NVARCHAR(255),
    Category NVARCHAR(255),

    Component_ID NVARCHAR(255),
    Equipment_ID NVARCHAR(255),

    Manufacturer NVARCHAR(255),
    Vendor_Code NVARCHAR(255),

    Unit NVARCHAR(255),

    Critical_Spare NVARCHAR(255),
    ABC_Class NVARCHAR(255),

    Min_Stock NVARCHAR(255),
    Max_Stock NVARCHAR(255),
    Reorder_Point NVARCHAR(255),
    Current_Stock NVARCHAR(255),

    Lead_Time_Days NVARCHAR(255),

    Unit_Cost_USD NVARCHAR(255),

    Warehouse NVARCHAR(255),
    Bin_Location NVARCHAR(255),

    Status NVARCHAR(255),

    Plant NVARCHAR(255),
    Area NVARCHAR(255),

    Notes NVARCHAR(MAX)
);
GO