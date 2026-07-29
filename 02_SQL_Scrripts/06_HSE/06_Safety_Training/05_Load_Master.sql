USE Chocolate_Manufacturing_DW;
GO

/*============================================================
05_Load_Safety_Training_Master.sql
============================================================*/

TRUNCATE TABLE master.Safety_Training_Master;
GO

INSERT INTO master.Safety_Training_Master
(
    Training_Record_ID,
    Training_ID,
    Calendar_Date_Key,
    Training_Date,
    Training_DateTime,
    Employee_ID,
    Department,
    Job_Title,
    Training_Course,
    Training_Category,
    Trainer_Name,
    Training_Provider,
    Training_Hours,
    Training_Method,
    Assessment_Score,
    Pass_Status,
    Certificate_Number,
    Certificate_Issue_Date,
    Certificate_Expiry_Date,
    Retraining_Required,
    Next_Training_Date,
    Related_Permit_Type,
    Related_Risk_Category,
    Cost_USD,
    Status,
    Plant,
    Area,
    Notes
)

SELECT

NULLIF(LTRIM(RTRIM(Training_Record_ID)), ''),

NULLIF(LTRIM(RTRIM(Training_ID)), ''),

TRY_CONVERT(INT, Calendar_Date_Key),

TRY_CONVERT(DATE, Training_Date),

TRY_CONVERT(DATETIME2, Training_DateTime),

NULLIF(LTRIM(RTRIM(Employee_ID)), ''),

NULLIF(LTRIM(RTRIM(Department)), ''),

NULLIF(LTRIM(RTRIM(Job_Title)), ''),

NULLIF(LTRIM(RTRIM(Training_Course)), ''),

NULLIF(LTRIM(RTRIM(Training_Category)), ''),

NULLIF(LTRIM(RTRIM(Trainer_Name)), ''),

NULLIF(LTRIM(RTRIM(Training_Provider)), ''),

TRY_CONVERT(DECIMAL(10,2), Training_Hours),

NULLIF(LTRIM(RTRIM(Training_Method)), ''),

TRY_CONVERT(DECIMAL(5,2), Assessment_Score),

NULLIF(LTRIM(RTRIM(Pass_Status)), ''),

NULLIF(LTRIM(RTRIM(Certificate_Number)), ''),

TRY_CONVERT(DATE, Certificate_Issue_Date),

TRY_CONVERT(DATE, Certificate_Expiry_Date),

CASE
    WHEN UPPER(LTRIM(RTRIM(Retraining_Required))) IN ('YES','Y','TRUE','1') THEN 1
    WHEN UPPER(LTRIM(RTRIM(Retraining_Required))) IN ('NO','N','FALSE','0') THEN 0
    ELSE NULL
END,

TRY_CONVERT(DATE, Next_Training_Date),

NULLIF(LTRIM(RTRIM(Related_Permit_Type)), ''),

NULLIF(LTRIM(RTRIM(Related_Risk_Category)), ''),

TRY_CONVERT(DECIMAL(18,2), Cost_USD),

NULLIF(LTRIM(RTRIM(Status)), ''),

NULLIF(LTRIM(RTRIM(Plant)), ''),

NULLIF(LTRIM(RTRIM(Area)), ''),

NULLIF(LTRIM(RTRIM(Notes)), '')

FROM staging.Safety_Training_Stage;
GO

/*============================================================
Verify Load
============================================================*/

SELECT COUNT(*) AS Master_Count
FROM master.Safety_Training_Master;
GO

SELECT TOP (20) *
FROM master.Safety_Training_Master
ORDER BY Training_Record_ID;
GO