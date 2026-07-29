USE Chocolate_Manufacturing_DW;
GO

/*============================================================
05_Load_Near_Miss_Reports_Master.sql
============================================================*/

TRUNCATE TABLE master.Near_Miss_Reports_Master;
GO

INSERT INTO master.Near_Miss_Reports_Master
(
    Near_Miss_ID,
    Near_Miss_Number,
    Calendar_Date_Key,
    Report_Date,
    Report_DateTime,
    Plant,
    Area,
    Location,
    Department,
    Reported_By,
    Equipment_ID,
    Work_Order_ID,
    Production_Order_ID,
    Hazard_Category,
    Potential_Severity,
    Description,
    Immediate_Action,
    Root_Cause,
    Corrective_Action,
    CAPA_ID,
    Assigned_To,
    Target_Close_Date,
    Actual_Close_Date,
    Verification_Status,
    Risk_Rating_Before,
    Risk_Rating_After,
    Estimated_Loss_Avoided_USD,
    Status,
    Notes
)

SELECT

NULLIF(LTRIM(RTRIM(Near_Miss_ID)), ''),

NULLIF(LTRIM(RTRIM(Near_Miss_Number)), ''),

TRY_CONVERT(INT, Calendar_Date_Key),

TRY_CONVERT(DATE, Report_Date),

TRY_CONVERT(DATETIME2, Report_DateTime),

NULLIF(LTRIM(RTRIM(Plant)), ''),

NULLIF(LTRIM(RTRIM(Area)), ''),

NULLIF(LTRIM(RTRIM(Location)), ''),

NULLIF(LTRIM(RTRIM(Department)), ''),

NULLIF(LTRIM(RTRIM(Reported_By)), ''),

NULLIF(LTRIM(RTRIM(Equipment_ID)), ''),

NULLIF(LTRIM(RTRIM(Work_Order_ID)), ''),

NULLIF(LTRIM(RTRIM(Production_Order_ID)), ''),

NULLIF(LTRIM(RTRIM(Hazard_Category)), ''),

NULLIF(LTRIM(RTRIM(Potential_Severity)), ''),

NULLIF(LTRIM(RTRIM(Description)), ''),

NULLIF(LTRIM(RTRIM(Immediate_Action)), ''),

NULLIF(LTRIM(RTRIM(Root_Cause)), ''),

NULLIF(LTRIM(RTRIM(Corrective_Action)), ''),

NULLIF(LTRIM(RTRIM(CAPA_ID)), ''),

NULLIF(LTRIM(RTRIM(Assigned_To)), ''),

TRY_CONVERT(DATE, Target_Close_Date),

TRY_CONVERT(DATE, Actual_Close_Date),

NULLIF(LTRIM(RTRIM(Verification_Status)), ''),

TRY_CONVERT(INT, Risk_Rating_Before),

TRY_CONVERT(INT, Risk_Rating_After),

TRY_CONVERT(DECIMAL(18,2), Estimated_Loss_Avoided_USD),

NULLIF(LTRIM(RTRIM(Status)), ''),

NULLIF(LTRIM(RTRIM(Notes)), '')

FROM staging.Near_Miss_Reports_Stage;
GO

/*============================================================
Verify Load
============================================================*/

SELECT COUNT(*) AS Master_Count
FROM master.Near_Miss_Reports_Master;
GO

SELECT TOP (20) *
FROM master.Near_Miss_Reports_Master
ORDER BY Near_Miss_ID;
GO