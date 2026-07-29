USE Chocolate_Manufacturing_DW;
GO

/*============================================================
  File Name : 08_Load_Equipment_Master.sql
  Purpose   : Load Equipment Data From Stage To Master
=============================================================*/

/*============================================================
Step 01 : Clear Master Table
=============================================================*/

TRUNCATE TABLE master.Equipment_Master;
GO


/*============================================================
Step 02 : Load Data
=============================================================*/

INSERT INTO master.Equipment_Master
(
    Equipment_ID,
    Asset_Tag,
    Equipment_Name,
    Equipment_Type,
    Category,
    Subcategory,
    Plant,
    Building,
    Area,
    Production_Line,
    Functional_Location,
    Parent_Equipment,
    Assembly_Code,
    Manufacturer,
    Model,
    Serial_Number,
    Country,
    PLC_Brand,
    PLC_CPU,
    DCS_System,
    HMI,
    Power_kW,
    Voltage_V,
    Frequency_Hz,
    Installation_Year,
    Commissioning_Date,
    Purchase_Cost_USD,
    Replacement_Cost_USD,
    Criticality,
    Risk_Class,
    Status,
    PM_Frequency_Days,
    Calibration_Required,
    Lubrication_Type,
    Lubrication_Frequency_Days,
    MTBF_Hours,
    MTTR_Hours,
    Warranty_Years,
    Expected_Life_Years,
    Safety_Level,
    Energy_Source,
    Operating_Shift,
    Maintenance_Team,
    Vendor_Code,
    Spare_Parts_Class,
    Cost_Center,
    GPS_Area_Code,
    Notes
)

SELECT

LTRIM(RTRIM(Equipment_ID)),
LTRIM(RTRIM(Asset_Tag)),
LTRIM(RTRIM(Equipment_Name)),
LTRIM(RTRIM(Equipment_Type)),
LTRIM(RTRIM(Category)),
LTRIM(RTRIM(Subcategory)),
LTRIM(RTRIM(Plant)),
LTRIM(RTRIM(Building)),
LTRIM(RTRIM(Area)),
LTRIM(RTRIM(Production_Line)),
LTRIM(RTRIM(Functional_Location)),
NULLIF(LTRIM(RTRIM(Parent_Equipment)), ''),
LTRIM(RTRIM(Assembly_Code)),
LTRIM(RTRIM(Manufacturer)),
LTRIM(RTRIM(Model)),
LTRIM(RTRIM(Serial_Number)),
LTRIM(RTRIM(Country)),
NULLIF(LTRIM(RTRIM(PLC_Brand)), ''),
NULLIF(LTRIM(RTRIM(PLC_CPU)), ''),
NULLIF(LTRIM(RTRIM(DCS_System)), ''),
NULLIF(LTRIM(RTRIM(HMI)), ''),

TRY_CONVERT(SMALLINT, Power_kW),
TRY_CONVERT(SMALLINT, Voltage_V),
TRY_CONVERT(TINYINT, Frequency_Hz),
TRY_CONVERT(SMALLINT, Installation_Year),

TRY_CONVERT(DATE, Commissioning_Date),

TRY_CONVERT(DECIMAL(18,2), Purchase_Cost_USD),
TRY_CONVERT(DECIMAL(18,2), Replacement_Cost_USD),

LTRIM(RTRIM(Criticality)),
LTRIM(RTRIM(Risk_Class)),
LTRIM(RTRIM(Status)),

TRY_CONVERT(SMALLINT, PM_Frequency_Days),

LTRIM(RTRIM(Calibration_Required)),

NULLIF(LTRIM(RTRIM(Lubrication_Type)), ''),

TRY_CONVERT(SMALLINT, Lubrication_Frequency_Days),

TRY_CONVERT(INT, MTBF_Hours),

TRY_CONVERT(DECIMAL(6,2), MTTR_Hours),

TRY_CONVERT(TINYINT, Warranty_Years),

TRY_CONVERT(TINYINT, Expected_Life_Years),

NULLIF(LTRIM(RTRIM(Safety_Level)), ''),

NULLIF(LTRIM(RTRIM(Energy_Source)), ''),

NULLIF(LTRIM(RTRIM(Operating_Shift)), ''),

NULLIF(LTRIM(RTRIM(Maintenance_Team)), ''),

NULLIF(LTRIM(RTRIM(Vendor_Code)), ''),

NULLIF(LTRIM(RTRIM(Spare_Parts_Class)), ''),

NULLIF(LTRIM(RTRIM(Cost_Center)), ''),

NULLIF(LTRIM(RTRIM(GPS_Area_Code)), ''),

NULLIF(LTRIM(RTRIM(Notes)), '')

FROM staging.Equipment_Master_Stage;
GO