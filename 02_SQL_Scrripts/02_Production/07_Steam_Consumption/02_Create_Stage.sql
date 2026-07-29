USE Chocolate_Manufacturing_DW;
GO

/*============================================================
01_Create_Steam_Consumption_Stage.sql
============================================================*/

IF OBJECT_ID('staging.Steam_Consumption_Stage','U') IS NOT NULL
    DROP TABLE staging.Steam_Consumption_Stage;
GO

CREATE TABLE staging.Steam_Consumption_Stage
(
    Steam_Record_ID NVARCHAR(50),

    Calendar_Date_Key NVARCHAR(20),

    Reading_Date NVARCHAR(30),
    Reading_DateTime NVARCHAR(50),

    Plant NVARCHAR(50),
    Area NVARCHAR(100),

    Production_Line NVARCHAR(50),

    Equipment_ID NVARCHAR(30),

    Production_Order_ID NVARCHAR(30),
    Production_Transaction_ID NVARCHAR(30),

    Shift NVARCHAR(20),

    Steam_Meter_ID NVARCHAR(30),

    Boiler_ID NVARCHAR(30),

    Steam_Pressure_bar NVARCHAR(30),

    Steam_Temperature_C NVARCHAR(30),

    Steam_Consumption_kg NVARCHAR(30),

    Runtime_Min NVARCHAR(30),

    Production_Qty_kg NVARCHAR(30),

    Specific_Steam_kg_per_kg NVARCHAR(30),

    Boiler_Efficiency_Percent NVARCHAR(30),

    Fuel_Type NVARCHAR(30),

    Steam_Cost_USD NVARCHAR(30),

    Operator_ID NVARCHAR(30),

    Status NVARCHAR(30),

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
WHERE TABLE_SCHEMA = 'staging'
  AND TABLE_NAME = 'Steam_Consumption_Stage'
ORDER BY ORDINAL_POSITION;
GO