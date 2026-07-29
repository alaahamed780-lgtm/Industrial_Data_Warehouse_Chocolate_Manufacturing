USE Chocolate_Manufacturing_DW;
GO

/*============================================================
05_Load_Energy_Consumption_Master.sql
============================================================*/

TRUNCATE TABLE master.Energy_Consumption_Master;
GO

INSERT INTO master.Energy_Consumption_Master
(
    Energy_Record_ID,
    Calendar_Date_Key,
    Reading_Date,
    Reading_DateTime,
    Plant,
    Area,
    Production_Line,
    Work_Center,
    Equipment_ID,
    Production_Order_ID,
    Production_Transaction_ID,
    Shift,
    Meter_ID,
    Energy_Source,
    Voltage_Level,
    Runtime_Min,
    Energy_Consumption_kWh,
    Peak_Demand_kW,
    Reactive_Energy_kVARh,
    Power_Factor,
    Production_Qty_kg,
    Specific_Energy_kWh_per_kg,
    Energy_Cost_USD,
    CO2_Emission_kg,
    Operator_ID,
    Status,
    Notes
)

SELECT

NULLIF(LTRIM(RTRIM(Energy_Record_ID)), ''),

TRY_CONVERT(INT, Calendar_Date_Key),

TRY_CONVERT(DATE, Reading_Date),

TRY_CONVERT(DATETIME2, Reading_DateTime),

NULLIF(LTRIM(RTRIM(Plant)), ''),
NULLIF(LTRIM(RTRIM(Area)), ''),

NULLIF(LTRIM(RTRIM(Production_Line)), ''),
NULLIF(LTRIM(RTRIM(Work_Center)), ''),

NULLIF(LTRIM(RTRIM(Equipment_ID)), ''),

NULLIF(LTRIM(RTRIM(Production_Order_ID)), ''),

NULLIF(LTRIM(RTRIM(Production_Transaction_ID)), ''),

NULLIF(LTRIM(RTRIM(Shift)), ''),

NULLIF(LTRIM(RTRIM(Meter_ID)), ''),

NULLIF(LTRIM(RTRIM(Energy_Source)), ''),

NULLIF(LTRIM(RTRIM(Voltage_Level)), ''),

TRY_CONVERT(DECIMAL(18,2), Runtime_Min),

TRY_CONVERT(DECIMAL(18,2), Energy_Consumption_kWh),

TRY_CONVERT(DECIMAL(18,2), Peak_Demand_kW),

TRY_CONVERT(DECIMAL(18,2), Reactive_Energy_kVARh),

TRY_CONVERT(DECIMAL(18,4), Power_Factor),

TRY_CONVERT(DECIMAL(18,2), Production_Qty_kg),

TRY_CONVERT(DECIMAL(18,4), Specific_Energy_kWh_per_kg),

TRY_CONVERT(DECIMAL(18,2), Energy_Cost_USD),

TRY_CONVERT(DECIMAL(18,2), CO2_Emission_kg),

NULLIF(LTRIM(RTRIM(Operator_ID)), ''),

NULLIF(LTRIM(RTRIM(Status)), ''),

NULLIF(LTRIM(RTRIM(Notes)), '')

FROM staging.Energy_Consumption_Stage;
GO

/*============================================================
Verify Load
============================================================*/

SELECT COUNT(*) AS Master_Count
FROM master.Energy_Consumption_Master;
GO

SELECT TOP (20) *
FROM master.Energy_Consumption_Master
ORDER BY Energy_Record_ID;
GO