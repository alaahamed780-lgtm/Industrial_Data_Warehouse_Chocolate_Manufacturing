USE Chocolate_Manufacturing_DW;
GO

/*============================================================
04_Create_Natural_Gas_Consumption_Master.sql
============================================================*/

IF OBJECT_ID('master.Natural_Gas_Consumption_Master','U') IS NOT NULL
    DROP TABLE master.Natural_Gas_Consumption_Master;
GO

CREATE TABLE master.Natural_Gas_Consumption_Master
(
    Gas_Record_ID NVARCHAR(50) NOT NULL,

    Calendar_Date_Key INT,

    Reading_Date DATE,

    Reading_DateTime DATETIME2,

    Plant NVARCHAR(50),

    Area NVARCHAR(100),

    Production_Line NVARCHAR(50),

    Equipment_ID NVARCHAR(30),

    Production_Order_ID NVARCHAR(30),

    Production_Transaction_ID NVARCHAR(30),

    Shift NVARCHAR(20),

    Gas_Meter_ID NVARCHAR(30),

    Gas_Source NVARCHAR(50),

    Boiler_ID NVARCHAR(30),

    Pressure_bar DECIMAL(18,2),

    Gas_Consumption_Nm3 DECIMAL(18,2),

    Runtime_Min DECIMAL(18,2),

    Production_Qty_kg DECIMAL(18,2),

    Specific_Gas_Nm3_per_kg DECIMAL(18,4),

    Calorific_Value_MJ_per_Nm3 DECIMAL(18,2),

    Thermal_Efficiency_Percent DECIMAL(18,2),

    Gas_Cost_USD DECIMAL(18,2),

    CO2_Emission_kg DECIMAL(18,2),

    Operator_ID NVARCHAR(30),

    Status NVARCHAR(30),

    Notes NVARCHAR(500),

    Load_Date DATETIME2
        CONSTRAINT DF_Natural_Gas_Consumption_LoadDate
        DEFAULT(GETDATE()),

    CONSTRAINT PK_Natural_Gas_Consumption_Master
        PRIMARY KEY (Gas_Record_ID)
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
AND TABLE_NAME='Natural_Gas_Consumption_Master'
ORDER BY ORDINAL_POSITION;
GO