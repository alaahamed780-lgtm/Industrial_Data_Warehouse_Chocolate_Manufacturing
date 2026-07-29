USE Chocolate_Manufacturing_DW;
GO

DROP TABLE IF EXISTS staging.Components_Stage;
GO

CREATE TABLE staging.Components_Stage
(
    Component_ID NVARCHAR(255),
    Equipment_ID NVARCHAR(255),
    Parent_Component_ID NVARCHAR(255),

    Assembly_Code NVARCHAR(255),
    Subsystem NVARCHAR(255),

    Component_Name NVARCHAR(255),
    Component_Type NVARCHAR(255),
    Category NVARCHAR(255),

    Manufacturer NVARCHAR(255),
    Model NVARCHAR(255),

    Part_Number NVARCHAR(255),
    Serial_Number NVARCHAR(255),

    Material NVARCHAR(255),
    Dimensions NVARCHAR(255),

    Weight_kg NVARCHAR(255),

    Qty_Per_Equipment NVARCHAR(255),

    Unit NVARCHAR(255),

    Criticality NVARCHAR(255),
    Risk_Class NVARCHAR(255),

    Failure_Mode NVARCHAR(255),
    Failure_Cause NVARCHAR(255),

    Maintenance_Strategy NVARCHAR(255),

    Inspection_Frequency_Days NVARCHAR(255),

    Lubrication_Required NVARCHAR(255),
    Calibration_Required NVARCHAR(255),

    Installation_Date NVARCHAR(255),

    Expected_Life_Years NVARCHAR(255),
    Current_Age_Years NVARCHAR(255),

    Replacement_Cost_USD NVARCHAR(255),

    Lead_Time_Days NVARCHAR(255),

    Vendor_Code NVARCHAR(255),

    Spare_Part_Code NVARCHAR(255),

    Warehouse_Location NVARCHAR(255),
    Bin_Location NVARCHAR(255),

    Drawing_Number NVARCHAR(255),
    Revision NVARCHAR(255),

    Status NVARCHAR(255),
    Condition NVARCHAR(255),

    PLC_Tag NVARCHAR(255),
    Sensor_Tag NVARCHAR(255),

    Asset_Group NVARCHAR(255),

    Cost_Center NVARCHAR(255),

    Maintenance_Team NVARCHAR(255),

    Plant NVARCHAR(255),
    Area NVARCHAR(255),
    Production_Line NVARCHAR(255),

    Functional_Location NVARCHAR(255),

    Notes NVARCHAR(MAX)
);
GO