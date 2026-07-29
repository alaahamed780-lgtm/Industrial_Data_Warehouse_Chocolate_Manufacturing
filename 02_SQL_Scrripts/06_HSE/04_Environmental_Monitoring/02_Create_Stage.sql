USE Chocolate_Manufacturing_DW;
GO

/*============================================================
01_Create_Environmental_Monitoring_Stage.sql
============================================================*/

IF OBJECT_ID('staging.Environmental_Monitoring_Stage','U') IS NOT NULL
    DROP TABLE staging.Environmental_Monitoring_Stage;
GO

CREATE TABLE staging.Environmental_Monitoring_Stage
(
    Environmental_Record_ID NVARCHAR(50),

    Monitoring_Number NVARCHAR(50),

    Calendar_Date_Key NVARCHAR(20),

    Monitoring_Date NVARCHAR(30),

    Monitoring_DateTime NVARCHAR(30),

    Plant NVARCHAR(50),

    Area NVARCHAR(100),

    Location NVARCHAR(200),

    Monitoring_Type NVARCHAR(100),

    Parameter NVARCHAR(100),

    Measured_Value NVARCHAR(30),

    Unit NVARCHAR(30),

    Lower_Limit NVARCHAR(30),

    Upper_Limit NVARCHAR(30),

    Compliance_Status NVARCHAR(50),

    Sensor_ID NVARCHAR(50),

    Equipment_ID NVARCHAR(50),

    Production_Line NVARCHAR(50),

    Weather_Condition NVARCHAR(50),

    Ambient_Temperature_C NVARCHAR(30),

    Humidity_Percent NVARCHAR(30),

    Wind_Speed_mps NVARCHAR(30),

    Corrective_Action NVARCHAR(500),

    CAPA_ID NVARCHAR(50),

    Inspector_ID NVARCHAR(50),

    Estimated_Environmental_Cost_USD NVARCHAR(30),

    Regulatory_Report_Required NVARCHAR(20),

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
  AND TABLE_NAME = 'Environmental_Monitoring_Stage'
ORDER BY ORDINAL_POSITION;
GO