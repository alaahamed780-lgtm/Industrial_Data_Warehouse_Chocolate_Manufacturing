USE Chocolate_Manufacturing_DW;
GO

/*============================================================
05_Load_Purchase_Orders_Master.sql
============================================================*/

TRUNCATE TABLE master.Purchase_Orders_Master;
GO

INSERT INTO master.Purchase_Orders_Master
(
    Purchase_Order_ID,
    PO_Number,
    PO_Date,
    Calendar_Date_Key,
    Vendor_ID,
    Material_ID,
    Spare_Part_ID,
    Product_ID,
    Purchase_Category,
    Plant,
    Warehouse,
    Buyer_ID,
    Currency,
    Payment_Terms,
    Incoterms,
    Delivery_Date,
    Required_Date,
    Status,
    Priority,
    Ordered_Qty,
    Received_Qty,
    Open_Qty,
    UOM,
    Unit_Price_USD,
    Total_Amount_USD,
    Approval_Status,
    Lead_Time_Days,
    Reference_Document,
    Reference_Type,
    Created_Date,
    Closed_Date,
    Notes
)

SELECT

NULLIF(LTRIM(RTRIM(Purchase_Order_ID)), ''),
NULLIF(LTRIM(RTRIM(PO_Number)), ''),

TRY_CONVERT(DATE, PO_Date),

TRY_CONVERT(INT, Calendar_Date_Key),

NULLIF(LTRIM(RTRIM(Vendor_ID)), ''),
NULLIF(LTRIM(RTRIM(Material_ID)), ''),
NULLIF(LTRIM(RTRIM(Spare_Part_ID)), ''),
NULLIF(LTRIM(RTRIM(Product_ID)), ''),

NULLIF(LTRIM(RTRIM(Purchase_Category)), ''),

NULLIF(LTRIM(RTRIM(Plant)), ''),
NULLIF(LTRIM(RTRIM(Warehouse)), ''),

NULLIF(LTRIM(RTRIM(Buyer_ID)), ''),

NULLIF(LTRIM(RTRIM(Currency)), ''),
NULLIF(LTRIM(RTRIM(Payment_Terms)), ''),
NULLIF(LTRIM(RTRIM(Incoterms)), ''),

TRY_CONVERT(DATE, Delivery_Date),
TRY_CONVERT(DATE, Required_Date),

NULLIF(LTRIM(RTRIM(Status)), ''),
NULLIF(LTRIM(RTRIM(Priority)), ''),

TRY_CONVERT(DECIMAL(18,2), Ordered_Qty),
TRY_CONVERT(DECIMAL(18,2), Received_Qty),
TRY_CONVERT(DECIMAL(18,2), Open_Qty),

NULLIF(LTRIM(RTRIM(UOM)), ''),

TRY_CONVERT(DECIMAL(18,2), Unit_Price_USD),
TRY_CONVERT(DECIMAL(18,2), Total_Amount_USD),

NULLIF(LTRIM(RTRIM(Approval_Status)), ''),

TRY_CONVERT(INT, Lead_Time_Days),

NULLIF(LTRIM(RTRIM(Reference_Document)), ''),
NULLIF(LTRIM(RTRIM(Reference_Type)), ''),

TRY_CONVERT(DATE, Created_Date),
TRY_CONVERT(DATE, Closed_Date),

NULLIF(LTRIM(RTRIM(Notes)), '')

FROM staging.Purchase_Orders_Stage;
GO

/*============================================================
Verify Load
============================================================*/

SELECT COUNT(*) AS Master_Count
FROM master.Purchase_Orders_Master;
GO

SELECT TOP (20) *
FROM master.Purchase_Orders_Master
ORDER BY Purchase_Order_ID;
GO