USE Chocolate_Manufacturing_DW;
GO

/*============================================================
05_Load_Steam_Consumption_Master.sql
============================================================*/

TRUNCATE TABLE master.Steam_Consumption_Master;
GO

INSERT INTO master.Steam_Consumption_Master
(
    Steam_Record_ID,
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
    Steam_Meter_ID,
    Boiler_ID,
    Steam_Pressure_bar,
    Steam_Temperature_C,
    Steam_Consumption_kg,
    Runtime_Min,
    Production_Qty_kg,
    Specific_Steam_kg_per_kg,
    Boiler_Efficiency_Percent,
    Fuel_Type,
    Steam_Cost_USD,
    Operator_ID,
    Status,
    Notes
)

SELECT

NULLIF(LTRIM(RTRIM(Steam_Record_ID)), ''),

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

NULLIF(LTRIM(RTRIM(Steam_Meter_ID)), ''),

NULLIF(LTRIM(RTRIM(Boiler_ID)), ''),

TRY_CONVERT(DECIMAL(18,2), Steam_Pressure_bar),

TRY_CONVERT(DECIMAL(18,2), Steam_Temperature_C),

TRY_CONVERT(DECIMAL(18,2), Steam_Consumption_kg),

TRY_CONVERT(DECIMAL(18,2), Runtime_Min),

TRY_CONVERT(DECIMAL(18,2), Production_Qty_kg),

TRY_CONVERT(DECIMAL(18,4), Specific_Steam_kg_per_kg),

TRY_CONVERT(DECIMAL(18,2), Boiler_Efficiency_Percent),

NULLIF(LTRIM(RTRIM(Fuel_Type)), ''),

TRY_CONVERT(DECIMAL(18,2), Steam_Cost_USD),

NULLIF(LTRIM(RTRIM(Operator_ID)), ''),

NULLIF(LTRIM(RTRIM(Status)), ''),

NULLIF(LTRIM(RTRIM(Notes)), '')

FROM staging.Steam_Consumption_Stage;
GO

/*============================================================
Verify Load
============================================================*/

SELECT COUNT(*) AS Master_Count
FROM master.Steam_Consumption_Master;
GO

SELECT TOP (20) *
FROM master.Steam_Consumption_Master
ORDER BY Steam_Record_ID;
GO