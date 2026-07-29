USE Chocolate_Manufacturing_DW;
GO

IF OBJECT_ID('dw.Dim_Equipment','U') IS NOT NULL
    DROP TABLE dw.Dim_Equipment;
GO

CREATE TABLE dw.Dim_Equipment
(
    Equipment_Key INT IDENTITY(1,1) PRIMARY KEY,

    Equipment_ID NVARCHAR(50) NOT NULL,
    Asset_Tag NVARCHAR(100),

    Equipment_Name NVARCHAR(200),
    Equipment_Type NVARCHAR(100),

    Category NVARCHAR(100),
    Subcategory NVARCHAR(100),

    Plant NVARCHAR(100),
    Building NVARCHAR(100),
    Area NVARCHAR(100),
    Production_Line NVARCHAR(100),

    Functional_Location NVARCHAR(100),
    Parent_Equipment NVARCHAR(100),

    Manufacturer NVARCHAR(100),
    Model NVARCHAR(100),
    Serial_Number NVARCHAR(100),
    Country NVARCHAR(100),

    Installation_Year SMALLINT,
    Commissioning_Date DATE,

    Criticality NVARCHAR(50),
    Risk_Class NVARCHAR(50),
    Status NVARCHAR(50),

    Maintenance_Team NVARCHAR(100),
    Cost_Center NVARCHAR(100),

    Created_Date DATETIME DEFAULT GETDATE()
);
GO

PRINT 'Dim_Equipment Created Successfully';
GO