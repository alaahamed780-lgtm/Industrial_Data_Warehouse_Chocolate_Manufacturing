USE Chocolate_Manufacturing_DW;
GO

/*============================================================
04_Create_Near_Miss_Reports_Master.sql
============================================================*/

IF OBJECT_ID('master.Near_Miss_Reports_Master','U') IS NOT NULL
    DROP TABLE master.Near_Miss_Reports_Master;
GO

CREATE TABLE master.Near_Miss_Reports_Master
(
    Near_Miss_ID NVARCHAR(50) NOT NULL,

    Near_Miss_Number NVARCHAR(50),

    Calendar_Date_Key INT,

    Report_Date DATE,

    Report_DateTime DATETIME2,

    Plant NVARCHAR(50),

    Area NVARCHAR(100),

    Location NVARCHAR(200),

    Department NVARCHAR(100),

    Reported_By NVARCHAR(50),

    Equipment_ID NVARCHAR(50),

    Work_Order_ID NVARCHAR(50),

    Production_Order_ID NVARCHAR(50),

    Hazard_Category NVARCHAR(100),

    Potential_Severity NVARCHAR(50),

    Description NVARCHAR(500),

    Immediate_Action NVARCHAR(500),

    Root_Cause NVARCHAR(500),

    Corrective_Action NVARCHAR(500),

    CAPA_ID NVARCHAR(50),

    Assigned_To NVARCHAR(100),

    Target_Close_Date DATE,

    Actual_Close_Date DATE,

    Verification_Status NVARCHAR(50),

    Risk_Rating_Before INT,

    Risk_Rating_After INT,

    Estimated_Loss_Avoided_USD DECIMAL(18,2),

    Status NVARCHAR(30),

    Notes NVARCHAR(500),

    Load_Date DATETIME2
        CONSTRAINT DF_Near_Miss_Reports_Master_LoadDate
        DEFAULT(GETDATE()),

    CONSTRAINT PK_Near_Miss_Reports_Master
        PRIMARY KEY (Near_Miss_ID)
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
AND TABLE_NAME='Near_Miss_Reports_Master'
ORDER BY ORDINAL_POSITION;
GO