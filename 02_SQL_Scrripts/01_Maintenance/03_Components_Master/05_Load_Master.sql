USE Chocolate_Manufacturing_DW;
GO

TRUNCATE TABLE master.Components_Master;
GO

INSERT INTO master.Components_Master
(
Component_ID,
Equipment_ID,
Parent_Component_ID,
Assembly_Code,
Subsystem,
Component_Name,
Component_Type,
Category,
Manufacturer,
Model,
Part_Number,
Serial_Number,
Material,
Dimensions,
Weight_kg,
Qty_Per_Equipment,
Unit,
Criticality,
Risk_Class,
Failure_Mode,
Failure_Cause,
Maintenance_Strategy,
Inspection_Frequency_Days,
Lubrication_Required,
Calibration_Required,
Installation_Date,
Expected_Life_Years,
Current_Age_Years,
Replacement_Cost_USD,
Lead_Time_Days,
Vendor_Code,
Spare_Part_Code,
Warehouse_Location,
Bin_Location,
Drawing_Number,
Revision,
Status,
Condition,
PLC_Tag,
Sensor_Tag,
Asset_Group,
Cost_Center,
Maintenance_Team,
Plant,
Area,
Production_Line,
Functional_Location,
Notes
)

SELECT

LTRIM(RTRIM(Component_ID)),
LTRIM(RTRIM(Equipment_ID)),
NULLIF(LTRIM(RTRIM(Parent_Component_ID)),''),

NULLIF(LTRIM(RTRIM(Assembly_Code)),''),

NULLIF(LTRIM(RTRIM(Subsystem)),''),

LTRIM(RTRIM(Component_Name)),
NULLIF(LTRIM(RTRIM(Component_Type)),''),
NULLIF(LTRIM(RTRIM(Category)),''),

NULLIF(LTRIM(RTRIM(Manufacturer)),''),

NULLIF(LTRIM(RTRIM(Model)),''),

NULLIF(LTRIM(RTRIM(Part_Number)),''),

NULLIF(LTRIM(RTRIM(Serial_Number)),''),

NULLIF(LTRIM(RTRIM(Material)),''),

NULLIF(LTRIM(RTRIM(Dimensions)),''),

TRY_CONVERT(DECIMAL(10,2),Weight_kg),

TRY_CONVERT(SMALLINT,Qty_Per_Equipment),

NULLIF(LTRIM(RTRIM(Unit)),''),

NULLIF(LTRIM(RTRIM(Criticality)),''),

NULLIF(LTRIM(RTRIM(Risk_Class)),''),

NULLIF(LTRIM(RTRIM(Failure_Mode)),''),

NULLIF(LTRIM(RTRIM(Failure_Cause)),''),

NULLIF(LTRIM(RTRIM(Maintenance_Strategy)),''),

TRY_CONVERT(SMALLINT,Inspection_Frequency_Days),

NULLIF(LTRIM(RTRIM(Lubrication_Required)),''),

NULLIF(LTRIM(RTRIM(Calibration_Required)),''),

TRY_CONVERT(DATE,Installation_Date),

TRY_CONVERT(SMALLINT,Expected_Life_Years),

TRY_CONVERT(SMALLINT,Current_Age_Years),

TRY_CONVERT(DECIMAL(18,2),Replacement_Cost_USD),

TRY_CONVERT(SMALLINT,Lead_Time_Days),

NULLIF(LTRIM(RTRIM(Vendor_Code)),''),

NULLIF(LTRIM(RTRIM(Spare_Part_Code)),''),

NULLIF(LTRIM(RTRIM(Warehouse_Location)),''),

NULLIF(LTRIM(RTRIM(Bin_Location)),''),

NULLIF(LTRIM(RTRIM(Drawing_Number)),''),

NULLIF(LTRIM(RTRIM(Revision)),''),

NULLIF(LTRIM(RTRIM(Status)),''),

NULLIF(LTRIM(RTRIM(Condition)),''),

NULLIF(LTRIM(RTRIM(PLC_Tag)),''),

NULLIF(LTRIM(RTRIM(Sensor_Tag)),''),

NULLIF(LTRIM(RTRIM(Asset_Group)),''),

NULLIF(LTRIM(RTRIM(Cost_Center)),''),

NULLIF(LTRIM(RTRIM(Maintenance_Team)),''),

NULLIF(LTRIM(RTRIM(Plant)),''),

NULLIF(LTRIM(RTRIM(Area)),''),

NULLIF(LTRIM(RTRIM(Production_Line)),''),

NULLIF(LTRIM(RTRIM(Functional_Location)),''),

NULLIF(LTRIM(RTRIM(Notes)),'')

FROM staging.Components_Stage;
GO