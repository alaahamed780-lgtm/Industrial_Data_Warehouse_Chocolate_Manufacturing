USE Chocolate_Manufacturing_DW;
GO

/*============================================================
05_Load_Budget_Master.sql
============================================================*/

TRUNCATE TABLE master.Budget_Master;
GO

INSERT INTO master.Budget_Master
(
    Budget_ID,
    Fiscal_Year,
    Fiscal_Period,
    Budget_Version,
    Cost_Center_ID,
    GL_Account_ID,
    Department,
    Plant,
    Area,
    Budget_Type,
    Budget_Amount_USD,
    Committed_Amount_USD,
    Actual_Amount_USD,
    Variance_USD,
    Variance_Percent,
    Budget_Status,
    Approved_By,
    Approval_Date,
    Created_By,
    Created_Date,
    Last_Updated,
    Notes
)

SELECT

NULLIF(LTRIM(RTRIM(Budget_ID)), ''),

TRY_CONVERT(SMALLINT, Fiscal_Year),

TRY_CONVERT(TINYINT, Fiscal_Period),

NULLIF(LTRIM(RTRIM(Budget_Version)), ''),

NULLIF(LTRIM(RTRIM(Cost_Center_ID)), ''),

NULLIF(LTRIM(RTRIM(GL_Account_ID)), ''),

NULLIF(LTRIM(RTRIM(Department)), ''),

NULLIF(LTRIM(RTRIM(Plant)), ''),

NULLIF(LTRIM(RTRIM(Area)), ''),

NULLIF(LTRIM(RTRIM(Budget_Type)), ''),

TRY_CONVERT(DECIMAL(18,2), Budget_Amount_USD),

TRY_CONVERT(DECIMAL(18,2), Committed_Amount_USD),

TRY_CONVERT(DECIMAL(18,2), Actual_Amount_USD),

TRY_CONVERT(DECIMAL(18,2), Variance_USD),

TRY_CONVERT(DECIMAL(10,2), Variance_Percent),

NULLIF(LTRIM(RTRIM(Budget_Status)), ''),

NULLIF(LTRIM(RTRIM(Approved_By)), ''),

TRY_CONVERT(DATE, Approval_Date),

NULLIF(LTRIM(RTRIM(Created_By)), ''),

TRY_CONVERT(DATE, Created_Date),

TRY_CONVERT(DATE, Last_Updated),

NULLIF(LTRIM(RTRIM(Notes)), '')

FROM staging.Budget_Stage;
GO

/*============================================================
Verify Load
============================================================*/

SELECT COUNT(*) AS Master_Count
FROM master.Budget_Master;
GO

SELECT TOP (20) *
FROM master.Budget_Master
ORDER BY Budget_ID;
GO