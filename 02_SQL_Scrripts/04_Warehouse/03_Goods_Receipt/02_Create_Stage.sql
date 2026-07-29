USE Chocolate_Manufacturing_DW;
GO

/*============================================================
01_Create_Goods_Receipt_Stage.sql
Project : Chocolate Manufacturing Data Warehouse
Module  : Supply Chain
============================================================*/

IF OBJECT_ID('staging.Goods_Receipt_Stage','U') IS NOT NULL
DROP TABLE staging.Goods_Receipt_Stage;
GO

CREATE TABLE staging.Goods_Receipt_Stage
(
    Goods_Receipt_ID        NVARCHAR(255),
    GR_Number               NVARCHAR(255),
    Purchase_Order_ID       NVARCHAR(255),
    PO_Number               NVARCHAR(255),

    Calendar_Date_Key       NVARCHAR(255),

    Receipt_Date            NVARCHAR(255),
    Receipt_DateTime        NVARCHAR(255),

    Vendor_ID               NVARCHAR(255),

    Material_ID             NVARCHAR(255),
    Spare_Part_ID           NVARCHAR(255),
    Product_ID              NVARCHAR(255),

    Warehouse               NVARCHAR(255),
    Bin_Location            NVARCHAR(255),

    Batch_No                NVARCHAR(255),
    Lot_No                  NVARCHAR(255),

    Received_Qty            NVARCHAR(255),
    Accepted_Qty            NVARCHAR(255),
    Rejected_Qty            NVARCHAR(255),

    UOM                     NVARCHAR(255),

    Unit_Cost_USD           NVARCHAR(255),
    Total_Cost_USD          NVARCHAR(255),

    Inspection_Status       NVARCHAR(255),

    QC_Inspector_ID         NVARCHAR(255),

    Goods_Receipt_Note      NVARCHAR(255),

    Invoice_Number          NVARCHAR(255),

    Delivery_Note           NVARCHAR(255),

    Lead_Time_Days          NVARCHAR(255),

    Plant                   NVARCHAR(255),

    Area                    NVARCHAR(255),

    Status                  NVARCHAR(255),

    Created_Date            NVARCHAR(255),

    Notes                   NVARCHAR(255)
);
GO

/*============================================================
Verify Table
============================================================*/

SELECT
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='staging'
AND TABLE_NAME='Goods_Receipt_Stage'
ORDER BY ORDINAL_POSITION;
GO