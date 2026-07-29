USE Chocolate_Manufacturing_DW;
GO

/*============================================================
04_Create_Compressed_Air_Consumption_Master.sql
============================================================*/

IF OBJECT_ID('master.Compressed_Air_Consumption_Master','U') IS NOT NULL
    DROP TABLE master.Compressed_Air_Consumption_Master;
GO

CREATE TABLE master.Compressed_Air_Consumption_Master
(
    Air_Record_ID NVARCHAR(50) NOT NULL,

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

    Air_Meter_ID NVARCHAR(30),

    Compressor_ID NVARCHAR(30),

    Air_Pressure_bar DECIMAL(18,2),

    Air_Flow_m3_per_hr DECIMAL(18,2),

    Compressed_Air_Consumption_m3 DECIMAL(18,2),

    Runtime_Min DECIMAL(18,2),

    Production_Qty_kg DECIMAL(18,2),

    Specific_Air_m3_per_kg DECIMAL(18,4),

    Compressor_Efficiency_Percent DECIMAL(18,2),

    Power_Consumption_kWh DECIMAL(18,2),

    Air_Cost_USD DECIMAL(18,2),

    Leakage_Estimated_Percent DECIMAL(18,2),

    Operator_ID NVARCHAR(30),

    Status NVARCHAR(30),

    Notes NVARCHAR(500),

    Load_Date DATETIME2
        CONSTRAINT DF_Compressed_Air_Consumption_LoadDate
        DEFAULT(GETDATE()),

    CONSTRAINT PK_Compressed_Air_Consumption_Master
        PRIMARY KEY (Air_Record_ID)
);
GO

/*============================================================
Verify Table
============================================================*/

SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'master'
  AND TABLE_NAME = 'Compressed_Air_Consumption_Master'
ORDER BY ORDINAL_POSITION;
GO