USE Chocolate_Manufacturing_DW;
GO

/*============================================================
04_Create_Steam_Consumption_Master.sql
============================================================*/

IF OBJECT_ID('master.Steam_Consumption_Master','U') IS NOT NULL
    DROP TABLE master.Steam_Consumption_Master;
GO

CREATE TABLE master.Steam_Consumption_Master
(
    Steam_Record_ID NVARCHAR(50) NOT NULL,

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

    Steam_Meter_ID NVARCHAR(30),

    Boiler_ID NVARCHAR(30),

    Steam_Pressure_bar DECIMAL(18,2),

    Steam_Temperature_C DECIMAL(18,2),

    Steam_Consumption_kg DECIMAL(18,2),

    Runtime_Min DECIMAL(18,2),

    Production_Qty_kg DECIMAL(18,2),

    Specific_Steam_kg_per_kg DECIMAL(18,4),

    Boiler_Efficiency_Percent DECIMAL(18,2),

    Fuel_Type NVARCHAR(30),

    Steam_Cost_USD DECIMAL(18,2),

    Operator_ID NVARCHAR(30),

    Status NVARCHAR(30),

    Notes NVARCHAR(500),

    Load_Date DATETIME2
        CONSTRAINT DF_Steam_Consumption_LoadDate
        DEFAULT(GETDATE()),

    CONSTRAINT PK_Steam_Consumption_Master
        PRIMARY KEY (Steam_Record_ID)
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
  AND TABLE_NAME='Steam_Consumption_Master'
ORDER BY ORDINAL_POSITION;
GO