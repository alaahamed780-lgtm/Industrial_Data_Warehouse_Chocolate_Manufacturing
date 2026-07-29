USE Chocolate_Manufacturing_DW;
GO

/*============================================================
04_Create_GL_Accounts_Master.sql
============================================================*/

IF OBJECT_ID('master.GL_Accounts_Master','U') IS NOT NULL
    DROP TABLE master.GL_Accounts_Master;
GO

CREATE TABLE master.GL_Accounts_Master
(
    GL_Account_ID NVARCHAR(50) NOT NULL,

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

    Created_Date DATE,

    Notes NVARCHAR(500),

    Load_Date DATETIME2
        CONSTRAINT DF_GL_Accounts_Master_LoadDate
        DEFAULT(GETDATE()),

    CONSTRAINT PK_GL_Accounts_Master
        PRIMARY KEY (GL_Account_ID)
);
GO

/*============================================================
Verify Table
============================================================*/

SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'master'
  AND TABLE_NAME = 'GL_Accounts_Master'
ORDER BY ORDINAL_POSITION;
GO