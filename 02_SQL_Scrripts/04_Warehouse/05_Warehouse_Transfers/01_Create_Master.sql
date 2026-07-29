USE Chocolate_Manufacturing_DW;
GO

/*============================================================
04_Create_Warehouse_Transfers_Master.sql
============================================================*/

IF OBJECT_ID('master.Warehouse_Transfers_Master','U') IS NOT NULL
    DROP TABLE master.Warehouse_Transfers_Master;
GO

CREATE TABLE master.Warehouse_Transfers_Master
(
    Warehouse_Transfer_ID      NVARCHAR(30) NOT NULL,
    Transfer_Number            NVARCHAR(30),

    Calendar_Date_Key          INT,

    Transfer_Date              DATE,
    Transfer_DateTime          DATETIME2,

    Transfer_Type              NVARCHAR(50),

    Material_ID                NVARCHAR(30),
    Spare_Part_ID              NVARCHAR(30),
    Product_ID                 NVARCHAR(30),

    From_Warehouse             NVARCHAR(50),
    From_Bin                   NVARCHAR(50),

    To_Warehouse               NVARCHAR(50),
    To_Bin                     NVARCHAR(50),

    Quantity                   DECIMAL(18,2),

    UOM                        NVARCHAR(20),

    Unit_Cost_USD              DECIMAL(18,2),
    Extended_Cost_USD          DECIMAL(18,2),

    Stock_Before_From          DECIMAL(18,2),
    Stock_After_From           DECIMAL(18,2),

    Stock_Before_To            DECIMAL(18,2),
    Stock_After_To             DECIMAL(18,2),

    Batch_No                   NVARCHAR(50),
    Lot_No                     NVARCHAR(50),

    Requested_By               NVARCHAR(30),
    Approved_By                NVARCHAR(30),
    Executed_By                NVARCHAR(30),

    Reason_Code                NVARCHAR(100),

    Reference_Document         NVARCHAR(100),
    Reference_Type             NVARCHAR(50),

    Plant                      NVARCHAR(50),
    Area                       NVARCHAR(100),

    Status                     NVARCHAR(50),

    Notes                      NVARCHAR(500),

    Load_Date DATETIME2
        CONSTRAINT DF_Warehouse_Transfers_LoadDate
        DEFAULT(GETDATE()),

    CONSTRAINT PK_Warehouse_Transfers_Master
        PRIMARY KEY (Warehouse_Transfer_ID)
);
GO

/*============================================================
Verify Table
============================================================*/

SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='master'
AND TABLE_NAME='Warehouse_Transfers_Master'
ORDER BY ORDINAL_POSITION;
GO