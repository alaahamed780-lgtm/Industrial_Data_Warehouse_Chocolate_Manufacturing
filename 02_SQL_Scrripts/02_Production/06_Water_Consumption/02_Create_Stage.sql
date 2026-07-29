USE Chocolate_Manufacturing_DW;
GO

/*============================================================
01_Create_Water_Consumption_Stage.sql
============================================================*/

IF OBJECT_ID('staging.Water_Consumption_Stage','U') IS NOT NULL
    DROP TABLE staging.Water_Consumption_Stage;
GO

CREATE TABLE staging.Water_Consumption_Stage
(
    Water_Record_ID NVARCHAR(50),

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

    Meter_ID NVARCHAR(30),

    Water_Source NVARCHAR(50),

    Runtime_Min NVARCHAR(30),

    Water_Consumption_L NVARCHAR(30),

    Production_Qty_kg NVARCHAR(30),

    Specific_Water_L_per_kg NVARCHAR(30),

    Water_Cost_USD NVARCHAR(30),

    Water_Temperature_C NVARCHAR(30),

    Water_Pressure_bar NVARCHAR(30),

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
  AND TABLE_NAME='Water_Consumption_Stage'
ORDER BY ORDINAL_POSITION;
GO