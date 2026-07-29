USE Chocolate_Manufacturing_DW;
GO

/*===========================================================
Create Master Table : Products_Master
===========================================================*/

IF OBJECT_ID('master.Products_Master','U') IS NOT NULL
    DROP TABLE master.Products_Master;
GO

CREATE TABLE master.Products_Master
(
    Product_ID              NVARCHAR(255) NOT NULL,
    SKU                     NVARCHAR(255),
    Barcode                 NVARCHAR(255),
    Product_Name            NVARCHAR(255),
    Brand                   NVARCHAR(255),
    Product_Family          NVARCHAR(255),
    Category                NVARCHAR(255),
    Chocolate_Type          NVARCHAR(255),

    Cocoa_Percent           DECIMAL(18,2),
    Net_Weight              DECIMAL(18,2),

    Package_Type            NVARCHAR(255),
    Units_Per_Carton        INT,
    Cartons_Per_Pallet      INT,
    Shelf_Life_Days         INT,

    Storage_Temperature     NVARCHAR(255),
    Recipe_ID               NVARCHAR(255),
    BOM_ID                  NVARCHAR(255),

    Primary_Process_Line    NVARCHAR(255),
    Primary_Plant           NVARCHAR(255),

    Quality_Standard        NVARCHAR(255),
    Allergen_Info           NVARCHAR(255),
    Market                  NVARCHAR(255),
    Country                 NVARCHAR(255),
    Currency                NVARCHAR(100),

    Standard_Cost           DECIMAL(18,2),
    Standard_Price          DECIMAL(18,2),

    Launch_Date             DATE,

    Status                  NVARCHAR(100),
    Export_Product          NVARCHAR(100),
    Organic                 NVARCHAR(100),
    Sugar_Free              NVARCHAR(100),
        Packaging              NVARCHAR(255),

    Primary_Warehouse      NVARCHAR(255),

    Batch_Control          NVARCHAR(100),

    FEFO_Required          NVARCHAR(100),

    Nutritional_Info       NVARCHAR(MAX),

    HS_Code                NVARCHAR(100),

    Product_Model          NVARCHAR(100),

    Revision               NVARCHAR(100),

    Created_Date           DATE,

    Last_Update            DATE,

    Notes                  NVARCHAR(MAX),

    CONSTRAINT PK_Products_Master
        PRIMARY KEY (Product_ID)

);
GO

/*===========================================================
Verify Master Table
===========================================================*/

SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='master'
AND TABLE_NAME='Products_Master'
ORDER BY ORDINAL_POSITION;
GO