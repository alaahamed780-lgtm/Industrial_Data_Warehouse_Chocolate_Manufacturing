USE Chocolate_Manufacturing_DW;
GO

IF NOT EXISTS
(
    SELECT *
    FROM sys.schemas
    WHERE name = 'staging'
)
BEGIN
    EXEC('CREATE SCHEMA staging');
END
GO

IF OBJECT_ID('staging.Failure_Codes_Stage','U') IS NOT NULL
DROP TABLE staging.Failure_Codes_Stage;
GO

CREATE TABLE staging.Failure_Codes_Stage
(
    Failure_Code_ID NVARCHAR(255),
    Failure_Code NVARCHAR(255),
    Failure_Group NVARCHAR(255),
    Failure_Category NVARCHAR(255),
    Failure_Mode NVARCHAR(255),
    Failure_Cause NVARCHAR(MAX),
    Failure_Effect NVARCHAR(MAX),
    Severity NVARCHAR(255),
    Probability NVARCHAR(255),
    Risk_Priority NVARCHAR(255),
    Equipment_Category NVARCHAR(255),
    Component_Type NVARCHAR(255),
    Detection_Method NVARCHAR(255),
    Recommended_Action NVARCHAR(MAX),
    Maintenance_Type NVARCHAR(255),
    Downtime_Category NVARCHAR(255),
    Estimated_Downtime_Hours NVARCHAR(255),
    Estimated_Repair_Hours NVARCHAR(255),
    Safety_Impact NVARCHAR(255),
    Quality_Impact NVARCHAR(255),
    Production_Impact NVARCHAR(255),
    Environmental_Impact NVARCHAR(255),
    Required_Skill NVARCHAR(255),
    Required_Spare_Class NVARCHAR(255),
    Root_Cause_Category NVARCHAR(255),
    ISO_14224_Category NVARCHAR(255),
    Status NVARCHAR(255),
    Revision NVARCHAR(255),
    Created_Year NVARCHAR(255),
    Notes NVARCHAR(MAX)
);
GO