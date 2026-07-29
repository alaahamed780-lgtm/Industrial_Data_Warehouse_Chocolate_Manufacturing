USE Chocolate_Manufacturing_DW;
GO

/*============================================================
05_Load_PPE_Inspections_Master.sql
============================================================*/

TRUNCATE TABLE master.PPE_Inspections_Master;
GO

INSERT INTO master.PPE_Inspections_Master
(
    PPE_Inspection_ID,
    Inspection_Number,
    Calendar_Date_Key,
    Inspection_Date,
    Inspection_DateTime,
    Plant,
    Area,
    Department,
    Employee_ID,
    Inspector_ID,
    PPE_Type,
    PPE_Item_ID,
    Serial_Number,
    Condition,
    Compliance_Status,
    Expiry_Date,
    Last_Inspection_Date,
    Next_Inspection_Date,
    Defect_Found,
    Corrective_Action,
    Replacement_Required,
    Replacement_Date,
    CAPA_ID,
    Work_Order_ID,
    Risk_Level,
    Status,
    Notes
)

SELECT

NULLIF(LTRIM(RTRIM(PPE_Inspection_ID)), ''),

NULLIF(LTRIM(RTRIM(Inspection_Number)), ''),

TRY_CONVERT(INT, Calendar_Date_Key),

TRY_CONVERT(DATE, Inspection_Date),

TRY_CONVERT(DATETIME2, Inspection_DateTime),

NULLIF(LTRIM(RTRIM(Plant)), ''),

NULLIF(LTRIM(RTRIM(Area)), ''),

NULLIF(LTRIM(RTRIM(Department)), ''),

NULLIF(LTRIM(RTRIM(Employee_ID)), ''),

NULLIF(LTRIM(RTRIM(Inspector_ID)), ''),

NULLIF(LTRIM(RTRIM(PPE_Type)), ''),

NULLIF(LTRIM(RTRIM(PPE_Item_ID)), ''),

NULLIF(LTRIM(RTRIM(Serial_Number)), ''),

NULLIF(LTRIM(RTRIM(Condition)), ''),

NULLIF(LTRIM(RTRIM(Compliance_Status)), ''),

TRY_CONVERT(DATE, Expiry_Date),

TRY_CONVERT(DATE, Last_Inspection_Date),

TRY_CONVERT(DATE, Next_Inspection_Date),

CASE
    WHEN UPPER(LTRIM(RTRIM(Defect_Found))) IN ('YES','Y','TRUE','1') THEN 1
    WHEN UPPER(LTRIM(RTRIM(Defect_Found))) IN ('NO','N','FALSE','0') THEN 0
    ELSE NULL
END,

NULLIF(LTRIM(RTRIM(Corrective_Action)), ''),

CASE
    WHEN UPPER(LTRIM(RTRIM(Replacement_Required))) IN ('YES','Y','TRUE','1') THEN 1
    WHEN UPPER(LTRIM(RTRIM(Replacement_Required))) IN ('NO','N','FALSE','0') THEN 0
    ELSE NULL
END,

TRY_CONVERT(DATE, Replacement_Date),

NULLIF(LTRIM(RTRIM(CAPA_ID)), ''),

NULLIF(LTRIM(RTRIM(Work_Order_ID)), ''),

NULLIF(LTRIM(RTRIM(Risk_Level)), ''),

NULLIF(LTRIM(RTRIM(Status)), ''),

NULLIF(LTRIM(RTRIM(Notes)), '')

FROM staging.PPE_Inspections_Stage;
GO

/*============================================================
Verify Load
============================================================*/

SELECT COUNT(*) AS Master_Count
FROM master.PPE_Inspections_Master;
GO

SELECT TOP (20) *
FROM master.PPE_Inspections_Master
ORDER BY PPE_Inspection_ID;
GO