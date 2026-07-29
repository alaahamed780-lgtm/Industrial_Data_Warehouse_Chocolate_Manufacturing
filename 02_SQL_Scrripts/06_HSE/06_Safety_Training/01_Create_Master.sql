USE Chocolate_Manufacturing_DW;
GO

/*============================================================
04_Create_Safety_Training_Master.sql
============================================================*/

IF OBJECT_ID('master.Safety_Training_Master','U') IS NOT NULL
    DROP TABLE master.Safety_Training_Master;
GO

CREATE TABLE master.Safety_Training_Master
(
    Training_Record_ID NVARCHAR(50) NOT NULL,

    Training_ID NVARCHAR(50),

    Calendar_Date_Key INT,

    Training_Date DATE,

    Training_DateTime DATETIME2,

    Employee_ID NVARCHAR(50),

    Department NVARCHAR(100),

    Job_Title NVARCHAR(100),

    Training_Course NVARCHAR(200),

    Training_Category NVARCHAR(100),

    Trainer_Name NVARCHAR(150),

    Training_Provider NVARCHAR(150),

    Training_Hours DECIMAL(10,2),

    Training_Method NVARCHAR(50),

    Assessment_Score DECIMAL(5,2),

    Pass_Status NVARCHAR(20),

    Certificate_Number NVARCHAR(50),

    Certificate_Issue_Date DATE,

    Certificate_Expiry_Date DATE,

    Retraining_Required BIT,

    Next_Training_Date DATE,

    Related_Permit_Type NVARCHAR(100),

    Related_Risk_Category NVARCHAR(100),

    Cost_USD DECIMAL(18,2),

    Status NVARCHAR(50),

    Plant NVARCHAR(50),

    Area NVARCHAR(100),

    Notes NVARCHAR(500),

    Load_Date DATETIME2
        CONSTRAINT DF_Safety_Training_Master_LoadDate
        DEFAULT(GETDATE()),

    CONSTRAINT PK_Safety_Training_Master
        PRIMARY KEY (Training_Record_ID)
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
AND TABLE_NAME='Safety_Training_Master'
ORDER BY ORDINAL_POSITION;
GO