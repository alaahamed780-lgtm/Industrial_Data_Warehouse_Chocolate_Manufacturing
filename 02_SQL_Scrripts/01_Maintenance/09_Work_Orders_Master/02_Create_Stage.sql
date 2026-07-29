USE Chocolate_Manufacturing_DW;
GO

-------------------------------------------------------
-- Create Staging Schema
-------------------------------------------------------
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

-------------------------------------------------------
-- Drop Table
-------------------------------------------------------
IF OBJECT_ID('staging.Work_Orders_Stage','U') IS NOT NULL
DROP TABLE staging.Work_Orders_Stage;
GO

-------------------------------------------------------
-- Create Stage Table
-------------------------------------------------------
CREATE TABLE staging.Work_Orders_Stage
(
    Work_Order_ID                    NVARCHAR(255),
    WO_Number                        NVARCHAR(255),

    Order_Type                       NVARCHAR(255),
    Priority                         NVARCHAR(255),
    Status                           NVARCHAR(255),

    Equipment_ID                     NVARCHAR(255),
    Component_ID                     NVARCHAR(255),
    Functional_Location_ID           NVARCHAR(255),
    Maintenance_Plan_ID              NVARCHAR(255),
    Failure_Code_ID                  NVARCHAR(255),

    Requested_By                     NVARCHAR(255),
    Assigned_Employee_ID             NVARCHAR(255),
    Supervisor_ID                    NVARCHAR(255),
    Vendor_ID                        NVARCHAR(255),

    Plant                            NVARCHAR(255),
    Area                             NVARCHAR(255),
    Production_Line                  NVARCHAR(255),

    Request_Date                     NVARCHAR(255),

    Planned_Start                    NVARCHAR(255),
    Planned_Finish                   NVARCHAR(255),

    Actual_Start                     NVARCHAR(255),
    Actual_Finish                    NVARCHAR(255),

    Estimated_Labor_Hours            NVARCHAR(255),
    Actual_Labor_Hours               NVARCHAR(255),

    Estimated_Material_Cost_USD      NVARCHAR(255),
    Actual_Material_Cost_USD         NVARCHAR(255),

    Estimated_Total_Cost_USD         NVARCHAR(255),
    Actual_Total_Cost_USD            NVARCHAR(255),

    Downtime_Hours                   NVARCHAR(255),

    Shutdown_Required                NVARCHAR(255),
    Root_Cause_Required              NVARCHAR(255),
    Permit_Required                  NVARCHAR(255),

    Work_Center                      NVARCHAR(255),
    Maintenance_Type                 NVARCHAR(255),

    Failure_Description              NVARCHAR(MAX),
    Completion_Notes                 NVARCHAR(MAX),

    Approval_Status                  NVARCHAR(255),
    Cost_Center                      NVARCHAR(255)
);
GO