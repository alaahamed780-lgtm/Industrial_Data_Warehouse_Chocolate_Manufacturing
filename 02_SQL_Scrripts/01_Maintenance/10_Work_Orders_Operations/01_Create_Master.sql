USE Chocolate_Manufacturing_DW;
GO

/*=========================================================
  Create Schema
=========================================================*/
IF NOT EXISTS
(
    SELECT *
    FROM sys.schemas
    WHERE name = 'master'
)
BEGIN
    EXEC('CREATE SCHEMA master');
END
GO

/*=========================================================
  Drop Old Table
=========================================================*/
IF OBJECT_ID('master.Work_Order_Operations_Master','U') IS NOT NULL
DROP TABLE master.Work_Order_Operations_Master;
GO

/*=========================================================
  Create Master Table
=========================================================*/
CREATE TABLE master.Work_Order_Operations_Master
(
    Operation_ID            NVARCHAR(30)     NOT NULL,
    Work_Order_ID           NVARCHAR(30)     NOT NULL,

    Operation_No            SMALLINT         NULL,
    Operation_Name          NVARCHAR(200)    NULL,
    Operation_Type          NVARCHAR(100)    NULL,

    Sequence                SMALLINT         NULL,

    Work_Center             NVARCHAR(100)    NULL,

    Employee_ID             NVARCHAR(30)     NULL,

    Required_Skill          NVARCHAR(100)    NULL,

    Equipment_ID            NVARCHAR(30)     NULL,
    Component_ID            NVARCHAR(30)     NULL,

    Planned_Start           DATETIME2        NULL,
    Actual_Start            DATETIME2        NULL,

    Planned_Finish          DATETIME2        NULL,
    Actual_Finish           DATETIME2        NULL,

    Estimated_Hours         DECIMAL(10,2)    NULL,
    Actual_Hours            DECIMAL(10,2)    NULL,

    Status                  NVARCHAR(50)     NULL,

    Completion_Percent      SMALLINT         NULL,

    Inspection_Required     NVARCHAR(10)     NULL,
    Shutdown_Required       NVARCHAR(10)     NULL,
    Safety_Permit           NVARCHAR(10)     NULL,

    Tool_Group              NVARCHAR(100)    NULL,
    Required_Tools          NVARCHAR(MAX)    NULL,

    Operation_Cost_USD      DECIMAL(18,2)    NULL,
    Labor_Cost_USD          DECIMAL(18,2)    NULL,
    Material_Cost_USD       DECIMAL(18,2)    NULL,

    QC_Check                NVARCHAR(20)     NULL,

    Operation_Result        NVARCHAR(100)    NULL,

    Delay_Reason            NVARCHAR(MAX)    NULL,

    Failure_Code_ID         NVARCHAR(30)     NULL,

    Vendor_ID               NVARCHAR(30)     NULL,

    Notes                   NVARCHAR(MAX)    NULL,

    CONSTRAINT PK_Work_Order_Operations_Master
        PRIMARY KEY (Operation_ID)
);
GO