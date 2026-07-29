USE Chocolate_Manufacturing_DW;
GO

/*============================================================
05_Load_Water_Consumption_Master.sql
============================================================*/

TRUNCATE TABLE master.Water_Consumption_Master;
GO

INSERT INTO master.Water_Consumption_Master
(
    Water_Record_ID,
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
    Meter_ID,
    Water_Source,
    Runtime_Min,
    Water_Consumption_L,
    Production_Qty_kg,
    Specific_Water_L_per_kg,
    Water_Cost_USD,
    Water_Temperature_C,
    Water_Pressure_bar,
    Operator_ID,
    Status,
    Notes
)

SELECT

NULLIF(LTRIM(RTRIM(Water_Record_ID)), ''),

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

NULLIF(LTRIM(RTRIM(Meter_ID)), ''),

NULLIF(LTRIM(RTRIM(Water_Source)), ''),

TRY_CONVERT(DECIMAL(18,2), Runtime_Min),

TRY_CONVERT(DECIMAL(18,2), Water_Consumption_L),

TRY_CONVERT(DECIMAL(18,2), Production_Qty_kg),

TRY_CONVERT(DECIMAL(18,4), Specific_Water_L_per_kg),

TRY_CONVERT(DECIMAL(18,2), Water_Cost_USD),

TRY_CONVERT(DECIMAL(18,2), Water_Temperature_C),

TRY_CONVERT(DECIMAL(18,2), Water_Pressure_bar),

NULLIF(LTRIM(RTRIM(Operator_ID)), ''),

NULLIF(LTRIM(RTRIM(Status)), ''),

NULLIF(LTRIM(RTRIM(Notes)), '')

FROM staging.Water_Consumption_Stage;
GO

/*============================================================
Verify Load
============================================================*/

SELECT COUNT(*) AS Master_Count
FROM master.Water_Consumption_Master;
GO

SELECT TOP (20) *
FROM master.Water_Consumption_Master
ORDER BY Water_Record_ID;
GO