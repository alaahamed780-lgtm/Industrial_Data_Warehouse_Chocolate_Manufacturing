USE Chocolate_Manufacturing_DW;
GO

/*============================================================
05_Load_Non_Conformance_Reports_Master.sql
============================================================*/

TRUNCATE TABLE master.Non_Conformance_Reports_Master;
GO

INSERT INTO master.Non_Conformance_Reports_Master
(
    NCR_ID,
    NCR_Number,
    Quality_Inspection_ID,
    Lab_Test_Result_ID,
    Calendar_Date_Key,
    Report_Date,
    Report_DateTime,
    Product_ID,
    Batch_No,
    Lot_No,
    Production_Order_ID,
    Production_Transaction_ID,
    Equipment_ID,
    NCR_Category,
    Defect_Type,
    Defect_Code,
    Severity,
    Root_Cause,
    Immediate_Action,
    Corrective_Action,
    Preventive_Action,
    Disposition,
    Responsible_Employee_ID,
    Department,
    Target_Close_Date,
    Actual_Close_Date,
    Status,
    Verification_Result,
    Verified_By,
    Estimated_Cost_USD,
    Plant,
    Area,
    Notes
)

SELECT

NULLIF(LTRIM(RTRIM(NCR_ID)), ''),
NULLIF(LTRIM(RTRIM(NCR_Number)), ''),

NULLIF(LTRIM(RTRIM(Quality_Inspection_ID)), ''),
NULLIF(LTRIM(RTRIM(Lab_Test_Result_ID)), ''),

TRY_CONVERT(INT, Calendar_Date_Key),

TRY_CONVERT(DATE, Report_Date),
TRY_CONVERT(DATETIME2, Report_DateTime),

NULLIF(LTRIM(RTRIM(Product_ID)), ''),

NULLIF(LTRIM(RTRIM(Batch_No)), ''),
NULLIF(LTRIM(RTRIM(Lot_No)), ''),

NULLIF(LTRIM(RTRIM(Production_Order_ID)), ''),
NULLIF(LTRIM(RTRIM(Production_Transaction_ID)), ''),

NULLIF(LTRIM(RTRIM(Equipment_ID)), ''),

NULLIF(LTRIM(RTRIM(NCR_Category)), ''),

NULLIF(LTRIM(RTRIM(Defect_Type)), ''),
NULLIF(LTRIM(RTRIM(Defect_Code)), ''),

NULLIF(LTRIM(RTRIM(Severity)), ''),

NULLIF(LTRIM(RTRIM(Root_Cause)), ''),

NULLIF(LTRIM(RTRIM(Immediate_Action)), ''),

NULLIF(LTRIM(RTRIM(Corrective_Action)), ''),

NULLIF(LTRIM(RTRIM(Preventive_Action)), ''),

NULLIF(LTRIM(RTRIM(Disposition)), ''),

NULLIF(LTRIM(RTRIM(Responsible_Employee_ID)), ''),

NULLIF(LTRIM(RTRIM(Department)), ''),

TRY_CONVERT(DATE, Target_Close_Date),
TRY_CONVERT(DATE, Actual_Close_Date),

NULLIF(LTRIM(RTRIM(Status)), ''),

NULLIF(LTRIM(RTRIM(Verification_Result)), ''),

NULLIF(LTRIM(RTRIM(Verified_By)), ''),

TRY_CONVERT(DECIMAL(18,2), Estimated_Cost_USD),

NULLIF(LTRIM(RTRIM(Plant)), ''),

NULLIF(LTRIM(RTRIM(Area)), ''),

NULLIF(LTRIM(RTRIM(Notes)), '')

FROM staging.Non_Conformance_Reports_Stage;
GO

/*============================================================
Verify Load
============================================================*/

SELECT
    COUNT(*) AS Master_Count
FROM master.Non_Conformance_Reports_Master;
GO

SELECT TOP (20) *
FROM master.Non_Conformance_Reports_Master
ORDER BY NCR_ID;
GO