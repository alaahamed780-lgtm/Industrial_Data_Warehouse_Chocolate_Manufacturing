USE Chocolate_Manufacturing_DW;
GO

/*============================================================
04_Create_Budget_Master.sql
============================================================*/

IF OBJECT_ID('master.Budget_Master','U') IS NOT NULL
    DROP TABLE master.Budget_Master;
GO

CREATE TABLE master.Budget_Master
(
    Budget_ID NVARCHAR(50) NOT NULL,

    Fiscal_Year SMALLINT,

    Fiscal_Period TINYINT,

    Budget_Version NVARCHAR(50),

    Cost_Center_ID NVARCHAR(50),

    GL_Account_ID NVARCHAR(50),

    Department NVARCHAR(100),

    Plant NVARCHAR(50),

    Area NVARCHAR(100),

    Budget_Type NVARCHAR(50),

    Budget_Amount_USD DECIMAL(18,2),

    Committed_Amount_USD DECIMAL(18,2),

    Actual_Amount_USD DECIMAL(18,2),

    Variance_USD DECIMAL(18,2),

    Variance_Percent DECIMAL(10,2),

    Budget_Status NVARCHAR(30),

    Approved_By NVARCHAR(100),

    Approval_Date DATE,

    Created_By NVARCHAR(100),

    Created_Date DATE,

    Last_Updated DATE,

    Notes NVARCHAR(500),

    Load_Date DATETIME2
        CONSTRAINT DF_Budget_Master_LoadDate
        DEFAULT(GETDATE()),

    CONSTRAINT PK_Budget_Master
        PRIMARY KEY (Budget_ID)
);
GO

/*============================================================
Verify Table
============================================================*/

SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='master'
AND TABLE_NAME='Budget_Master'
ORDER BY ORDINAL_POSITION;
GO