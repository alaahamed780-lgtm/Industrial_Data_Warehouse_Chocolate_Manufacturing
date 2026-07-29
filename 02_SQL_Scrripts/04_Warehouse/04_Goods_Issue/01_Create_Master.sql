USE Chocolate_Manufacturing_DW;
GO

/*============================================================
04_Create_Goods_Issue_Master.sql
============================================================*/

IF OBJECT_ID('master.Goods_Issue_Master','U') IS NOT NULL
    DROP TABLE master.Goods_Issue_Master;
GO

CREATE TABLE master.Goods_Issue_Master
(
    Goods_Issue_ID          NVARCHAR(30) NOT NULL,
    GI_Number               NVARCHAR(30),

    Calendar_Date_Key       INT,

    Issue_Date              DATE,
    Issue_DateTime          DATETIME2,

    Issue_Type              NVARCHAR(50),
    Movement_Type           NVARCHAR(20),

    Warehouse               NVARCHAR(50),
    Bin_Location            NVARCHAR(50),

    Material_ID             NVARCHAR(30),
    Spare_Part_ID           NVARCHAR(30),
    Product_ID              NVARCHAR(30),

    Work_Order_ID           NVARCHAR(30),
    Production_Order_ID     NVARCHAR(30),

    Equipment_ID            NVARCHAR(30),

    Requested_By            NVARCHAR(30),
    Issued_By               NVARCHAR(30),
    Approved_By             NVARCHAR(30),

    Quantity                DECIMAL(18,2),

    UOM                     NVARCHAR(20),

    Unit_Cost_USD           DECIMAL(18,2),
    Extended_Cost_USD       DECIMAL(18,2),

    Stock_Before            DECIMAL(18,2),
    Stock_After             DECIMAL(18,2),

    Batch_No                NVARCHAR(50),
    Lot_No                  NVARCHAR(50),

    Reason_Code             NVARCHAR(100),

    Reference_Document      NVARCHAR(100),

    Reference_Type          NVARCHAR(50),

    Plant                   NVARCHAR(50),

    Area                    NVARCHAR(100),

    Status                  NVARCHAR(50),

    Notes                   NVARCHAR(500),

    Load_Date DATETIME2
        CONSTRAINT DF_GoodsIssue_LoadDate
        DEFAULT(GETDATE()),

    CONSTRAINT PK_Goods_Issue_Master
        PRIMARY KEY (Goods_Issue_ID)
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
AND TABLE_NAME='Goods_Issue_Master'
ORDER BY ORDINAL_POSITION;
GO