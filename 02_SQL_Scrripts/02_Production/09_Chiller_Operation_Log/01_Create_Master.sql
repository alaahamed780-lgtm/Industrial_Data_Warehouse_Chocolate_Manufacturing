USE Chocolate_Manufacturing_DW;
GO

/*============================================================
04_Create_Chiller_Operation_Log_Master.sql
============================================================*/

IF OBJECT_ID('master.Chiller_Operation_Log_Master','U') IS NOT NULL
    DROP TABLE master.Chiller_Operation_Log_Master;
GO

CREATE TABLE master.Chiller_Operation_Log_Master
(
    Chiller_Log_ID NVARCHAR(50) NOT NULL,

    Calendar_Date_Key INT,

    Reading_Date DATE,

    Reading_DateTime DATETIME2,

    Plant NVARCHAR(50),

    Area NVARCHAR(100),

    Production_Line NVARCHAR(50),

    Chiller_ID NVARCHAR(30),

    Equipment_ID NVARCHAR(30),

    Production_Order_ID NVARCHAR(30),

    Production_Transaction_ID NVARCHAR(30),

    Shift NVARCHAR(20),

    Evaporator_Inlet_Temp_C DECIMAL(18,2),

    Evaporator_Outlet_Temp_C DECIMAL(18,2),

    Condenser_Inlet_Temp_C DECIMAL(18,2),

    Condenser_Outlet_Temp_C DECIMAL(18,2),

    Chilled_Water_Flow_m3h DECIMAL(18,2),

    Cooling_Load_TR DECIMAL(18,2),

    COP DECIMAL(18,2),

    Power_Consumption_kWh DECIMAL(18,2),

    Runtime_Min DECIMAL(18,2),

    Ambient_Temp_C DECIMAL(18,2),

    Alarm_Status NVARCHAR(30),

    Alarm_Code NVARCHAR(30),

    Operating_Status NVARCHAR(30),

    Operator_ID NVARCHAR(30),

    Notes NVARCHAR(500),

    Load_Date DATETIME2
        CONSTRAINT DF_Chiller_Operation_Log_LoadDate
        DEFAULT(GETDATE()),

    CONSTRAINT PK_Chiller_Operation_Log_Master
        PRIMARY KEY (Chiller_Log_ID)
);
GO

/*============================================================
Verify Table
============================================================*/

SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='master'
  AND TABLE_NAME='Chiller_Operation_Log_Master'
ORDER BY ORDINAL_POSITION;
GO