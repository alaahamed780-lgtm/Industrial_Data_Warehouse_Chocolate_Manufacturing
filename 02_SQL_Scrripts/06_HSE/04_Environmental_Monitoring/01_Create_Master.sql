USE Chocolate_Manufacturing_DW;
GO

/*============================================================
04_Create_Environmental_Monitoring_Master.sql
============================================================*/

IF OBJECT_ID('master.Environmental_Monitoring_Master','U') IS NOT NULL
    DROP TABLE master.Environmental_Monitoring_Master;
GO

CREATE TABLE master.Environmental_Monitoring_Master
(
    Environmental_Record_ID NVARCHAR(50) NOT NULL,

    Monitoring_Number NVARCHAR(50),

    Calendar_Date_Key INT,

    Monitoring_Date DATE,

    Monitoring_DateTime DATETIME2,

    Plant NVARCHAR(50),

    Area NVARCHAR(100),

    Location NVARCHAR(200),

    Monitoring_Type NVARCHAR(100),

    Parameter NVARCHAR(100),

    Measured_Value DECIMAL(18,2),

    Unit NVARCHAR(30),

    Lower_Limit DECIMAL(18,2),

    Upper_Limit DECIMAL(18,2),

    Compliance_Status NVARCHAR(50),

    Sensor_ID NVARCHAR(50),

    Equipment_ID NVARCHAR(50),

    Production_Line NVARCHAR(50),

    Weather_Condition NVARCHAR(50),

    Ambient_Temperature_C DECIMAL(8,2),

    Humidity_Percent DECIMAL(8,2),

    Wind_Speed_mps DECIMAL(8,2),

    Corrective_Action NVARCHAR(500),

    CAPA_ID NVARCHAR(50),

    Inspector_ID NVARCHAR(50),

    Estimated_Environmental_Cost_USD DECIMAL(18,2),

    Regulatory_Report_Required BIT,

    Status NVARCHAR(30),

    Notes NVARCHAR(500),

    Load_Date DATETIME2
        CONSTRAINT DF_Environmental_Monitoring_Master_LoadDate
        DEFAULT(GETDATE()),

    CONSTRAINT PK_Environmental_Monitoring_Master
        PRIMARY KEY (Environmental_Record_ID)
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
AND TABLE_NAME='Environmental_Monitoring_Master'
ORDER BY ORDINAL_POSITION;
GO