USE Chocolate_Manufacturing_DW;
GO

/*============================================================
01_Create_Energy_Consumption_Stage.sql
============================================================*/

IF OBJECT_ID('staging.Energy_Consumption_Stage','U') IS NOT NULL
    DROP TABLE staging.Energy_Consumption_Stage;
GO

CREATE TABLE staging.Energy_Consumption_Stage
(
    Energy_Record_ID NVARCHAR(50),

    Calendar_Date_Key NVARCHAR(20),

    Reading_Date NVARCHAR(30),
    Reading_DateTime NVARCHAR(50),

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

    Runtime_Min NVARCHAR(30),

    Energy_Consumption_kWh NVARCHAR(30),

    Peak_Demand_kW NVARCHAR(30),

    Reactive_Energy_kVARh NVARCHAR(30),

    Power_Factor NVARCHAR(30),

    Production_Qty_kg NVARCHAR(30),

    Specific_Energy_kWh_per_kg NVARCHAR(30),

    Energy_Cost_USD NVARCHAR(30),

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
AND TABLE_NAME='Energy_Consumption_Stage'
ORDER BY ORDINAL_POSITION;
GO