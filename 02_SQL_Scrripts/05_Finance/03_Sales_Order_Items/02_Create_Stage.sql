USE Chocolate_Manufacturing_DW;
GO

/*============================================================
01_Create_Sales_Order_Items_Stage.sql
============================================================*/

IF OBJECT_ID('staging.Sales_Order_Items_Stage','U') IS NOT NULL
    DROP TABLE staging.Sales_Order_Items_Stage;
GO

CREATE TABLE staging.Sales_Order_Items_Stage
(
    Sales_Order_Item_ID NVARCHAR(50),

    Sales_Order_ID NVARCHAR(50),

    Line_No NVARCHAR(20),

    Product_ID NVARCHAR(50),

    Batch_No NVARCHAR(50),

    Lot_No NVARCHAR(50),

    Warehouse NVARCHAR(50),

    Bin_Location NVARCHAR(50),

    Ordered_Qty NVARCHAR(30),

    Shipped_Qty NVARCHAR(30),

    Delivered_Qty NVARCHAR(30),

    UOM NVARCHAR(20),

    Unit_Price_USD NVARCHAR(30),

    Discount_Percent NVARCHAR(30),

    Discount_USD NVARCHAR(30),

    Tax_Percent NVARCHAR(30),

    Tax_USD NVARCHAR(30),

    Net_Amount_USD NVARCHAR(30),

    Inventory_Balance_ID NVARCHAR(50),

    Production_Order_ID NVARCHAR(50),

    Requested_Date NVARCHAR(30),

    Delivery_Date NVARCHAR(30),

    Item_Status NVARCHAR(50),

    Notes NVARCHAR(500)
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
AND TABLE_NAME='Sales_Order_Items_Stage'
ORDER BY ORDINAL_POSITION;
GO