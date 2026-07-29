USE Chocolate_Manufacturing_DW;
GO

IF OBJECT_ID('dw.Fact_Work_Orders','U') IS NOT NULL
    DROP TABLE dw.Fact_Work_Orders;
GO

CREATE TABLE dw.Fact_Work_Orders
(
    Work_Order_Key BIGINT IDENTITY(1,1) PRIMARY KEY,

    Work_Order_ID NVARCHAR(50) NOT NULL,
    WO_Number NVARCHAR(50),

    Date_Key INT,
    Equipment_Key INT,
    Employee_Key INT,

    Order_Type NVARCHAR(100),
    Priority NVARCHAR(50),
    Status NVARCHAR(50),

    Component_ID NVARCHAR(50),
    Functional_Location_ID NVARCHAR(50),
    Maintenance_Plan_ID NVARCHAR(50),
    Failure_Code_ID NVARCHAR(50),

    Requested_By NVARCHAR(100),
    Supervisor_ID NVARCHAR(50),
    Vendor_ID NVARCHAR(50),

    Plant NVARCHAR(100),
    Area NVARCHAR(100),
    Production_Line NVARCHAR(100),

    Planned_Start DATETIME2,
    Planned_Finish DATETIME2,

    Actual_Start DATETIME2,
    Actual_Finish DATETIME2,

    Estimated_Labor_Hours DECIMAL(18,2),
    Actual_Labor_Hours DECIMAL(18,2),

    Estimated_Material_Cost_USD DECIMAL(18,2),
    Actual_Material_Cost_USD DECIMAL(18,2),

    Estimated_Total_Cost_USD DECIMAL(18,2),
    Actual_Total_Cost_USD DECIMAL(18,2),

    Downtime_Hours DECIMAL(18,2),

    Shutdown_Required NVARCHAR(20),
    Root_Cause_Required NVARCHAR(20),
    Permit_Required NVARCHAR(20),

    Work_Center NVARCHAR(100),
    Maintenance_Type NVARCHAR(100),

    Failure_Description NVARCHAR(500),
    Completion_Notes NVARCHAR(MAX),

    Approval_Status NVARCHAR(50),

    Cost_Center NVARCHAR(50)
);
GO

PRINT 'dw.Fact_Work_Orders Created Successfully';
GO