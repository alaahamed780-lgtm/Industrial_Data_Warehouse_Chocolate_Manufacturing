USE Chocolate_Manufacturing_DW;
GO

TRUNCATE TABLE dw.Dim_Product;
GO

INSERT INTO dw.Dim_Product
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

    TRY_CAST(Cocoa_Percent AS DECIMAL(5,2)),
    TRY_CAST(Net_Weight AS DECIMAL(10,2)),

    Package_Type,

    TRY_CAST(Units_Per_Carton AS INT),
    TRY_CAST(Cartons_Per_Pallet AS INT),
    TRY_CAST(Shelf_Life_Days AS INT),

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

    TRY_CAST(Standard_Cost AS DECIMAL(18,2)),
    TRY_CAST(Standard_Price AS DECIMAL(18,2)),

    TRY_CAST(Launch_Date AS DATE),

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

    TRY_CAST(Created_Date AS DATE),
    TRY_CAST(Last_Update AS DATE),

    Notes

FROM master.Products_Master;
GO

PRINT 'Dim_Product Loaded Successfully';
GO