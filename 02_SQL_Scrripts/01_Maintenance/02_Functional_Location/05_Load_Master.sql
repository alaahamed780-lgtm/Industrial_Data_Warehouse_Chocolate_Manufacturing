USE Chocolate_Manufacturing_DW;
GO

TRUNCATE TABLE master.Functional_Location_Master;
GO

INSERT INTO master.Functional_Location_Master
(
    Functional_Location_ID,
    Functional_Location_Code,
    Parent_Functional_Location,
    [Level],

    Plant,
    Building,
    Area,
    Production_Line,
    Zone,
    Section,

    Equipment_Group,
    Equipment_ID,

    Location_Name,
    Location_Type,
    Process,

    Latitude_Zone,
    Longitude_Zone,

    Cost_Center,
    Department,
    Maintenance_Team,

    Criticality,
    Safety_Class,
    Environment,

    Commissioning_Year,

    Status,

    PLC_Area,
    DCS_Area,

    Power_Source,
    Utility_Type,

    Access_Level,

    Responsible_Manager,

    Inspection_Frequency_Days,

    Remarks
)

SELECT

LTRIM(RTRIM(Functional_Location_ID)),
LTRIM(RTRIM(Functional_Location_Code)),
NULLIF(LTRIM(RTRIM(Parent_Functional_Location)), ''),
LTRIM(RTRIM([Level])),

LTRIM(RTRIM(Plant)),
LTRIM(RTRIM(Building)),
LTRIM(RTRIM(Area)),
NULLIF(LTRIM(RTRIM(Production_Line)), ''),
NULLIF(LTRIM(RTRIM(Zone)), ''),
NULLIF(LTRIM(RTRIM(Section)), ''),

NULLIF(LTRIM(RTRIM(Equipment_Group)), ''),
NULLIF(LTRIM(RTRIM(Equipment_ID)), ''),

LTRIM(RTRIM(Location_Name)),
NULLIF(LTRIM(RTRIM(Location_Type)), ''),
NULLIF(LTRIM(RTRIM(Process)), ''),

TRY_CONVERT(DECIMAL(12,6), Latitude_Zone),
TRY_CONVERT(DECIMAL(12,6), Longitude_Zone),

NULLIF(LTRIM(RTRIM(Cost_Center)), ''),
NULLIF(LTRIM(RTRIM(Department)), ''),
NULLIF(LTRIM(RTRIM(Maintenance_Team)), ''),

NULLIF(LTRIM(RTRIM(Criticality)), ''),
NULLIF(LTRIM(RTRIM(Safety_Class)), ''),
NULLIF(LTRIM(RTRIM(Environment)), ''),

TRY_CONVERT(SMALLINT, Commissioning_Year),

NULLIF(LTRIM(RTRIM(Status)), ''),

NULLIF(LTRIM(RTRIM(PLC_Area)), ''),
NULLIF(LTRIM(RTRIM(DCS_Area)), ''),

NULLIF(LTRIM(RTRIM(Power_Source)), ''),
NULLIF(LTRIM(RTRIM(Utility_Type)), ''),

NULLIF(LTRIM(RTRIM(Access_Level)), ''),

NULLIF(LTRIM(RTRIM(Responsible_Manager)), ''),

TRY_CONVERT(SMALLINT, Inspection_Frequency_Days),

NULLIF(LTRIM(RTRIM(Remarks)), '')

FROM staging.Functional_Location_Stage;
GO