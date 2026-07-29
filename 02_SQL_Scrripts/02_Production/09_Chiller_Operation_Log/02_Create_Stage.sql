USE Chocolate_Manufacturing_DW;
GO

/*============================================================
01_Create_Chiller_Operation_Log_Stage.sql
============================================================*/

IF OBJECT_ID('staging.Chiller_Operation_Log_Stage','U') IS NOT NULL
    DROP TABLE staging.Chiller_Operation_Log_Stage;
GO

CREATE TABLE staging.Chiller_Operation_Log_Stage
(
    Chiller_Log_ID NVARCHAR(50),

    Calendar_Date_Key NVARCHAR(20),

    Reading_Date NVARCHAR(30),
    Reading_DateTime NVARCHAR(50),

    Plant NVARCHAR(50),
    Area NVARCHAR(100),
    Production_Line NVARCHAR(50),

    Chiller_ID NVARCHAR(30),
    Equipment_ID NVARCHAR(30),

    Production_Order_ID NVARCHAR(30),
    Production_Transaction_ID NVARCHAR(30),

    Shift NVARCHAR(20),

    Evaporator_Inlet_Temp_C NVARCHAR(30),
    Evaporator_Outlet_Temp_C NVARCHAR(30),

    Condenser_Inlet_Temp_C NVARCHAR(30),
    Condenser_Outlet_Temp_C NVARCHAR(30),

    Chilled_Water_Flow_m3h NVARCHAR(30),

    Cooling_Load_TR NVARCHAR(30),

    COP NVARCHAR(30),

    Power_Consumption_kWh NVARCHAR(30),

    Runtime_Min NVARCHAR(30),

    Ambient_Temp_C NVARCHAR(30),

    Alarm_Status NVARCHAR(30),

    Alarm_Code NVARCHAR(30),

    Operating_Status NVARCHAR(30),

    Operator_ID NVARCHAR(30),

    Notes NVARCHAR(500)
);
GO

/*============================================================
Verify Table
============================================================*/

SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='staging'
  AND TABLE_NAME='Chiller_Operation_Log_Stage'
ORDER BY ORDINAL_POSITION;
GO