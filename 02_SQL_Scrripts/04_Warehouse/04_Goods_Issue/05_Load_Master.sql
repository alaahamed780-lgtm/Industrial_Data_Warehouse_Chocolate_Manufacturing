USE Chocolate_Manufacturing_DW;
GO

/*============================================================
05_Load_Goods_Issue_Master.sql
============================================================*/

TRUNCATE TABLE master.Goods_Issue_Master;
GO

INSERT INTO master.Goods_Issue_Master
(
    Goods_Issue_ID,
    GI_Number,
    Calendar_Date_Key,
    Issue_Date,
    Issue_DateTime,
    Issue_Type,
    Movement_Type,
    Warehouse,
    Bin_Location,
    Material_ID,
    Spare_Part_ID,
    Product_ID,
    Work_Order_ID,
    Production_Order_ID,
    Equipment_ID,
    Requested_By,
    Issued_By,
    Approved_By,
    Quantity,
    UOM,
    Unit_Cost_USD,
    Extended_Cost_USD,
    Stock_Before,
    Stock_After,
    Batch_No,
    Lot_No,
    Reason_Code,
    Reference_Document,
    Reference_Type,
    Plant,
    Area,
    Status,
    Notes
)

SELECT

NULLIF(LTRIM(RTRIM(Goods_Issue_ID)), ''),
NULLIF(LTRIM(RTRIM(GI_Number)), ''),

TRY_CONVERT(INT, Calendar_Date_Key),

TRY_CONVERT(DATE, Issue_Date),

TRY_CONVERT(DATETIME2, Issue_DateTime),

NULLIF(LTRIM(RTRIM(Issue_Type)), ''),
NULLIF(LTRIM(RTRIM(Movement_Type)), ''),

NULLIF(LTRIM(RTRIM(Warehouse)), ''),
NULLIF(LTRIM(RTRIM(Bin_Location)), ''),

NULLIF(LTRIM(RTRIM(Material_ID)), ''),
NULLIF(LTRIM(RTRIM(Spare_Part_ID)), ''),
NULLIF(LTRIM(RTRIM(Product_ID)), ''),

NULLIF(LTRIM(RTRIM(Work_Order_ID)), ''),
NULLIF(LTRIM(RTRIM(Production_Order_ID)), ''),

NULLIF(LTRIM(RTRIM(Equipment_ID)), ''),

NULLIF(LTRIM(RTRIM(Requested_By)), ''),
NULLIF(LTRIM(RTRIM(Issued_By)), ''),
NULLIF(LTRIM(RTRIM(Approved_By)), ''),

TRY_CONVERT(DECIMAL(18,2), Quantity),

NULLIF(LTRIM(RTRIM(UOM)), ''),

TRY_CONVERT(DECIMAL(18,2), Unit_Cost_USD),
TRY_CONVERT(DECIMAL(18,2), Extended_Cost_USD),

TRY_CONVERT(DECIMAL(18,2), Stock_Before),
TRY_CONVERT(DECIMAL(18,2), Stock_After),

NULLIF(LTRIM(RTRIM(Batch_No)), ''),
NULLIF(LTRIM(RTRIM(Lot_No)), ''),

NULLIF(LTRIM(RTRIM(Reason_Code)), ''),

NULLIF(LTRIM(RTRIM(Reference_Document)), ''),

NULLIF(LTRIM(RTRIM(Reference_Type)), ''),

NULLIF(LTRIM(RTRIM(Plant)), ''),

NULLIF(LTRIM(RTRIM(Area)), ''),

NULLIF(LTRIM(RTRIM(Status)), ''),

NULLIF(LTRIM(RTRIM(Notes)), '')

FROM staging.Goods_Issue_Stage;
GO

/*============================================================
Verify Load
============================================================*/

SELECT COUNT(*) AS Master_Count
FROM master.Goods_Issue_Master;
GO

SELECT TOP (20) *
FROM master.Goods_Issue_Master
ORDER BY Goods_Issue_ID;
GO