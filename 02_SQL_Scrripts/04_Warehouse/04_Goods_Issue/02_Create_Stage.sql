USE Chocolate_Manufacturing_DW;
GO

/*============================================================
01_Create_Goods_Issue_Stage.sql
============================================================*/

IF OBJECT_ID('staging.Goods_Issue_Stage','U') IS NOT NULL
    DROP TABLE staging.Goods_Issue_Stage;
GO

CREATE TABLE staging.Goods_Issue_Stage
(
    Goods_Issue_ID          NVARCHAR(255),
    GI_Number               NVARCHAR(255),

    Calendar_Date_Key       NVARCHAR(255),

    Issue_Date              NVARCHAR(255),
    Issue_DateTime          NVARCHAR(255),

    Issue_Type              NVARCHAR(255),
    Movement_Type           NVARCHAR(255),

    Warehouse               NVARCHAR(255),
    Bin_Location            NVARCHAR(255),

    Material_ID             NVARCHAR(255),
    Spare_Part_ID           NVARCHAR(255),
    Product_ID              NVARCHAR(255),

    Work_Order_ID           NVARCHAR(255),
    Production_Order_ID     NVARCHAR(255),

    Equipment_ID            NVARCHAR(255),

    Requested_By            NVARCHAR(255),
    Issued_By               NVARCHAR(255),
    Approved_By             NVARCHAR(255),

    Quantity                NVARCHAR(255),

    UOM                     NVARCHAR(255),

    Unit_Cost_USD           NVARCHAR(255),
    Extended_Cost_USD       NVARCHAR(255),

    Stock_Before            NVARCHAR(255),
    Stock_After             NVARCHAR(255),

    Batch_No                NVARCHAR(255),
    Lot_No                  NVARCHAR(255),

    Reason_Code             NVARCHAR(255),

    Reference_Document      NVARCHAR(255),
    Reference_Type          NVARCHAR(255),

    Plant                   NVARCHAR(255),
    Area                    NVARCHAR(255),

    Status                  NVARCHAR(255),

    Notes                   NVARCHAR(255)
);
GO


/*============================================================
Verify Table
============================================================*/

SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='staging'
AND TABLE_NAME='Goods_Issue_Stage'
ORDER BY ORDINAL_POSITION;
GO