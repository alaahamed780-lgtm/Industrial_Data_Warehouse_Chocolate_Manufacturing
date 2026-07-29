USE Chocolate_Manufacturing_DW;
GO

/*============================================================
05_Load_Compressed_Air_Consumption_Master.sql
============================================================*/

TRUNCATE TABLE master.Compressed_Air_Consumption_Master;
GO

INSERT INTO master.Compressed_Air_Consumption_Master
(
    Air_Record_ID,
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
    Air_Meter_ID,
    Compressor_ID,
    Air_Pressure_bar,
    Air_Flow_m3_per_hr,
    Compressed_Air_Consumption_m3,
    Runtime_Min,
    Production_Qty_kg,
    Specific_Air_m3_per_kg,
    Compressor_Efficiency_Percent,
    Power_Consumption_kWh,
    Air_Cost_USD,
    Leakage_Estimated_Percent,
    Operator_ID,
    Status,
    Notes
)

SELECT

NULLIF(LTRIM(RTRIM(Air_Record_ID)), ''),

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

NULLIF(LTRIM(RTRIM(Air_Meter_ID)), ''),

NULLIF(LTRIM(RTRIM(Compressor_ID)), ''),

TRY_CONVERT(DECIMAL(18,2), Air_Pressure_bar),

TRY_CONVERT(DECIMAL(18,2), Air_Flow_m3_per_hr),

TRY_CONVERT(DECIMAL(18,2), Compressed_Air_Consumption_m3),

TRY_CONVERT(DECIMAL(18,2), Runtime_Min),

TRY_CONVERT(DECIMAL(18,2), Production_Qty_kg),

TRY_CONVERT(DECIMAL(18,4), Specific_Air_m3_per_kg),

TRY_CONVERT(DECIMAL(18,2), Compressor_Efficiency_Percent),

TRY_CONVERT(DECIMAL(18,2), Power_Consumption_kWh),

TRY_CONVERT(DECIMAL(18,2), Air_Cost_USD),

TRY_CONVERT(DECIMAL(18,2), Leakage_Estimated_Percent),

NULLIF(LTRIM(RTRIM(Operator_ID)), ''),

NULLIF(LTRIM(RTRIM(Status)), ''),

NULLIF(LTRIM(RTRIM(Notes)), '')

FROM staging.Compressed_Air_Consumption_Stage;
GO

/*============================================================
Verify Load
============================================================*/

SELECT COUNT(*) AS Master_Count
FROM master.Compressed_Air_Consumption_Master;
GO

SELECT TOP (20) *
FROM master.Compressed_Air_Consumption_Master
ORDER BY Air_Record_ID;
GO