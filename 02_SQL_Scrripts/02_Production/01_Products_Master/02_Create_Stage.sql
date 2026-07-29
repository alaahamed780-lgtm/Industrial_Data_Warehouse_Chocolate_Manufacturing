USE Chocolate_Manufacturing_DW;
GO

/*=========================================================
Create Staging Schema
=========================================================*/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'staging')
BEGIN
    EXEC('CREATE SCHEMA staging');
END
GO

/*=========================================================
Drop Stage Table
=========================================================*/
DROP TABLE IF EXISTS staging.Products_Master_Stage;
GO

/*=========================================================
Create Stage Table
=========================================================*/
CREATE TABLE staging.Products_Master_Stage
(
    Product_ID NVARCHAR(255),
    SKU NVARCHAR(255),
    Barcode NVARCHAR(255),
    Product_Name NVARCHAR(255),
    Brand NVARCHAR(255),
    Product_Family NVARCHAR(255),
    Category NVARCHAR(255),
    Chocolate_Type NVARCHAR(255),
    Cocoa_Percent NVARCHAR(255),
    Net_Weight NVARCHAR(255),
    Package_Type NVARCHAR(255),
    Units_Per_Carton NVARCHAR(255),
    Cartons_Per_Pallet NVARCHAR(255),
    Shelf_Life_Days NVARCHAR(255),
    Storage_Temperature NVARCHAR(255),
    Recipe_ID NVARCHAR(255),
    BOM_ID NVARCHAR(255),
    Primary_Process_Line NVARCHAR(255),
    Primary_Plant NVARCHAR(255),
    Quality_Standard NVARCHAR(255),
    Allergen_Info NVARCHAR(MAX),
    Market NVARCHAR(255),
    Country NVARCHAR(255),
    Currency NVARCHAR(100),
    Standard_Cost NVARCHAR(255),
    Standard_Price NVARCHAR(255),
    Launch_Date NVARCHAR(255),
    Status NVARCHAR(100),
    Export_Product NVARCHAR(100),
    Organic NVARCHAR(100),
    Sugar_Free NVARCHAR(100),
    Packaging NVARCHAR(255),
    Primary_Warehouse NVARCHAR(255),
    Batch_Control NVARCHAR(100),
    FEFO_Required NVARCHAR(100),
    Nutritional_Info NVARCHAR(255),
    HS_Code NVARCHAR(100),
    Product_Model NVARCHAR(100),
    Revision NVARCHAR(100),
    Created_Date NVARCHAR(255),
    Last_Update NVARCHAR(255),
    Notes NVARCHAR(MAX)
);
GO

/*=========================================================
Verify Stage Table
=========================================================*/

SELECT
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'staging'
AND TABLE_NAME = 'Products_Master_Stage'
ORDER BY ORDINAL_POSITION;
GO