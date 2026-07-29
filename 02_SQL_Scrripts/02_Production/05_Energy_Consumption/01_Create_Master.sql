USE Chocolate_Manufacturing_DW;
GO

/*============================================================
04_Create_Energy_Consumption_Master.sql
============================================================*/

IF OBJECT_ID('master.Energy_Consumption_Master','U') IS NOT NULL
    DROP TABLE master.Energy_Consumption_Master;
GO

CREATE TABLE master.Energy_Consumption_Master
(
    Energy_Record_ID NVARCHAR(50) NOT NULL,

    Calendar_Date_Key INT,

    Reading_Date DATE,

    Reading_DateTime DATETIME2,

    Plant NVARCHAR(50),

    Area NVARCHAR(100),

    Production_Line NVARCHAR(50),

    Work_Center NVARCHAR(50),

    Equipment_ID NVARCHAR(30),

    Production_Order_ID NVARCHAR(30),

    Production_Transaction_ID NVARCHAR(30),

    Shift NVARCHAR(20),

    Meter_ID NVARCHAR(30),

    Energy_Source NVARCHAR(50),

    Voltage_Level NVARCHAR(30),

    Runtime_Min DECIMAL(18,2),

    Energy_Consumption_kWh DECIMAL(18,2),

    Peak_Demand_kW DECIMAL(18,2),

    Reactive_Energy_kVARh DECIMAL(18,2),

    Power_Factor DECIMAL(18,4),

    Production_Qty_kg DECIMAL(18,2),

    Specific_Energy_kWh_per_kg DECIMAL(18,4),

    Energy_Cost_USD DECIMAL(18,2),

    CO2_Emission_kg DECIMAL(18,2),

    Operator_ID NVARCHAR(30),

    Status NVARCHAR(30),

    Notes NVARCHAR(500),

    Load_Date DATETIME2
        CONSTRAINT DF_Energy_Consumption_LoadDate
        DEFAULT(GETDATE()),

    CONSTRAINT PK_Energy_Consumption_Master
        PRIMARY KEY (Energy_Record_ID)
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
AND TABLE_NAME='Energy_Consumption_Master'
ORDER BY ORDINAL_POSITION;
GO