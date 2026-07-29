USE Chocolate_Manufacturing_DW;
GO

/*==============================================================
 Load Data
 From staging.Inventory_Transactions_Stage
 To   master.Inventory_Transactions_Master
==============================================================*/

TRUNCATE TABLE master.Inventory_Transactions_Master;
GO

INSERT INTO master.Inventory_Transactions_Master
(
    Inventory_Transaction_ID,
    Transaction_No,
    Transaction_Type,
    Movement_Type,
    Calendar_Date_Key,
    Transaction_Date,
    Transaction_DateTime,
    Spare_Part_ID,
    Material_ID,
    Product_ID,
    Warehouse,
    Bin_Location,
    Batch_No,
    Lot_No,
    Reference_Document,
    Reference_Type,
    Work_Order_ID,
    Production_Order_ID,
    Vendor_ID,
    Quantity,
    UOM,
    Unit_Cost_USD,
    Extended_Cost_USD,
    Stock_Before,
    Stock_After,
    Employee_ID,
    Approval_Status,
    Reason_Code,
    Plant,
    Area,
    Status,
    Notes
)

SELECT

Inventory_Transaction_ID,
Transaction_No,
Transaction_Type,

TRY_CONVERT(INT,Movement_Type),

TRY_CONVERT(INT,Calendar_Date_Key),

TRY_CONVERT(DATE,Transaction_Date),

TRY_CONVERT(DATETIME2,Transaction_DateTime),

Spare_Part_ID,
Material_ID,
Product_ID,

Warehouse,
Bin_Location,
Batch_No,
Lot_No,

Reference_Document,
Reference_Type,
Work_Order_ID,
Production_Order_ID,
Vendor_ID,

TRY_CONVERT(DECIMAL(18,2),Quantity),

UOM,

TRY_CONVERT(DECIMAL(18,2),Unit_Cost_USD),

TRY_CONVERT(DECIMAL(18,2),Extended_Cost_USD),

TRY_CONVERT(DECIMAL(18,2),Stock_Before),

TRY_CONVERT(DECIMAL(18,2),Stock_After),

Employee_ID,
Approval_Status,
Reason_Code,

Plant,
Area,
Status,
Notes

FROM staging.Inventory_Transactions_Stage;
GO


/*==============================================================
 Verify Load
==============================================================*/

SELECT COUNT(*) AS MasterRows
FROM master.Inventory_Transactions_Master;
GO

SELECT TOP (20) *
FROM master.Inventory_Transactions_Master
ORDER BY Inventory_Transaction_ID;
GO