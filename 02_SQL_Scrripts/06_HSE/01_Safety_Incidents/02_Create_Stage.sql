USE Chocolate_Manufacturing_DW;
GO

/*============================================================
01_Create_Safety_Incidents_Stage.sql
============================================================*/

IF OBJECT_ID('staging.Safety_Incidents_Stage','U') IS NOT NULL
    DROP TABLE staging.Safety_Incidents_Stage;
GO

CREATE TABLE staging.Safety_Incidents_Stage
(
    Incident_ID NVARCHAR(50),

    Incident_Number NVARCHAR(50),

    Calendar_Date_Key NVARCHAR(20),

    Incident_Date NVARCHAR(30),

    Incident_DateTime NVARCHAR(30),

    Plant NVARCHAR(50),

    Area NVARCHAR(100),

    Location NVARCHAR(200),

    Department NVARCHAR(100),

    Incident_Type NVARCHAR(100),

    Severity NVARCHAR(50),

    Employee_ID NVARCHAR(50),

    Equipment_ID NVARCHAR(50),

    Work_Order_ID NVARCHAR(50),

    Production_Order_ID NVARCHAR(50),

    Injury_Type NVARCHAR(100),

    Lost_Time_Injury NVARCHAR(10),

    Near_Miss NVARCHAR(10),

    Environmental_Impact NVARCHAR(20),

    Root_Cause NVARCHAR(255),

    Immediate_Action NVARCHAR(500),

    Corrective_Action NVARCHAR(500),

    CAPA_ID NVARCHAR(50),

    Investigation_Leader NVARCHAR(100),

    Target_Close_Date NVARCHAR(30),

    Actual_Close_Date NVARCHAR(30),

    Estimated_Cost_USD NVARCHAR(30),

    Regulatory_Reported NVARCHAR(10),

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
WHERE TABLE_SCHEMA = 'staging'
  AND TABLE_NAME = 'Safety_Incidents_Stage'
ORDER BY ORDINAL_POSITION;
GO