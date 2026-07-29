USE Chocolate_Manufacturing_DW;
GO

/*============================================================
04_Create_Purchase_Orders_Master.sql
============================================================*/

IF OBJECT_ID('master.Purchase_Orders_Master','U') IS NOT NULL
    DROP TABLE master.Purchase_Orders_Master;
GO

CREATE TABLE master.Purchase_Orders_Master
(
    Purchase_Order_ID       NVARCHAR(30) NOT NULL,
    PO_Number               NVARCHAR(30),

    PO_Date                 DATE,
    Calendar_Date_Key       INT,

    Vendor_ID               NVARCHAR(30),
    Material_ID             NVARCHAR(30),
    Spare_Part_ID           NVARCHAR(30),
    Product_ID              NVARCHAR(30),

    Purchase_Category       NVARCHAR(50),

    Plant                   NVARCHAR(50),
    Warehouse               NVARCHAR(50),

    Buyer_ID                NVARCHAR(30),

    Currency                NVARCHAR(10),
    Payment_Terms           NVARCHAR(50),
    Incoterms               NVARCHAR(30),

    Delivery_Date           DATE,
    Required_Date           DATE,

    Status                  NVARCHAR(30),
    Priority                NVARCHAR(30),

    Ordered_Qty             DECIMAL(18,2),
    Received_Qty            DECIMAL(18,2),
    Open_Qty                DECIMAL(18,2),

    UOM                     NVARCHAR(20),

    Unit_Price_USD          DECIMAL(18,2),
    Total_Amount_USD        DECIMAL(18,2),

    Approval_Status         NVARCHAR(30),

    Lead_Time_Days          INT,

    Reference_Document      NVARCHAR(50),
    Reference_Type          NVARCHAR(50),

    Created_Date            DATE,
    Closed_Date             DATE,

    Notes                   NVARCHAR(500),

    Load_Date               DATETIME2
        CONSTRAINT DF_PO_LoadDate DEFAULT(GETDATE()),

    CONSTRAINT PK_Purchase_Orders_Master
        PRIMARY KEY (Purchase_Order_ID)
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
AND TABLE_NAME='Purchase_Orders_Master'
ORDER BY ORDINAL_POSITION;
GO