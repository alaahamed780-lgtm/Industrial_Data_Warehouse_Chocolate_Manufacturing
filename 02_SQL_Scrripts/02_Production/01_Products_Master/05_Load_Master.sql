USE Chocolate_Manufacturing_DW;
GO

/*============================================================
Load Products Master
============================================================*/

TRUNCATE TABLE master.Products_Master;
GO

INSERT INTO master.Products_Master
(
    Product_ID,
    SKU,
    Barcode,
    Product_Name,
    Brand,
    Product_Family,
    Category,
    Chocolate_Type,
    Cocoa_Percent,
    Net_Weight,
    Package_Type,
    Units_Per_Carton,
    Cartons_Per_Pallet,
    Shelf_Life_Days,
    Storage_Temperature,
    Recipe_ID,
    BOM_ID,
    Primary_Process_Line,
    Primary_Plant,
    Quality_Standard,
    Allergen_Info,
    Market,
    Country,
    Currency,
    Standard_Cost,
    Standard_Price,
    Launch_Date,
    Status,
    Export_Product,
    Organic,
    Sugar_Free,
    Packaging,
    Primary_Warehouse,
    Batch_Control,
    FEFO_Required,
    Nutritional_Info,
    HS_Code,
    Product_Model,
    Revision,
    Created_Date,
    Last_Update,
    Notes
)

SELECT

Product_ID,
SKU,
Barcode,
Product_Name,
Brand,
Product_Family,
Category,
Chocolate_Type,

TRY_CONVERT(decimal(18,2),Cocoa_Percent),
TRY_CONVERT(decimal(18,2),Net_Weight),

Package_Type,

TRY_CONVERT(int,Units_Per_Carton),
TRY_CONVERT(int,Cartons_Per_Pallet),
TRY_CONVERT(int,Shelf_Life_Days),

Storage_Temperature,
Recipe_ID,
BOM_ID,
Primary_Process_Line,
Primary_Plant,
Quality_Standard,
Allergen_Info,
Market,
Country,
Currency,

TRY_CONVERT(decimal(18,2),Standard_Cost),
TRY_CONVERT(decimal(18,2),Standard_Price),

TRY_CONVERT(date,Launch_Date),

Status,
Export_Product,
Organic,
Sugar_Free,
Packaging,
Primary_Warehouse,
Batch_Control,
FEFO_Required,
Nutritional_Info,
HS_Code,
Product_Model,
Revision,

TRY_CONVERT(date,Created_Date),
TRY_CONVERT(date,Last_Update),

Notes

FROM staging.Products_Master_Stage;
GO

/*============================================================
Verify Load
============================================================*/

SELECT COUNT(*) AS Master_Count
FROM master.Products_Master;
GO

SELECT TOP (20) *
FROM master.Products_Master;
GO