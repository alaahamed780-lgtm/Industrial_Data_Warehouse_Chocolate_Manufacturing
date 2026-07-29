USE Chocolate_Manufacturing_DW;
GO

/*============================================================
05_Load_Safety_Incidents_Master.sql
============================================================*/

TRUNCATE TABLE master.Safety_Incidents_Master;
GO

INSERT INTO master.Safety_Incidents_Master
(
    Incident_ID,
    Incident_Number,
    Calendar_Date_Key,
    Incident_Date,
    Incident_DateTime,
    Plant,
    Area,
    Location,
    Department,
    Incident_Type,
    Severity,
    Employee_ID,
    Equipment_ID,
    Work_Order_ID,
    Production_Order_ID,
    Injury_Type,
    Lost_Time_Injury,
    Near_Miss,
    Environmental_Impact,
    Root_Cause,
    Immediate_Action,
    Corrective_Action,
    CAPA_ID,
    Investigation_Leader,
    Target_Close_Date,
    Actual_Close_Date,
    Estimated_Cost_USD,
    Regulatory_Reported,
    Status,
    Notes
)

SELECT

NULLIF(LTRIM(RTRIM(Incident_ID)), ''),

NULLIF(LTRIM(RTRIM(Incident_Number)), ''),

TRY_CONVERT(INT, Calendar_Date_Key),

TRY_CONVERT(DATE, Incident_Date),

TRY_CONVERT(DATETIME2, Incident_DateTime),

NULLIF(LTRIM(RTRIM(Plant)), ''),

NULLIF(LTRIM(RTRIM(Area)), ''),

NULLIF(LTRIM(RTRIM(Location)), ''),

NULLIF(LTRIM(RTRIM(Department)), ''),

NULLIF(LTRIM(RTRIM(Incident_Type)), ''),

NULLIF(LTRIM(RTRIM(Severity)), ''),

NULLIF(LTRIM(RTRIM(Employee_ID)), ''),

NULLIF(LTRIM(RTRIM(Equipment_ID)), ''),

NULLIF(LTRIM(RTRIM(Work_Order_ID)), ''),

NULLIF(LTRIM(RTRIM(Production_Order_ID)), ''),

NULLIF(LTRIM(RTRIM(Injury_Type)), ''),

CASE
    WHEN UPPER(LTRIM(RTRIM(Lost_Time_Injury))) IN ('YES','Y','TRUE','1') THEN 1
    WHEN UPPER(LTRIM(RTRIM(Lost_Time_Injury))) IN ('NO','N','FALSE','0') THEN 0
    ELSE NULL
END,

CASE
    WHEN UPPER(LTRIM(RTRIM(Near_Miss))) IN ('YES','Y','TRUE','1') THEN 1
    WHEN UPPER(LTRIM(RTRIM(Near_Miss))) IN ('NO','N','FALSE','0') THEN 0
    ELSE NULL
END,

NULLIF(LTRIM(RTRIM(Environmental_Impact)), ''),

NULLIF(LTRIM(RTRIM(Root_Cause)), ''),

NULLIF(LTRIM(RTRIM(Immediate_Action)), ''),

NULLIF(LTRIM(RTRIM(Corrective_Action)), ''),

NULLIF(LTRIM(RTRIM(CAPA_ID)), ''),

NULLIF(LTRIM(RTRIM(Investigation_Leader)), ''),

TRY_CONVERT(DATE, Target_Close_Date),

TRY_CONVERT(DATE, Actual_Close_Date),

TRY_CONVERT(DECIMAL(18,2), Estimated_Cost_USD),

CASE
    WHEN UPPER(LTRIM(RTRIM(Regulatory_Reported))) IN ('YES','Y','TRUE','1') THEN 1
    WHEN UPPER(LTRIM(RTRIM(Regulatory_Reported))) IN ('NO','N','FALSE','0') THEN 0
    ELSE NULL
END,

NULLIF(LTRIM(RTRIM(Status)), ''),

NULLIF(LTRIM(RTRIM(Notes)), '')

FROM staging.Safety_Incidents_Stage;
GO

/*============================================================
Verify Load
============================================================*/

SELECT COUNT(*) AS Master_Count
FROM master.Safety_Incidents_Master;
GO

SELECT TOP (20) *
FROM master.Safety_Incidents_Master
ORDER BY Incident_ID;
GO