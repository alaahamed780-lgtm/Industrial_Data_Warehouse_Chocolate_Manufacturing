USE Chocolate_Manufacturing_DW;
GO

/*=========================================================
  Create Product Dimension
=========================================================*/

IF OBJECT_ID('dw.Dim_Product','U') IS NOT NULL
    DROP TABLE dw.Dim_Product;
GO

CREATE TABLE dw.Dim_Product
(
    Product_Key INT IDENTITY(1,1) PRIMARY KEY,

    Product_ID NVARCHAR(50) NOT NULL,
    SKU NVARCHAR(100),
    Barcode NVARCHAR(100),

    Product_Name NVARCHAR(255),
    Brand NVARCHAR(100),
    Product_Family NVARCHAR(100),
    Category NVARCHAR(100),
    Chocolate_Type NVARCHAR(100),

    Cocoa_Percent DECIMAL(5,2),
    Net_Weight DECIMAL(10,2),

    Package_Type NVARCHAR(100),
    Units_Per_Carton INT,
    Cartons_Per_Pallet INT,
    Shelf_Life_Days INT,

    Storage_Temperature NVARCHAR(50),

    Recipe_ID NVARCHAR(50),
    BOM_ID NVARCHAR(50),

    Primary_Process_Line NVARCHAR(100),
    Primary_Plant NVARCHAR(100),

    Quality_Standard NVARCHAR(100),
    Allergen_Info NVARCHAR(255),

    Market NVARCHAR(100),
    Country NVARCHAR(100),
    Currency NVARCHAR(20),

    Standard_Cost DECIMAL(18,2),
    Standard_Price DECIMAL(18,2),

    Launch_Date DATE,

    Status NVARCHAR(50),

    Export_Product NVARCHAR(20),
    Organic NVARCHAR(20),
    Sugar_Free NVARCHAR(20),

    Packaging NVARCHAR(100),

    Primary_Warehouse NVARCHAR(100),

    Batch_Control NVARCHAR(20),
    FEFO_Required NVARCHAR(20),

    Nutritional_Info NVARCHAR(MAX),

    HS_Code NVARCHAR(50),

    Product_Model NVARCHAR(100),

    Revision NVARCHAR(50),

    Created_Date DATE,

    Last_Update DATE,

    Notes NVARCHAR(MAX)
);
GO

PRINT 'dw.Dim_Product Created Successfully';
GO