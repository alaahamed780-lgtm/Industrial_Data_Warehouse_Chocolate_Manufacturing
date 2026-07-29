USE Chocolate_Manufacturing_DW;
GO

/*============================================================
04_Create_Sales_Order_Items_Master.sql
============================================================*/

IF OBJECT_ID('master.Sales_Order_Items_Master','U') IS NOT NULL
    DROP TABLE master.Sales_Order_Items_Master;
GO

CREATE TABLE master.Sales_Order_Items_Master
(
    Sales_Order_Item_ID NVARCHAR(50) NOT NULL,

    Sales_Order_ID NVARCHAR(50),

    Line_No INT,

    Product_ID NVARCHAR(50),

    Batch_No NVARCHAR(50),

    Lot_No NVARCHAR(50),

    Warehouse NVARCHAR(50),

    Bin_Location NVARCHAR(50),

    Ordered_Qty DECIMAL(18,2),

    Shipped_Qty DECIMAL(18,2),

    Delivered_Qty DECIMAL(18,2),

    UOM NVARCHAR(20),

    Unit_Price_USD DECIMAL(18,2),

    Discount_Percent DECIMAL(18,2),

    Discount_USD DECIMAL(18,2),

    Tax_Percent DECIMAL(18,2),

    Tax_USD DECIMAL(18,2),

    Net_Amount_USD DECIMAL(18,2),

    Inventory_Balance_ID NVARCHAR(50),

    Production_Order_ID NVARCHAR(50),

    Requested_Date DATE,

    Delivery_Date DATE,

    Item_Status NVARCHAR(50),

    Notes NVARCHAR(500),

    Load_Date DATETIME2
        CONSTRAINT DF_Sales_Order_Items_Master_LoadDate
        DEFAULT(GETDATE()),

    CONSTRAINT PK_Sales_Order_Items_Master
        PRIMARY KEY (Sales_Order_Item_ID)
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
AND TABLE_NAME='Sales_Order_Items_Master'
ORDER BY ORDINAL_POSITION;
GO