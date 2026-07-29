USE Chocolate_Manufacturing_DW;
GO

/*============================================================
04_Create_Water_Consumption_Master.sql
============================================================*/

IF OBJECT_ID('master.Water_Consumption_Master','U') IS NOT NULL
    DROP TABLE master.Water_Consumption_Master;
GO

CREATE TABLE master.Water_Consumption_Master
(
    Water_Record_ID NVARCHAR(50) NOT NULL,

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

    Meter_ID NVARCHAR(30),

    Water_Source NVARCHAR(50),

    Runtime_Min DECIMAL(18,2),

    Water_Consumption_L DECIMAL(18,2),

    Production_Qty_kg DECIMAL(18,2),

    Specific_Water_L_per_kg DECIMAL(18,4),

    Water_Cost_USD DECIMAL(18,2),

    Water_Temperature_C DECIMAL(18,2),

    Water_Pressure_bar DECIMAL(18,2),

    Operator_ID NVARCHAR(30),

    Status NVARCHAR(30),

    Notes NVARCHAR(500),

    Load_Date DATETIME2
        CONSTRAINT DF_Water_Consumption_LoadDate
        DEFAULT(GETDATE()),

    CONSTRAINT PK_Water_Consumption_Master
        PRIMARY KEY (Water_Record_ID)
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
AND TABLE_NAME='Water_Consumption_Master'
ORDER BY ORDINAL_POSITION;
GO