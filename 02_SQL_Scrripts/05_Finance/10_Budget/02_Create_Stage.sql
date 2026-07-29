USE Chocolate_Manufacturing_DW;
GO

/*============================================================
01_Create_Budget_Stage.sql
============================================================*/

IF OBJECT_ID('staging.Budget_Stage','U') IS NOT NULL
    DROP TABLE staging.Budget_Stage;
GO

CREATE TABLE staging.Budget_Stage
(
    Budget_ID NVARCHAR(50),

    Fiscal_Year NVARCHAR(10),

    Fiscal_Period NVARCHAR(10),

    Budget_Version NVARCHAR(50),

    Cost_Center_ID NVARCHAR(50),

    GL_Account_ID NVARCHAR(50),

    Department NVARCHAR(100),

    Plant NVARCHAR(50),

    Area NVARCHAR(100),

    Budget_Type NVARCHAR(50),

    Budget_Amount_USD NVARCHAR(30),

    Committed_Amount_USD NVARCHAR(30),

    Actual_Amount_USD NVARCHAR(30),

    Variance_USD NVARCHAR(30),

    Variance_Percent NVARCHAR(30),

    Budget_Status NVARCHAR(30),

    Approved_By NVARCHAR(100),

    Approval_Date NVARCHAR(30),

    Created_By NVARCHAR(100),

    Created_Date NVARCHAR(30),

    Last_Updated NVARCHAR(30),

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
AND TABLE_NAME = 'Budget_Stage'
ORDER BY ORDINAL_POSITION;
GO