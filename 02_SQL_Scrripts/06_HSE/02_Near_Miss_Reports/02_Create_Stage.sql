USE Chocolate_Manufacturing_DW;
GO

/*============================================================
01_Create_Near_Miss_Reports_Stage.sql
============================================================*/

IF OBJECT_ID('staging.Near_Miss_Reports_Stage','U') IS NOT NULL
    DROP TABLE staging.Near_Miss_Reports_Stage;
GO

CREATE TABLE staging.Near_Miss_Reports_Stage
(
    Near_Miss_ID NVARCHAR(50),

    Near_Miss_Number NVARCHAR(50),

    Calendar_Date_Key NVARCHAR(20),

    Report_Date NVARCHAR(30),

    Report_DateTime NVARCHAR(30),

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

    Target_Close_Date NVARCHAR(30),

    Actual_Close_Date NVARCHAR(30),

    Verification_Status NVARCHAR(50),

    Risk_Rating_Before NVARCHAR(20),

    Risk_Rating_After NVARCHAR(20),

    Estimated_Loss_Avoided_USD NVARCHAR(30),

    Status NVARCHAR(30),

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
WHERE TABLE_SCHEMA='staging'
AND TABLE_NAME='Near_Miss_Reports_Stage'
ORDER BY ORDINAL_POSITION;
GO