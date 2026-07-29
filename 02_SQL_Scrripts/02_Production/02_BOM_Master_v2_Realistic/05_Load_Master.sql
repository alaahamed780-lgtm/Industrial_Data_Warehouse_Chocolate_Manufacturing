USE Chocolate_Manufacturing_DW;
GO

/*============================================================
05_Load_BOM_Master.sql
Load Data From Stage To Master
============================================================*/

TRUNCATE TABLE master.BOM_Master;
GO

INSERT INTO master.BOM_Master
(
    BOM_ID,
    Product_ID,
    Product_Type,
    Recipe_ID,
    Revision,
    Effective_From,
    Effective_To,
    Production_Line,
    Material_ID,
    Material_Name,
    Material_Type,
    Qty_Per_100,
    UOM,
    Stage,
    Supplier_ID,
    Yield_Percent,
    Scrap_Percent,
    Critical_Material,
    Allergen,
    Cost_USD,
    Sequence,
    Version_Status
)

SELECT

NULLIF(LTRIM(RTRIM(BOM_ID)),''),

NULLIF(LTRIM(RTRIM(Product_ID)),''),

NULLIF(LTRIM(RTRIM(Product_Type)),''),

NULLIF(LTRIM(RTRIM(Recipe_ID)),''),

NULLIF(LTRIM(RTRIM(Revision)),''),

TRY_CONVERT(DATE,Effective_From),

TRY_CONVERT(DATE,Effective_To),

NULLIF(LTRIM(RTRIM(Production_Line)),''),

NULLIF(LTRIM(RTRIM(Material_ID)),''),

NULLIF(LTRIM(RTRIM(Material_Name)),''),

NULLIF(LTRIM(RTRIM(Material_Type)),''),

TRY_CONVERT(DECIMAL(18,2),Qty_Per_100),

NULLIF(LTRIM(RTRIM(UOM)),''),

NULLIF(LTRIM(RTRIM(Stage)),''),

NULLIF(LTRIM(RTRIM(Supplier_ID)),''),

TRY_CONVERT(DECIMAL(5,2),Yield_Percent),

TRY_CONVERT(DECIMAL(5,2),Scrap_Percent),

NULLIF(LTRIM(RTRIM(Critical_Material)),''),

NULLIF(LTRIM(RTRIM(Allergen)),''),

TRY_CONVERT(DECIMAL(18,2),Cost_USD),

TRY_CONVERT(INT,Sequence),

NULLIF(LTRIM(RTRIM(Version_Status)),'')

FROM staging.BOM_Master_Stage;
GO

/*============================================================
Verify Load
============================================================*/

SELECT
    COUNT(*) AS Master_Count
FROM master.BOM_Master;
GO

SELECT TOP (20) *
FROM master.BOM_Master
ORDER BY BOM_ID, Sequence;
GO