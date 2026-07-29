USE Chocolate_Manufacturing_DW;
GO

/*============================================================
01_Create_GL_Accounts_Stage.sql
============================================================*/

IF OBJECT_ID('staging.GL_Accounts_Stage','U') IS NOT NULL
    DROP TABLE staging.GL_Accounts_Stage;
GO

CREATE TABLE staging.GL_Accounts_Stage
(
    GL_Account_ID NVARCHAR(50),

    GL_Account_No NVARCHAR(50),

    Account_Name NVARCHAR(150),

    Account_Type NVARCHAR(100),

    Account_Category NVARCHAR(100),

    Cost_Center_ID NVARCHAR(50),

    Parent_Account NVARCHAR(50),

    Currency NVARCHAR(20),

    Normal_Balance NVARCHAR(20),

    Financial_Statement NVARCHAR(50),

    Is_Posting_Allowed NVARCHAR(20),

    Tax_Code NVARCHAR(30),

    Status NVARCHAR(30),

    Created_Date NVARCHAR(30),

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
  AND TABLE_NAME = 'GL_Accounts_Stage'
ORDER BY ORDINAL_POSITION;
GO