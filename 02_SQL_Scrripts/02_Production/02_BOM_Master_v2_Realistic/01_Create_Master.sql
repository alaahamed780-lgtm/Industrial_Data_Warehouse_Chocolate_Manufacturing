USE Chocolate_Manufacturing_DW;
GO

/*=========================================================
04_Create_BOM_Master.sql
Create Master Table
=========================================================*/

-- Create Schema
IF NOT EXISTS (
    SELECT *
    FROM sys.schemas
    WHERE name = 'master'
)
BEGIN
    EXEC('CREATE SCHEMA master');
END
GO

/*=========================================================
Drop Table
=========================================================*/

IF OBJECT_ID('master.BOM_Master','U') IS NOT NULL
DROP TABLE master.BOM_Master;
GO

/*=========================================================
Create Master Table
=========================================================*/

CREATE TABLE master.BOM_Master
(
    BOM_ID              NVARCHAR(50) NOT NULL,
    Product_ID          NVARCHAR(50) NOT NULL,
    Product_Type        NVARCHAR(50),
    Recipe_ID           NVARCHAR(50),
    Revision            NVARCHAR(20),

    Effective_From      DATE,
    Effective_To        DATE,

    Production_Line     NVARCHAR(50),

    Material_ID         NVARCHAR(50) NOT NULL,
    Material_Name       NVARCHAR(100),
    Material_Type       NVARCHAR(50),

    Qty_Per_100         DECIMAL(18,2),
    UOM                 NVARCHAR(20),

    Stage               NVARCHAR(50),

    Supplier_ID         NVARCHAR(50),

    Yield_Percent       DECIMAL(5,2),
    Scrap_Percent       DECIMAL(5,2),

    Critical_Material   NVARCHAR(10),
    Allergen            NVARCHAR(100),

    Cost_USD            DECIMAL(18,2),

    Sequence            INT,

    Version_Status      NVARCHAR(30),

    CONSTRAINT PK_BOM_Master
    PRIMARY KEY
    (
        BOM_ID,
        Material_ID,
        Sequence
    )
);
GO

/*=========================================================
Verify Master Table
=========================================================*/

SELECT
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='master'
AND TABLE_NAME='BOM_Master'
ORDER BY ORDINAL_POSITION;
GO