USE Chocolate_Manufacturing_DW;
GO

/*==============================================================
  Clear Master Table
==============================================================*/

TRUNCATE TABLE master.Work_Order_Materials_Master;
GO

/*==============================================================
  Load Data into Master
==============================================================*/

INSERT INTO master.Work_Order_Materials_Master
(
    Material_Transaction_ID,
    Work_Order_ID,
    Operation_ID,
    Equipment_ID,
    Component_ID,
    Spare_Part_ID,
    Part_Number,
    Warehouse,
    Bin_Location,
    Issue_Date,
    Requested_Qty,
    Issued_Qty,
    Returned_Qty,
    Unit,
    Unit_Cost_USD,
    Extended_Cost_USD,
    Currency,
    Batch_Number,
    Serial_Number,
    Vendor_ID,
    Reservation_No,
    Movement_Type,
    Stock_Before,
    Stock_After,
    Critical_Spare,
    ABC_Class,
    Material_Status,
    Issued_By_Employee_ID,
    Approved_By_Employee_ID,
    Cost_Center,
    Plant,
    Area,
    Notes
)

SELECT

NULLIF(LTRIM(RTRIM(Material_Transaction_ID)),''),

NULLIF(LTRIM(RTRIM(Work_Order_ID)),''),

NULLIF(LTRIM(RTRIM(Operation_ID)),''),

NULLIF(LTRIM(RTRIM(Equipment_ID)),''),

NULLIF(LTRIM(RTRIM(Component_ID)),''),

NULLIF(LTRIM(RTRIM(Spare_Part_ID)),''),

NULLIF(LTRIM(RTRIM(Part_Number)),''),

NULLIF(LTRIM(RTRIM(Warehouse)),''),

NULLIF(LTRIM(RTRIM(Bin_Location)),''),

TRY_CONVERT(DATETIME2,Issue_Date),

TRY_CONVERT(DECIMAL(18,2),Requested_Qty),

TRY_CONVERT(DECIMAL(18,2),Issued_Qty),

TRY_CONVERT(DECIMAL(18,2),Returned_Qty),

NULLIF(LTRIM(RTRIM(Unit)),''),

TRY_CONVERT(DECIMAL(18,2),Unit_Cost_USD),

TRY_CONVERT(DECIMAL(18,2),Extended_Cost_USD),

NULLIF(LTRIM(RTRIM(Currency)),''),

NULLIF(LTRIM(RTRIM(Batch_Number)),''),

NULLIF(LTRIM(RTRIM(Serial_Number)),''),

NULLIF(LTRIM(RTRIM(Vendor_ID)),''),

NULLIF(LTRIM(RTRIM(Reservation_No)),''),

NULLIF(LTRIM(RTRIM(Movement_Type)),''),

TRY_CONVERT(DECIMAL(18,2),Stock_Before),

TRY_CONVERT(DECIMAL(18,2),Stock_After),

CASE
    WHEN UPPER(LTRIM(RTRIM(Critical_Spare))) IN ('YES','TRUE','1')
        THEN 1
    ELSE 0
END,

NULLIF(LTRIM(RTRIM(ABC_Class)),''),

NULLIF(LTRIM(RTRIM(Material_Status)),''),

NULLIF(LTRIM(RTRIM(Issued_By_Employee_ID)),''),

NULLIF(LTRIM(RTRIM(Approved_By_Employee_ID)),''),

NULLIF(LTRIM(RTRIM(Cost_Center)),''),

NULLIF(LTRIM(RTRIM(Plant)),''),

NULLIF(LTRIM(RTRIM(Area)),''),

NULLIF(LTRIM(RTRIM(Notes)),'')

FROM staging.Work_Order_Materials_Stage;
GO