USE Chocolate_Manufacturing_DW;
GO

/*============================================================
05_Load_Inventory_Balance_Master.sql
============================================================*/

TRUNCATE TABLE master.Inventory_Balance_Master;
GO

INSERT INTO master.Inventory_Balance_Master
(
    Inventory_Balance_ID,
    Snapshot_Date,
    Calendar_Date_Key,
    Warehouse,
    Bin_Location,
    Material_ID,
    Spare_Part_ID,
    Product_ID,
    Batch_No,
    Lot_No,
    Quantity_On_Hand,
    Reserved_Qty,
    Available_Qty,
    Reorder_Point,
    Maximum_Stock,
    Safety_Stock,
    UOM,
    Average_Cost_USD,
    Inventory_Value_USD,
    ABC_Class,
    Critical_Item,
    Last_Receipt_Date,
    Last_Issue_Date,
    Last_Count_Date,
    Inventory_Status,
    Plant,
    Area,
    Cycle_Count_Frequency,
    Responsible_Employee_ID,
    Notes
)

SELECT

NULLIF(LTRIM(RTRIM(Inventory_Balance_ID)), ''),

TRY_CONVERT(DATE, Snapshot_Date),

TRY_CONVERT(INT, Calendar_Date_Key),

NULLIF(LTRIM(RTRIM(Warehouse)), ''),
NULLIF(LTRIM(RTRIM(Bin_Location)), ''),

NULLIF(LTRIM(RTRIM(Material_ID)), ''),
NULLIF(LTRIM(RTRIM(Spare_Part_ID)), ''),
NULLIF(LTRIM(RTRIM(Product_ID)), ''),

NULLIF(LTRIM(RTRIM(Batch_No)), ''),
NULLIF(LTRIM(RTRIM(Lot_No)), ''),

TRY_CONVERT(DECIMAL(18,2), Quantity_On_Hand),
TRY_CONVERT(DECIMAL(18,2), Reserved_Qty),
TRY_CONVERT(DECIMAL(18,2), Available_Qty),

TRY_CONVERT(DECIMAL(18,2), Reorder_Point),
TRY_CONVERT(DECIMAL(18,2), Maximum_Stock),
TRY_CONVERT(DECIMAL(18,2), Safety_Stock),

NULLIF(LTRIM(RTRIM(UOM)), ''),

TRY_CONVERT(DECIMAL(18,2), Average_Cost_USD),
TRY_CONVERT(DECIMAL(18,2), Inventory_Value_USD),

NULLIF(LTRIM(RTRIM(ABC_Class)), ''),
NULLIF(LTRIM(RTRIM(Critical_Item)), ''),

TRY_CONVERT(DATE, Last_Receipt_Date),
TRY_CONVERT(DATE, Last_Issue_Date),
TRY_CONVERT(DATE, Last_Count_Date),

NULLIF(LTRIM(RTRIM(Inventory_Status)), ''),

NULLIF(LTRIM(RTRIM(Plant)), ''),
NULLIF(LTRIM(RTRIM(Area)), ''),

NULLIF(LTRIM(RTRIM(Cycle_Count_Frequency)), ''),

NULLIF(LTRIM(RTRIM(Responsible_Employee_ID)), ''),

NULLIF(LTRIM(RTRIM(Notes)), '')

FROM staging.Inventory_Balance_Stage;
GO

/*============================================================
Verify Load
============================================================*/

SELECT COUNT(*) AS Master_Count
FROM master.Inventory_Balance_Master;
GO

SELECT TOP (20) *
FROM master.Inventory_Balance_Master
ORDER BY Inventory_Balance_ID;
GO