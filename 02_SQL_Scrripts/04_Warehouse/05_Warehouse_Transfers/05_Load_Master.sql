USE Chocolate_Manufacturing_DW;
GO

/*============================================================
05_Load_Warehouse_Transfers_Master.sql
============================================================*/

TRUNCATE TABLE master.Warehouse_Transfers_Master;
GO

INSERT INTO master.Warehouse_Transfers_Master
(
    Warehouse_Transfer_ID,
    Transfer_Number,
    Calendar_Date_Key,
    Transfer_Date,
    Transfer_DateTime,
    Transfer_Type,
    Material_ID,
    Spare_Part_ID,
    Product_ID,
    From_Warehouse,
    From_Bin,
    To_Warehouse,
    To_Bin,
    Quantity,
    UOM,
    Unit_Cost_USD,
    Extended_Cost_USD,
    Stock_Before_From,
    Stock_After_From,
    Stock_Before_To,
    Stock_After_To,
    Batch_No,
    Lot_No,
    Requested_By,
    Approved_By,
    Executed_By,
    Reason_Code,
    Reference_Document,
    Reference_Type,
    Plant,
    Area,
    Status,
    Notes
)

SELECT

NULLIF(LTRIM(RTRIM(Warehouse_Transfer_ID)), ''),
NULLIF(LTRIM(RTRIM(Transfer_Number)), ''),

TRY_CONVERT(INT, Calendar_Date_Key),

TRY_CONVERT(DATE, Transfer_Date),

TRY_CONVERT(DATETIME2, Transfer_DateTime),

NULLIF(LTRIM(RTRIM(Transfer_Type)), ''),

NULLIF(LTRIM(RTRIM(Material_ID)), ''),
NULLIF(LTRIM(RTRIM(Spare_Part_ID)), ''),
NULLIF(LTRIM(RTRIM(Product_ID)), ''),

NULLIF(LTRIM(RTRIM(From_Warehouse)), ''),
NULLIF(LTRIM(RTRIM(From_Bin)), ''),

NULLIF(LTRIM(RTRIM(To_Warehouse)), ''),
NULLIF(LTRIM(RTRIM(To_Bin)), ''),

TRY_CONVERT(DECIMAL(18,2), Quantity),

NULLIF(LTRIM(RTRIM(UOM)), ''),

TRY_CONVERT(DECIMAL(18,2), Unit_Cost_USD),
TRY_CONVERT(DECIMAL(18,2), Extended_Cost_USD),

TRY_CONVERT(DECIMAL(18,2), Stock_Before_From),
TRY_CONVERT(DECIMAL(18,2), Stock_After_From),

TRY_CONVERT(DECIMAL(18,2), Stock_Before_To),
TRY_CONVERT(DECIMAL(18,2), Stock_After_To),

NULLIF(LTRIM(RTRIM(Batch_No)), ''),
NULLIF(LTRIM(RTRIM(Lot_No)), ''),

NULLIF(LTRIM(RTRIM(Requested_By)), ''),
NULLIF(LTRIM(RTRIM(Approved_By)), ''),
NULLIF(LTRIM(RTRIM(Executed_By)), ''),

NULLIF(LTRIM(RTRIM(Reason_Code)), ''),

NULLIF(LTRIM(RTRIM(Reference_Document)), ''),
NULLIF(LTRIM(RTRIM(Reference_Type)), ''),

NULLIF(LTRIM(RTRIM(Plant)), ''),
NULLIF(LTRIM(RTRIM(Area)), ''),

NULLIF(LTRIM(RTRIM(Status)), ''),

NULLIF(LTRIM(RTRIM(Notes)), '')

FROM staging.Warehouse_Transfers_Stage;
GO

/*============================================================
Verify Load
============================================================*/

SELECT COUNT(*) AS Master_Count
FROM master.Warehouse_Transfers_Master;
GO

SELECT TOP (20) *
FROM master.Warehouse_Transfers_Master
ORDER BY Warehouse_Transfer_ID;
GO