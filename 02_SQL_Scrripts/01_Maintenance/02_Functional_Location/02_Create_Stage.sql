USE Chocolate_Manufacturing_DW;
GO

DROP TABLE IF EXISTS staging.Functional_Location_Stage;
GO

CREATE TABLE staging.Functional_Location_Stage
(
    Functional_Location_ID NVARCHAR(255),
    Functional_Location_Code NVARCHAR(255),
    Parent_Functional_Location NVARCHAR(255),
    [Level] NVARCHAR(255),

    Plant NVARCHAR(255),
    Building NVARCHAR(255),
    Area NVARCHAR(255),
    Production_Line NVARCHAR(255),
    Zone NVARCHAR(255),
    Section NVARCHAR(255),

    Equipment_Group NVARCHAR(255),
    Equipment_ID NVARCHAR(255),

    Location_Name NVARCHAR(255),
    Location_Type NVARCHAR(255),
    Process NVARCHAR(255),

    Latitude_Zone NVARCHAR(255),
    Longitude_Zone NVARCHAR(255),

    Cost_Center NVARCHAR(255),
    Department NVARCHAR(255),
    Maintenance_Team NVARCHAR(255),

    Criticality NVARCHAR(255),
    Safety_Class NVARCHAR(255),
    Environment NVARCHAR(255),

    Commissioning_Year NVARCHAR(255),

    Status NVARCHAR(255),

    PLC_Area NVARCHAR(255),
    DCS_Area NVARCHAR(255),

    Power_Source NVARCHAR(255),
    Utility_Type NVARCHAR(255),

    Access_Level NVARCHAR(255),

    Responsible_Manager NVARCHAR(255),

    Inspection_Frequency_Days NVARCHAR(255),

    Remarks NVARCHAR(MAX)
);
GO