USE Chocolate_Manufacturing_DW;
GO

/*============================================================
04_Create_Goods_Receipt_Master.sql
============================================================*/

IF OBJECT_ID('master.Goods_Receipt_Master','U') IS NOT NULL
    DROP TABLE master.Goods_Receipt_Master;
GO

CREATE TABLE master.Goods_Receipt_Master
(
    Goods_Receipt_ID        NVARCHAR(30) NOT NULL,
    GR_Number               NVARCHAR(30),

    Purchase_Order_ID       NVARCHAR(30),
    PO_Number               NVARCHAR(30),

    Calendar_Date_Key       INT,

    Receipt_Date            DATE,
    Receipt_DateTime        DATETIME2,

    Vendor_ID               NVARCHAR(30),

    Material_ID             NVARCHAR(30),
    Spare_Part_ID           NVARCHAR(30),
    Product_ID              NVARCHAR(30),

    Warehouse               NVARCHAR(50),
    Bin_Location            NVARCHAR(50),

    Batch_No                NVARCHAR(50),
    Lot_No                  NVARCHAR(50),

    Received_Qty            DECIMAL(18,2),
    Accepted_Qty            DECIMAL(18,2),
    Rejected_Qty            DECIMAL(18,2),

    UOM                     NVARCHAR(20),

    Unit_Cost_USD           DECIMAL(18,2),
    Total_Cost_USD          DECIMAL(18,2),

    Inspection_Status       NVARCHAR(50),

    QC_Inspector_ID         NVARCHAR(30),

    Goods_Receipt_Note      NVARCHAR(100),

    Invoice_Number          NVARCHAR(50),

    Delivery_Note           NVARCHAR(100),

    Lead_Time_Days           INT,

    Plant                   NVARCHAR(50),

    Area                    NVARCHAR(100),

    Status                  NVARCHAR(50),

    Created_Date            DATE,

    Notes                   NVARCHAR(500),

    Load_Date               DATETIME2
        CONSTRAINT DF_GR_LoadDate DEFAULT(GETDATE()),

    CONSTRAINT PK_Goods_Receipt_Master
        PRIMARY KEY (Goods_Receipt_ID)
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
AND TABLE_NAME='Goods_Receipt_Master'
ORDER BY ORDINAL_POSITION;
GO