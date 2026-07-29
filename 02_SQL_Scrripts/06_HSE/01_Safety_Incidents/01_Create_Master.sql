USE Chocolate_Manufacturing_DW;
GO

/*============================================================
04_Create_Safety_Incidents_Master.sql
============================================================*/

IF OBJECT_ID('master.Safety_Incidents_Master','U') IS NOT NULL
    DROP TABLE master.Safety_Incidents_Master;
GO

CREATE TABLE master.Safety_Incidents_Master
(
    Incident_ID NVARCHAR(50) NOT NULL,

    Incident_Number NVARCHAR(50),

    Calendar_Date_Key INT,

    Incident_Date DATE,

    Incident_DateTime DATETIME2,

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

    Lost_Time_Injury BIT,

    Near_Miss BIT,

    Environmental_Impact NVARCHAR(20),

    Root_Cause NVARCHAR(255),

    Immediate_Action NVARCHAR(500),

    Corrective_Action NVARCHAR(500),

    CAPA_ID NVARCHAR(50),

    Investigation_Leader NVARCHAR(100),

    Target_Close_Date DATE,

    Actual_Close_Date DATE,

    Estimated_Cost_USD DECIMAL(18,2),

    Regulatory_Reported BIT,

    Status NVARCHAR(30),

    Notes NVARCHAR(500),

    Load_Date DATETIME2
        CONSTRAINT DF_Safety_Incidents_Master_LoadDate
        DEFAULT(GETDATE()),

    CONSTRAINT PK_Safety_Incidents_Master
        PRIMARY KEY (Incident_ID)
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
AND TABLE_NAME = 'Safety_Incidents_Master'
ORDER BY ORDINAL_POSITION;
GO