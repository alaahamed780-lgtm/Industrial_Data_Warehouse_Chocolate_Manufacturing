USE Chocolate_Manufacturing_DW;
GO

TRUNCATE TABLE master.Spare_Parts_Master;
GO

INSERT INTO master.Spare_Parts_Master
(
    Spare_Part_ID,
    Part_Number,
    Part_Name,
    Category,
    Component_ID,
    Equipment_ID,
    Manufacturer,
    Vendor_Code,
    Unit,
    Critical_Spare,
    ABC_Class,
    Min_Stock,
    Max_Stock,
    Reorder_Point,
    Current_Stock,
    Lead_Time_Days,
    Unit_Cost_USD,
    Warehouse,
    Bin_Location,
    Status,
    Plant,
    Area,
    Notes
)

SELECT

NULLIF(LTRIM(RTRIM(Spare_Part_ID)),''),

NULLIF(LTRIM(RTRIM(Part_Number)),''),

NULLIF(LTRIM(RTRIM(Part_Name)),''),

NULLIF(LTRIM(RTRIM(Category)),''),

NULLIF(LTRIM(RTRIM(Component_ID)),''),

NULLIF(LTRIM(RTRIM(Equipment_ID)),''),

NULLIF(LTRIM(RTRIM(Manufacturer)),''),

NULLIF(LTRIM(RTRIM(Vendor_Code)),''),

NULLIF(LTRIM(RTRIM(Unit)),''),

NULLIF(LTRIM(RTRIM(Critical_Spare)),''),

NULLIF(LTRIM(RTRIM(ABC_Class)),''),

TRY_CONVERT(SMALLINT,Min_Stock),

TRY_CONVERT(SMALLINT,Max_Stock),

TRY_CONVERT(SMALLINT,Reorder_Point),

TRY_CONVERT(SMALLINT,Current_Stock),

TRY_CONVERT(SMALLINT,Lead_Time_Days),

TRY_CONVERT(DECIMAL(18,2),Unit_Cost_USD),

NULLIF(LTRIM(RTRIM(Warehouse)),''),

NULLIF(LTRIM(RTRIM(Bin_Location)),''),

NULLIF(LTRIM(RTRIM(Status)),''),

NULLIF(LTRIM(RTRIM(Plant)),''),

NULLIF(LTRIM(RTRIM(Area)),''),

NULLIF(LTRIM(RTRIM(Notes)),'')

FROM staging.Spare_Parts_Stage;
GO