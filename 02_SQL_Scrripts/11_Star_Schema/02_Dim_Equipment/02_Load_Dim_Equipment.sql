USE Chocolate_Manufacturing_DW;
GO

TRUNCATE TABLE dw.Dim_Equipment;
GO

INSERT INTO dw.Dim_Equipment
(
    Equipment_ID,
    Asset_Tag,
    Equipment_Name,
    Equipment_Type,
    Category,
    Subcategory,
    Plant,
    Building,
    Area,
    Production_Line,
    Functional_Location,
    Parent_Equipment,
    Manufacturer,
    Model,
    Serial_Number,
    Country,
    Installation_Year,
    Commissioning_Date,
    Criticality,
    Risk_Class,
    Status,
    Maintenance_Team,
    Cost_Center
)

SELECT

    Equipment_ID,
    Asset_Tag,
    Equipment_Name,
    Equipment_Type,
    Category,
    Subcategory,
    Plant,
    Building,
    Area,
    Production_Line,
    Functional_Location,
    Parent_Equipment,
    Manufacturer,
    Model,
    Serial_Number,
    Country,

    TRY_CAST(Installation_Year AS SMALLINT),

    TRY_CAST(Commissioning_Date AS DATE),

    Criticality,
    Risk_Class,
    Status,
    Maintenance_Team,
    Cost_Center

FROM master.Equipment_Master;

GO

PRINT 'Dim_Equipment Loaded Successfully';
GO