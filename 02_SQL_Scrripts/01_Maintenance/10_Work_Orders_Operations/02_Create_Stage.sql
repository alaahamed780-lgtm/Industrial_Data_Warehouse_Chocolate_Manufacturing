USE Chocolate_Manufacturing_DW;
GO

/*=========================================================
  Create Schema
=========================================================*/
IF NOT EXISTS (
    SELECT *
    FROM sys.schemas
    WHERE name = 'staging'
)
BEGIN
    EXEC('CREATE SCHEMA staging');
END;
GO

/*=========================================================
  Drop Old Table
=========================================================*/
IF OBJECT_ID('staging.Work_Order_Operations_Stage','U') IS NOT NULL
    DROP TABLE staging.Work_Order_Operations_Stage;
GO

/*=========================================================
  Create Stage Table
=========================================================*/
CREATE TABLE staging.Work_Order_Operations_Stage
(
    Operation_ID            NVARCHAR(255),
    Work_Order_ID           NVARCHAR(255),
    Operation_No            NVARCHAR(255),
    Operation_Name          NVARCHAR(255),
    Operation_Type          NVARCHAR(255),
    Sequence                NVARCHAR(255),
    Work_Center             NVARCHAR(255),
    Employee_ID             NVARCHAR(255),
    Required_Skill          NVARCHAR(255),
    Equipment_ID            NVARCHAR(255),
    Component_ID            NVARCHAR(255),

    Planned_Start           NVARCHAR(255),
    Actual_Start            NVARCHAR(255),
    Planned_Finish          NVARCHAR(255),
    Actual_Finish           NVARCHAR(255),

    Estimated_Hours         NVARCHAR(255),
    Actual_Hours            NVARCHAR(255),

    Status                  NVARCHAR(255),

    [Completion_%]          NVARCHAR(255),

    Inspection_Required     NVARCHAR(255),
    Shutdown_Required       NVARCHAR(255),
    Safety_Permit           NVARCHAR(255),

    Tool_Group              NVARCHAR(255),
    Required_Tools          NVARCHAR(MAX),

    Operation_Cost_USD      NVARCHAR(255),
    Labor_Cost_USD          NVARCHAR(255),
    Material_Cost_USD       NVARCHAR(255),

    QC_Check                NVARCHAR(255),
    Operation_Result        NVARCHAR(255),
    Delay_Reason            NVARCHAR(MAX),

    Failure_Code_ID         NVARCHAR(255),
    Vendor_ID               NVARCHAR(255),

    Notes                   NVARCHAR(MAX)
);
GO