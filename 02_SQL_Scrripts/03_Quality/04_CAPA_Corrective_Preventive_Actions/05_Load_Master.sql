USE Chocolate_Manufacturing_DW;
GO

/*============================================================
05_Load_CAPA_Master.sql
============================================================*/

TRUNCATE TABLE master.CAPA_Corrective_Preventive_Actions_Master;
GO

INSERT INTO master.CAPA_Corrective_Preventive_Actions_Master
(
    CAPA_ID,
    CAPA_Number,
    NCR_ID,
    Quality_Inspection_ID,
    Calendar_Date_Key,
    Initiation_Date,
    CAPA_Type,
    Source,
    Root_Cause,
    Risk_Level,
    Corrective_Action,
    Preventive_Action,
    Action_Owner_ID,
    Department,
    Target_Completion_Date,
    Actual_Completion_Date,
    Effectiveness_Check_Date,
    Verification_Method,
    Verification_Result,
    Status,
    Priority,
    Related_Product_ID,
    Related_Equipment_ID,
    Production_Order_ID,
    Estimated_Cost_USD,
    Actual_Cost_USD,
    Lessons_Learned,
    Approved_By,
    Closed_By,
    Plant,
    Area,
    Notes
)

SELECT

NULLIF(LTRIM(RTRIM(CAPA_ID)), ''),
NULLIF(LTRIM(RTRIM(CAPA_Number)), ''),

NULLIF(LTRIM(RTRIM(NCR_ID)), ''),
NULLIF(LTRIM(RTRIM(Quality_Inspection_ID)), ''),

TRY_CONVERT(INT, Calendar_Date_Key),

TRY_CONVERT(DATE, Initiation_Date),

NULLIF(LTRIM(RTRIM(CAPA_Type)), ''),

NULLIF(LTRIM(RTRIM(Source)), ''),

NULLIF(LTRIM(RTRIM(Root_Cause)), ''),

NULLIF(LTRIM(RTRIM(Risk_Level)), ''),

NULLIF(LTRIM(RTRIM(Corrective_Action)), ''),

NULLIF(LTRIM(RTRIM(Preventive_Action)), ''),

NULLIF(LTRIM(RTRIM(Action_Owner_ID)), ''),

NULLIF(LTRIM(RTRIM(Department)), ''),

TRY_CONVERT(DATE, Target_Completion_Date),

TRY_CONVERT(DATE, Actual_Completion_Date),

TRY_CONVERT(DATE, Effectiveness_Check_Date),

NULLIF(LTRIM(RTRIM(Verification_Method)), ''),

NULLIF(LTRIM(RTRIM(Verification_Result)), ''),

NULLIF(LTRIM(RTRIM(Status)), ''),

NULLIF(LTRIM(RTRIM(Priority)), ''),

NULLIF(LTRIM(RTRIM(Related_Product_ID)), ''),

NULLIF(LTRIM(RTRIM(Related_Equipment_ID)), ''),

NULLIF(LTRIM(RTRIM(Production_Order_ID)), ''),

TRY_CONVERT(DECIMAL(18,2), Estimated_Cost_USD),

TRY_CONVERT(DECIMAL(18,2), Actual_Cost_USD),

NULLIF(LTRIM(RTRIM(Lessons_Learned)), ''),

NULLIF(LTRIM(RTRIM(Approved_By)), ''),

NULLIF(LTRIM(RTRIM(Closed_By)), ''),

NULLIF(LTRIM(RTRIM(Plant)), ''),

NULLIF(LTRIM(RTRIM(Area)), ''),

NULLIF(LTRIM(RTRIM(Notes)), '')

FROM staging.CAPA_Corrective_Preventive_Actions_Stage;
GO

/*============================================================
Verify Load
============================================================*/

SELECT COUNT(*) AS Master_Count
FROM master.CAPA_Corrective_Preventive_Actions_Master;
GO

SELECT TOP (20) *
FROM master.CAPA_Corrective_Preventive_Actions_Master
ORDER BY CAPA_ID;
GO