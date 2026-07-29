USE Chocolate_Manufacturing_DW;
GO

/*============================================================
05_Load_Goods_Receipt_Master.sql
============================================================*/

TRUNCATE TABLE master.Goods_Receipt_Master;
GO

INSERT INTO master.Goods_Receipt_Master
(
    Goods_Receipt_ID,
    GR_Number,
    Purchase_Order_ID,
    PO_Number,
    Calendar_Date_Key,
    Receipt_Date,
    Receipt_DateTime,
    Vendor_ID,
    Material_ID,
    Spare_Part_ID,
    Product_ID,
    Warehouse,
    Bin_Location,
    Batch_No,
    Lot_No,
    Received_Qty,
    Accepted_Qty,
    Rejected_Qty,
    UOM,
    Unit_Cost_USD,
    Total_Cost_USD,
    Inspection_Status,
    QC_Inspector_ID,
    Goods_Receipt_Note,
    Invoice_Number,
    Delivery_Note,
    Lead_Time_Days,
    Plant,
    Area,
    Status,
    Created_Date,
    Notes
)

SELECT

NULLIF(LTRIM(RTRIM(Goods_Receipt_ID)), ''),
NULLIF(LTRIM(RTRIM(GR_Number)), ''),

NULLIF(LTRIM(RTRIM(Purchase_Order_ID)), ''),
NULLIF(LTRIM(RTRIM(PO_Number)), ''),

TRY_CONVERT(INT, Calendar_Date_Key),

TRY_CONVERT(DATE, Receipt_Date),

TRY_CONVERT(DATETIME2, Receipt_DateTime),

NULLIF(LTRIM(RTRIM(Vendor_ID)), ''),

NULLIF(LTRIM(RTRIM(Material_ID)), ''),
NULLIF(LTRIM(RTRIM(Spare_Part_ID)), ''),
NULLIF(LTRIM(RTRIM(Product_ID)), ''),

NULLIF(LTRIM(RTRIM(Warehouse)), ''),
NULLIF(LTRIM(RTRIM(Bin_Location)), ''),

NULLIF(LTRIM(RTRIM(Batch_No)), ''),
NULLIF(LTRIM(RTRIM(Lot_No)), ''),

TRY_CONVERT(DECIMAL(18,2), Received_Qty),
TRY_CONVERT(DECIMAL(18,2), Accepted_Qty),
TRY_CONVERT(DECIMAL(18,2), Rejected_Qty),

NULLIF(LTRIM(RTRIM(UOM)), ''),

TRY_CONVERT(DECIMAL(18,2), Unit_Cost_USD),
TRY_CONVERT(DECIMAL(18,2), Total_Cost_USD),

NULLIF(LTRIM(RTRIM(Inspection_Status)), ''),

NULLIF(LTRIM(RTRIM(QC_Inspector_ID)), ''),

NULLIF(LTRIM(RTRIM(Goods_Receipt_Note)), ''),

NULLIF(LTRIM(RTRIM(Invoice_Number)), ''),

NULLIF(LTRIM(RTRIM(Delivery_Note)), ''),

TRY_CONVERT(INT, Lead_Time_Days),

NULLIF(LTRIM(RTRIM(Plant)), ''),

NULLIF(LTRIM(RTRIM(Area)), ''),

NULLIF(LTRIM(RTRIM(Status)), ''),

TRY_CONVERT(DATE, Created_Date),

NULLIF(LTRIM(RTRIM(Notes)), '')

FROM staging.Goods_Receipt_Stage;
GO

/*============================================================
Verify Load
============================================================*/

SELECT COUNT(*) AS Master_Count
FROM master.Goods_Receipt_Master;
GO

SELECT TOP (20) *
FROM master.Goods_Receipt_Master
ORDER BY Goods_Receipt_ID;
GO