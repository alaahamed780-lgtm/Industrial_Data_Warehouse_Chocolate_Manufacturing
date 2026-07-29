USE Chocolate_Manufacturing_DW;
GO

/*============================================================
01_Create_Purchase_Orders_Stage.sql
Project : Chocolate Manufacturing Data Warehouse
Module  : Supply Chain
============================================================*/

IF OBJECT_ID('staging.Purchase_Orders_Stage','U') IS NOT NULL
DROP TABLE staging.Purchase_Orders_Stage;
GO

CREATE TABLE staging.Purchase_Orders_Stage
(
    Purchase_Order_ID      NVARCHAR(255),
    PO_Number              NVARCHAR(255),
    PO_Date                NVARCHAR(255),
    Calendar_Date_Key      NVARCHAR(255),

    Vendor_ID              NVARCHAR(255),
    Material_ID            NVARCHAR(255),
    Spare_Part_ID          NVARCHAR(255),
    Product_ID             NVARCHAR(255),

    Purchase_Category      NVARCHAR(255),

    Plant                  NVARCHAR(255),
    Warehouse              NVARCHAR(255),

    Buyer_ID               NVARCHAR(255),

    Currency               NVARCHAR(255),
    Payment_Terms          NVARCHAR(255),
    Incoterms              NVARCHAR(255),

    Delivery_Date          NVARCHAR(255),
    Required_Date          NVARCHAR(255),

    Status                 NVARCHAR(255),
    Priority               NVARCHAR(255),

    Ordered_Qty            NVARCHAR(255),
    Received_Qty           NVARCHAR(255),
    Open_Qty               NVARCHAR(255),

    UOM                    NVARCHAR(255),

    Unit_Price_USD         NVARCHAR(255),
    Total_Amount_USD       NVARCHAR(255),

    Approval_Status        NVARCHAR(255),

    Lead_Time_Days         NVARCHAR(255),

    Reference_Document     NVARCHAR(255),
    Reference_Type         NVARCHAR(255),

    Created_Date           NVARCHAR(255),
    Closed_Date            NVARCHAR(255),

    Notes                  NVARCHAR(255)
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
AND TABLE_NAME='Purchase_Orders_Stage'
ORDER BY ORDINAL_POSITION;
GO