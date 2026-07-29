USE Chocolate_Manufacturing_DW;
GO

/*=========================================================
  Create Stage Schema
=========================================================*/

IF NOT EXISTS (
    SELECT *
    FROM sys.schemas
    WHERE name = 'staging'
)
BEGIN
    EXEC('CREATE SCHEMA staging');
END
GO

/*=========================================================
  Drop Stage Table
=========================================================*/

IF OBJECT_ID('staging.BOM_Master_Stage', 'U') IS NOT NULL
DROP TABLE staging.BOM_Master_Stage;
GO

/*=========================================================
  Create Stage Table
=========================================================*/

CREATE TABLE staging.BOM_Master_Stage
(
    BOM_ID              NVARCHAR(255),
    Product_ID          NVARCHAR(255),
    Product_Type        NVARCHAR(255),
    Recipe_ID           NVARCHAR(255),
    Revision            NVARCHAR(255),

    Effective_From      NVARCHAR(255),
    Effective_To        NVARCHAR(255),

    Production_Line     NVARCHAR(255),

    Material_ID         NVARCHAR(255),
    Material_Name       NVARCHAR(255),
    Material_Type       NVARCHAR(255),

    Qty_Per_100         NVARCHAR(255),
    UOM                 NVARCHAR(255),

    Stage               NVARCHAR(255),

    Supplier_ID         NVARCHAR(255),

    Yield_Percent       NVARCHAR(255),
    Scrap_Percent       NVARCHAR(255),

    Critical_Material   NVARCHAR(255),
    Allergen            NVARCHAR(255),

    Cost_USD            NVARCHAR(255),

    Sequence            NVARCHAR(255),

    Version_Status      NVARCHAR(255)
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
WHERE TABLE_SCHEMA='staging'
AND TABLE_NAME='BOM_Master_Stage'
ORDER BY ORDINAL_POSITION;
GO