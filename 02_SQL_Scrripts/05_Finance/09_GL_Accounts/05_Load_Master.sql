USE Chocolate_Manufacturing_DW;
GO

/*============================================================
05_Load_GL_Accounts_Master.sql
============================================================*/

TRUNCATE TABLE master.GL_Accounts_Master;
GO

INSERT INTO master.GL_Accounts_Master
(
    GL_Account_ID,
    GL_Account_No,
    Account_Name,
    Account_Type,
    Account_Category,
    Cost_Center_ID,
    Parent_Account,
    Currency,
    Normal_Balance,
    Financial_Statement,
    Is_Posting_Allowed,
    Tax_Code,
    Status,
    Created_Date,
    Notes
)

SELECT

NULLIF(LTRIM(RTRIM(GL_Account_ID)), ''),

NULLIF(LTRIM(RTRIM(GL_Account_No)), ''),

NULLIF(LTRIM(RTRIM(Account_Name)), ''),

NULLIF(LTRIM(RTRIM(Account_Type)), ''),

NULLIF(LTRIM(RTRIM(Account_Category)), ''),

NULLIF(LTRIM(RTRIM(Cost_Center_ID)), ''),

NULLIF(LTRIM(RTRIM(Parent_Account)), ''),

NULLIF(LTRIM(RTRIM(Currency)), ''),

NULLIF(LTRIM(RTRIM(Normal_Balance)), ''),

NULLIF(LTRIM(RTRIM(Financial_Statement)), ''),

NULLIF(LTRIM(RTRIM(Is_Posting_Allowed)), ''),

NULLIF(LTRIM(RTRIM(Tax_Code)), ''),

NULLIF(LTRIM(RTRIM(Status)), ''),

TRY_CONVERT(DATE, Created_Date),

NULLIF(LTRIM(RTRIM(Notes)), '')

FROM staging.GL_Accounts_Stage;
GO

/*============================================================
Verify Load
============================================================*/

SELECT COUNT(*) AS Master_Count
FROM master.GL_Accounts_Master;
GO

SELECT TOP (20) *
FROM master.GL_Accounts_Master
ORDER BY GL_Account_ID;
GO