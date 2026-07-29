USE Chocolate_Manufacturing_DW;
GO

/*============================================================
05_Load_Natural_Gas_Consumption_Master.sql
============================================================*/

TRUNCATE TABLE master.Natural_Gas_Consumption_Master;
GO

INSERT INTO master.Natural_Gas_Consumption_Master
(
    Gas_Record_ID,
    Calendar_Date_Key,
    Reading_Date,
    Reading_DateTime,
    Plant,
    Area,
    Production_Line,
    Equipment_ID,
    Production_Order_ID,
    Production_Transaction_ID,
    Shift,
    Gas_Meter_ID,
    Gas_Source,
    Boiler_ID,
    Pressure_bar,
    Gas_Consumption_Nm3,
    Runtime_Min,
    Production_Qty_kg,
    Specific_Gas_Nm3_per_kg,
    Calorific_Value_MJ_per_Nm3,
    Thermal_Efficiency_Percent,
    Gas_Cost_USD,
    CO2_Emission_kg,
    Operator_ID,
    Status,
    Notes
)

SELECT

NULLIF(LTRIM(RTRIM(Gas_Record_ID)), ''),

TRY_CONVERT(INT, Calendar_Date_Key),

TRY_CONVERT(DATE, Reading_Date),

TRY_CONVERT(DATETIME2, Reading_DateTime),

NULLIF(LTRIM(RTRIM(Plant)), ''),
NULLIF(LTRIM(RTRIM(Area)), ''),

NULLIF(LTRIM(RTRIM(Production_Line)), ''),

NULLIF(LTRIM(RTRIM(Equipment_ID)), ''),

NULLIF(LTRIM(RTRIM(Production_Order_ID)), ''),

NULLIF(LTRIM(RTRIM(Production_Transaction_ID)), ''),

NULLIF(LTRIM(RTRIM(Shift)), ''),

NULLIF(LTRIM(RTRIM(Gas_Meter_ID)), ''),

NULLIF(LTRIM(RTRIM(Gas_Source)), ''),

NULLIF(LTRIM(RTRIM(Boiler_ID)), ''),

TRY_CONVERT(DECIMAL(18,2), Pressure_bar),

TRY_CONVERT(DECIMAL(18,2), Gas_Consumption_Nm3),

TRY_CONVERT(DECIMAL(18,2), Runtime_Min),

TRY_CONVERT(DECIMAL(18,2), Production_Qty_kg),

TRY_CONVERT(DECIMAL(18,4), Specific_Gas_Nm3_per_kg),

TRY_CONVERT(DECIMAL(18,2), Calorific_Value_MJ_per_Nm3),

TRY_CONVERT(DECIMAL(18,2), Thermal_Efficiency_Percent),

TRY_CONVERT(DECIMAL(18,2), Gas_Cost_USD),

TRY_CONVERT(DECIMAL(18,2), CO2_Emission_kg),

NULLIF(LTRIM(RTRIM(Operator_ID)), ''),

NULLIF(LTRIM(RTRIM(Status)), ''),

NULLIF(LTRIM(RTRIM(Notes)), '')

FROM staging.Natural_Gas_Consumption_Stage;
GO

/*============================================================
Verify Load
============================================================*/

SELECT COUNT(*) AS Master_Count
FROM master.Natural_Gas_Consumption_Master;
GO

SELECT TOP (20) *
FROM master.Natural_Gas_Consumption_Master
ORDER BY Gas_Record_ID;
GO