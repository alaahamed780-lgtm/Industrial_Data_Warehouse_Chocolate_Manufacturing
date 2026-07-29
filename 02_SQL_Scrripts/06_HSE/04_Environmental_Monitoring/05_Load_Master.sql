USE Chocolate_Manufacturing_DW;
GO

/*============================================================
05_Load_Environmental_Monitoring_Master.sql
============================================================*/

TRUNCATE TABLE master.Environmental_Monitoring_Master;
GO

INSERT INTO master.Environmental_Monitoring_Master
(
    Environmental_Record_ID,
    Monitoring_Number,
    Calendar_Date_Key,
    Monitoring_Date,
    Monitoring_DateTime,
    Plant,
    Area,
    Location,
    Monitoring_Type,
    Parameter,
    Measured_Value,
    Unit,
    Lower_Limit,
    Upper_Limit,
    Compliance_Status,
    Sensor_ID,
    Equipment_ID,
    Production_Line,
    Weather_Condition,
    Ambient_Temperature_C,
    Humidity_Percent,
    Wind_Speed_mps,
    Corrective_Action,
    CAPA_ID,
    Inspector_ID,
    Estimated_Environmental_Cost_USD,
    Regulatory_Report_Required,
    Status,
    Notes
)
SELECT
    NULLIF(LTRIM(RTRIM(Environmental_Record_ID)), ''),
    NULLIF(LTRIM(RTRIM(Monitoring_Number)), ''),
    TRY_CONVERT(INT, Calendar_Date_Key),
    TRY_CONVERT(DATE, Monitoring_Date),
    TRY_CONVERT(DATETIME2, Monitoring_DateTime),
    NULLIF(LTRIM(RTRIM(Plant)), ''),
    NULLIF(LTRIM(RTRIM(Area)), ''),
    NULLIF(LTRIM(RTRIM(Location)), ''),
    NULLIF(LTRIM(RTRIM(Monitoring_Type)), ''),
    NULLIF(LTRIM(RTRIM(Parameter)), ''),
    TRY_CONVERT(DECIMAL(18,2), Measured_Value),
    NULLIF(LTRIM(RTRIM(Unit)), ''),
    TRY_CONVERT(DECIMAL(18,2), Lower_Limit),
    TRY_CONVERT(DECIMAL(18,2), Upper_Limit),
    NULLIF(LTRIM(RTRIM(Compliance_Status)), ''),
    NULLIF(LTRIM(RTRIM(Sensor_ID)), ''),
    NULLIF(LTRIM(RTRIM(Equipment_ID)), ''),
    NULLIF(LTRIM(RTRIM(Production_Line)), ''),
    NULLIF(LTRIM(RTRIM(Weather_Condition)), ''),
    TRY_CONVERT(DECIMAL(8,2), Ambient_Temperature_C),
    TRY_CONVERT(DECIMAL(8,2), Humidity_Percent),
    TRY_CONVERT(DECIMAL(8,2), Wind_Speed_mps),
    NULLIF(LTRIM(RTRIM(Corrective_Action)), ''),
    NULLIF(LTRIM(RTRIM(CAPA_ID)), ''),
    NULLIF(LTRIM(RTRIM(Inspector_ID)), ''),
    TRY_CONVERT(DECIMAL(18,2), Estimated_Environmental_Cost_USD),

    CASE
        WHEN UPPER(LTRIM(RTRIM(Regulatory_Report_Required))) IN ('YES','Y','TRUE','1')
            THEN 1
        WHEN UPPER(LTRIM(RTRIM(Regulatory_Report_Required))) IN ('NO','N','FALSE','0')
            THEN 0
        ELSE NULL
    END,

    NULLIF(LTRIM(RTRIM(Status)), ''),
    NULLIF(LTRIM(RTRIM(Notes)), '')

FROM staging.Environmental_Monitoring_Stage;
GO

/*============================================================
Verify Load
============================================================*/

SELECT COUNT(*) AS Master_Count
FROM master.Environmental_Monitoring_Master;
GO

SELECT TOP (20) *
FROM master.Environmental_Monitoring_Master
ORDER BY Environmental_Record_ID;
GO