USE Chocolate_Manufacturing_DW;
GO

/*============================================================
01_Create_Compressed_Air_Consumption_Stage.sql
============================================================*/

IF OBJECT_ID('staging.Compressed_Air_Consumption_Stage','U') IS NOT NULL
    DROP TABLE staging.Compressed_Air_Consumption_Stage;
GO

CREATE TABLE staging.Compressed_Air_Consumption_Stage
(
    Air_Record_ID NVARCHAR(50),

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

    Air_Meter_ID NVARCHAR(30),

    Compressor_ID NVARCHAR(30),

    Air_Pressure_bar NVARCHAR(30),

    Air_Flow_m3_per_hr NVARCHAR(30),

    Compressed_Air_Consumption_m3 NVARCHAR(30),

    Runtime_Min NVARCHAR(30),

    Production_Qty_kg NVARCHAR(30),

    Specific_Air_m3_per_kg NVARCHAR(30),

    Compressor_Efficiency_Percent NVARCHAR(30),

    Power_Consumption_kWh NVARCHAR(30),

    Air_Cost_USD NVARCHAR(30),

    Leakage_Estimated_Percent NVARCHAR(30),

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
  AND TABLE_NAME = 'Compressed_Air_Consumption_Stage'
ORDER BY ORDINAL_POSITION;
GO