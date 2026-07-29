USE Chocolate_Manufacturing_DW;
GO

/*============================================================
01_Create_Natural_Gas_Consumption_Stage.sql
============================================================*/

IF OBJECT_ID('staging.Natural_Gas_Consumption_Stage','U') IS NOT NULL
    DROP TABLE staging.Natural_Gas_Consumption_Stage;
GO

CREATE TABLE staging.Natural_Gas_Consumption_Stage
(
    Gas_Record_ID NVARCHAR(50),

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

    Gas_Meter_ID NVARCHAR(30),

    Gas_Source NVARCHAR(50),

    Boiler_ID NVARCHAR(30),

    Pressure_bar NVARCHAR(30),

    Gas_Consumption_Nm3 NVARCHAR(30),

    Runtime_Min NVARCHAR(30),

    Production_Qty_kg NVARCHAR(30),

    Specific_Gas_Nm3_per_kg NVARCHAR(30),

    Calorific_Value_MJ_per_Nm3 NVARCHAR(30),

    Thermal_Efficiency_Percent NVARCHAR(30),

    Gas_Cost_USD NVARCHAR(30),

    CO2_Emission_kg NVARCHAR(30),

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
WHERE TABLE_SCHEMA='staging'
AND TABLE_NAME='Natural_Gas_Consumption_Stage'
ORDER BY ORDINAL_POSITION;
GO