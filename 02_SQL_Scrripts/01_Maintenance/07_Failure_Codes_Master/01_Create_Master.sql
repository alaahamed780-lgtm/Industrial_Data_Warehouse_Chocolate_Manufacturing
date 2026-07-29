USE Chocolate_Manufacturing_DW;
GO

IF NOT EXISTS (
    SELECT *
    FROM sys.schemas
    WHERE name = 'master'
)
BEGIN
    EXEC('CREATE SCHEMA master');
END
GO

IF OBJECT_ID('master.Failure_Codes_Master','U') IS NOT NULL
DROP TABLE master.Failure_Codes_Master;
GO

CREATE TABLE master.Failure_Codes_Master
(
    Failure_Code_ID            NVARCHAR(20)     NOT NULL,
    Failure_Code               NVARCHAR(30)     NOT NULL,

    Failure_Group              NVARCHAR(100)    NULL,
    Failure_Category           NVARCHAR(100)    NULL,

    Failure_Mode               NVARCHAR(200)    NULL,
    Failure_Cause              NVARCHAR(MAX)    NULL,
    Failure_Effect             NVARCHAR(MAX)    NULL,

    Severity                   NVARCHAR(20)     NULL,

    Probability                SMALLINT         NULL,
    Risk_Priority              SMALLINT         NULL,

    Equipment_Category         NVARCHAR(100)    NULL,
    Component_Type             NVARCHAR(100)    NULL,

    Detection_Method           NVARCHAR(200)    NULL,
    Recommended_Action         NVARCHAR(MAX)    NULL,

    Maintenance_Type           NVARCHAR(50)     NULL,
    Downtime_Category          NVARCHAR(50)     NULL,

    Estimated_Downtime_Hours   DECIMAL(10,2)    NULL,
    Estimated_Repair_Hours     DECIMAL(10,2)    NULL,

    Safety_Impact              NVARCHAR(50)     NULL,
    Quality_Impact             NVARCHAR(50)     NULL,
    Production_Impact          NVARCHAR(50)     NULL,
    Environmental_Impact       NVARCHAR(50)     NULL,

    Required_Skill             NVARCHAR(100)    NULL,
    Required_Spare_Class       NVARCHAR(50)     NULL,

    Root_Cause_Category        NVARCHAR(100)    NULL,
    ISO_14224_Category         NVARCHAR(100)    NULL,

    Status                     NVARCHAR(30)     NULL,
    Revision                   NVARCHAR(20)     NULL,

    Created_Year               SMALLINT         NULL,

    Notes                      NVARCHAR(MAX)    NULL,

    CONSTRAINT PK_Failure_Codes_Master
        PRIMARY KEY (Failure_Code_ID)
);
GO