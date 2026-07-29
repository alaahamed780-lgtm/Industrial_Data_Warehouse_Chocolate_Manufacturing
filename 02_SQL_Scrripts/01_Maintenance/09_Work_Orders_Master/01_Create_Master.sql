USE Chocolate_Manufacturing_DW;
GO

-------------------------------------------------------
-- Create Master Schema
-------------------------------------------------------
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

-------------------------------------------------------
-- Drop Table
-------------------------------------------------------
IF OBJECT_ID('master.Work_Orders_Master','U') IS NOT NULL
DROP TABLE master.Work_Orders_Master;
GO

-------------------------------------------------------
-- Create Table
-------------------------------------------------------
CREATE TABLE master.Work_Orders_Master
(
    Work_Order_ID                    NVARCHAR(30)      NOT NULL,
    WO_Number                        NVARCHAR(30)      NOT NULL,

    Order_Type                       NVARCHAR(50)      NULL,
    Priority                         NVARCHAR(20)      NULL,
    Status                           NVARCHAR(30)      NULL,

    Equipment_ID                     NVARCHAR(30)      NULL,
    Component_ID                     NVARCHAR(30)      NULL,
    Functional_Location_ID           NVARCHAR(30)      NULL,
    Maintenance_Plan_ID              NVARCHAR(30)      NULL,
    Failure_Code_ID                  NVARCHAR(30)      NULL,

    Requested_By                     NVARCHAR(30)      NULL,
    Assigned_Employee_ID             NVARCHAR(30)      NULL,
    Supervisor_ID                    NVARCHAR(30)      NULL,
    Vendor_ID                        NVARCHAR(30)      NULL,

    Plant                            NVARCHAR(50)      NULL,
    Area                             NVARCHAR(100)     NULL,
    Production_Line                  NVARCHAR(100)     NULL,

    Request_Date                     DATE              NULL,

    Planned_Start                    DATETIME2         NULL,
    Planned_Finish                   DATETIME2         NULL,

    Actual_Start                     DATETIME2         NULL,
    Actual_Finish                    DATETIME2         NULL,

    Estimated_Labor_Hours            DECIMAL(10,2)     NULL,
    Actual_Labor_Hours               DECIMAL(10,2)     NULL,

    Estimated_Material_Cost_USD      DECIMAL(18,2)     NULL,
    Actual_Material_Cost_USD         DECIMAL(18,2)     NULL,

    Estimated_Total_Cost_USD         DECIMAL(18,2)     NULL,
    Actual_Total_Cost_USD            DECIMAL(18,2)     NULL,

    Downtime_Hours                   DECIMAL(10,2)     NULL,

    Shutdown_Required                NVARCHAR(10)      NULL,
    Root_Cause_Required              NVARCHAR(10)      NULL,
    Permit_Required                  NVARCHAR(10)      NULL,

    Work_Center                      NVARCHAR(100)     NULL,
    Maintenance_Type                 NVARCHAR(50)      NULL,

    Failure_Description              NVARCHAR(MAX)     NULL,
    Completion_Notes                 NVARCHAR(MAX)     NULL,

    Approval_Status                  NVARCHAR(30)      NULL,
    Cost_Center                      NVARCHAR(50)      NULL,

    CONSTRAINT PK_Work_Orders_Master
        PRIMARY KEY (Work_Order_ID)
);
GO