USE Chocolate_Manufacturing_DW;
GO

/*============================================================
05_Load_Sales_Orders_Master.sql
============================================================*/

TRUNCATE TABLE master.Sales_Orders_Master;
GO

INSERT INTO master.Sales_Orders_Master
(
    Sales_Order_ID,
    Sales_Order_No,
    Customer_ID,
    Calendar_Date_Key,
    Order_Date,
    Requested_Delivery_Date,
    Promised_Delivery_Date,
    Order_Status,
    Priority,
    Sales_Channel,
    Sales_Region,
    Currency,
    Payment_Terms,
    Warehouse,
    Sales_Manager_ID,
    Total_Items,
    Ordered_Qty,
    Net_Amount_USD,
    Discount_USD,
    Tax_USD,
    Grand_Total_USD,
    Production_Order_ID,
    Shipment_Status,
    Delivery_Status,
    Created_By,
    Approved_By,
    Plant,
    Notes
)

SELECT

NULLIF(LTRIM(RTRIM(Sales_Order_ID)), ''),

NULLIF(LTRIM(RTRIM(Sales_Order_No)), ''),

NULLIF(LTRIM(RTRIM(Customer_ID)), ''),

TRY_CONVERT(INT, Calendar_Date_Key),

TRY_CONVERT(DATE, Order_Date),

TRY_CONVERT(DATE, Requested_Delivery_Date),

TRY_CONVERT(DATE, Promised_Delivery_Date),

NULLIF(LTRIM(RTRIM(Order_Status)), ''),

NULLIF(LTRIM(RTRIM(Priority)), ''),

NULLIF(LTRIM(RTRIM(Sales_Channel)), ''),

NULLIF(LTRIM(RTRIM(Sales_Region)), ''),

NULLIF(LTRIM(RTRIM(Currency)), ''),

NULLIF(LTRIM(RTRIM(Payment_Terms)), ''),

NULLIF(LTRIM(RTRIM(Warehouse)), ''),

NULLIF(LTRIM(RTRIM(Sales_Manager_ID)), ''),

TRY_CONVERT(INT, Total_Items),

TRY_CONVERT(DECIMAL(18,2), Ordered_Qty),

TRY_CONVERT(DECIMAL(18,2), Net_Amount_USD),

TRY_CONVERT(DECIMAL(18,2), Discount_USD),

TRY_CONVERT(DECIMAL(18,2), Tax_USD),

TRY_CONVERT(DECIMAL(18,2), Grand_Total_USD),

NULLIF(LTRIM(RTRIM(Production_Order_ID)), ''),

NULLIF(LTRIM(RTRIM(Shipment_Status)), ''),

NULLIF(LTRIM(RTRIM(Delivery_Status)), ''),

NULLIF(LTRIM(RTRIM(Created_By)), ''),

NULLIF(LTRIM(RTRIM(Approved_By)), ''),

NULLIF(LTRIM(RTRIM(Plant)), ''),

NULLIF(LTRIM(RTRIM(Notes)), '')

FROM staging.Sales_Orders_Stage;
GO

/*============================================================
Verify Load
============================================================*/

SELECT COUNT(*) AS Master_Count
FROM master.Sales_Orders_Master;
GO

SELECT TOP (20) *
FROM master.Sales_Orders_Master
ORDER BY Sales_Order_ID;
GO