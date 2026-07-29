USE Chocolate_Manufacturing_DW;
GO

/*============================================================
05_Load_Chiller_Operation_Log_Master.sql
============================================================*/

TRUNCATE TABLE master.Chiller_Operation_Log_Master;
GO

INSERT INTO master.Chiller_Operation_Log_Master
(
    Chiller_Log_ID,
    Calendar_Date_Key,
    Reading_Date,
    Reading_DateTime,
    Plant,
    Area,
    Production_Line,
    Chiller_ID,
    Equipment_ID,
    Production_Order_ID,
    Production_Transaction_ID,
    Shift,
    Evaporator_Inlet_Temp_C,
    Evaporator_Outlet_Temp_C,
    Condenser_Inlet_Temp_C,
    Condenser_Outlet_Temp_C,
    Chilled_Water_Flow_m3h,
    Cooling_Load_TR,
    COP,
    Power_Consumption_kWh,
    Runtime_Min,
    Ambient_Temp_C,
    Alarm_Status,
    Alarm_Code,
    Operating_Status,
    Operator_ID,
    Notes
)

SELECT

NULLIF(LTRIM(RTRIM(Chiller_Log_ID)), ''),

TRY_CONVERT(INT, Calendar_Date_Key),

TRY_CONVERT(DATE, Reading_Date),

TRY_CONVERT(DATETIME2, Reading_DateTime),

NULLIF(LTRIM(RTRIM(Plant)), ''),
NULLIF(LTRIM(RTRIM(Area)), ''),

NULLIF(LTRIM(RTRIM(Production_Line)), ''),

NULLIF(LTRIM(RTRIM(Chiller_ID)), ''),

NULLIF(LTRIM(RTRIM(Equipment_ID)), ''),

NULLIF(LTRIM(RTRIM(Production_Order_ID)), ''),

NULLIF(LTRIM(RTRIM(Production_Transaction_ID)), ''),

NULLIF(LTRIM(RTRIM(Shift)), ''),

TRY_CONVERT(DECIMAL(18,2), Evaporator_Inlet_Temp_C),

TRY_CONVERT(DECIMAL(18,2), Evaporator_Outlet_Temp_C),

TRY_CONVERT(DECIMAL(18,2), Condenser_Inlet_Temp_C),

TRY_CONVERT(DECIMAL(18,2), Condenser_Outlet_Temp_C),

TRY_CONVERT(DECIMAL(18,2), Chilled_Water_Flow_m3h),

TRY_CONVERT(DECIMAL(18,2), Cooling_Load_TR),

TRY_CONVERT(DECIMAL(18,2), COP),

TRY_CONVERT(DECIMAL(18,2), Power_Consumption_kWh),

TRY_CONVERT(DECIMAL(18,2), Runtime_Min),

TRY_CONVERT(DECIMAL(18,2), Ambient_Temp_C),

NULLIF(LTRIM(RTRIM(Alarm_Status)), ''),

NULLIF(LTRIM(RTRIM(Alarm_Code)), ''),

NULLIF(LTRIM(RTRIM(Operating_Status)), ''),

NULLIF(LTRIM(RTRIM(Operator_ID)), ''),

NULLIF(LTRIM(RTRIM(Notes)), '')

FROM staging.Chiller_Operation_Log_Stage;
GO

/*============================================================
Verify Load
============================================================*/

SELECT COUNT(*) AS Master_Count
FROM master.Chiller_Operation_Log_Master;
GO

SELECT TOP (20) *
FROM master.Chiller_Operation_Log_Master
ORDER BY Chiller_Log_ID;
GO