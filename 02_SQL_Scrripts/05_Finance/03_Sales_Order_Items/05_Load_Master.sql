USE Chocolate_Manufacturing_DW;
GO

/*============================================================
05_Load_Sales_Order_Items_Master.sql
============================================================*/

TRUNCATE TABLE master.Sales_Order_Items_Master;
GO

INSERT INTO master.Sales_Order_Items_Master
(
    Sales_Order_Item_ID,
    Sales_Order_ID,
    Line_No,
    Product_ID,
    Batch_No,
    Lot_No,
    Warehouse,
    Bin_Location,
    Ordered_Qty,
    Shipped_Qty,
    Delivered_Qty,
    UOM,
    Unit_Price_USD,
    Discount_Percent,
    Discount_USD,
    Tax_Percent,
    Tax_USD,
    Net_Amount_USD,
    Inventory_Balance_ID,
    Production_Order_ID,
    Requested_Date,
    Delivery_Date,
    Item_Status,
    Notes
)

SELECT

NULLIF(LTRIM(RTRIM(Sales_Order_Item_ID)), ''),

NULLIF(LTRIM(RTRIM(Sales_Order_ID)), ''),

TRY_CONVERT(INT, Line_No),

NULLIF(LTRIM(RTRIM(Product_ID)), ''),

NULLIF(LTRIM(RTRIM(Batch_No)), ''),

NULLIF(LTRIM(RTRIM(Lot_No)), ''),

NULLIF(LTRIM(RTRIM(Warehouse)), ''),

NULLIF(LTRIM(RTRIM(Bin_Location)), ''),

TRY_CONVERT(DECIMAL(18,2), Ordered_Qty),

TRY_CONVERT(DECIMAL(18,2), Shipped_Qty),

TRY_CONVERT(DECIMAL(18,2), Delivered_Qty),

NULLIF(LTRIM(RTRIM(UOM)), ''),

TRY_CONVERT(DECIMAL(18,2), Unit_Price_USD),

TRY_CONVERT(DECIMAL(18,2), Discount_Percent),

TRY_CONVERT(DECIMAL(18,2), Discount_USD),

TRY_CONVERT(DECIMAL(18,2), Tax_Percent),

TRY_CONVERT(DECIMAL(18,2), Tax_USD),

TRY_CONVERT(DECIMAL(18,2), Net_Amount_USD),

NULLIF(LTRIM(RTRIM(Inventory_Balance_ID)), ''),

NULLIF(LTRIM(RTRIM(Production_Order_ID)), ''),

TRY_CONVERT(DATE, Requested_Date),

TRY_CONVERT(DATE, Delivery_Date),

NULLIF(LTRIM(RTRIM(Item_Status)), ''),

NULLIF(LTRIM(RTRIM(Notes)), '')

FROM staging.Sales_Order_Items_Stage;
GO

/*============================================================
Verify Load
============================================================*/

SELECT COUNT(*) AS Master_Count
FROM master.Sales_Order_Items_Master;
GO

SELECT TOP (20) *
FROM master.Sales_Order_Items_Master
ORDER BY Sales_Order_Item_ID;
GO