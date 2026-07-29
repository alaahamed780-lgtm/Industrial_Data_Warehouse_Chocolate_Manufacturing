USE Chocolate_Manufacturing_DW;
GO

-------------------------------------------------------
-- تنظيف جدول Master
-------------------------------------------------------
TRUNCATE TABLE master.Work_Orders_Master;
GO

-------------------------------------------------------
-- تحميل البيانات
-------------------------------------------------------
INSERT INTO master.Work_Orders_Master
(
    Work_Order_ID,
    WO_Number,
    Order_Type,
    Priority,
    Status,
    Equipment_ID,
    Component_ID,
    Functional_Location_ID,
    Maintenance_Plan_ID,
    Failure_Code_ID,
    Requested_By,
    Assigned_Employee_ID,
    Supervisor_ID,
    Vendor_ID,
    Plant,
    Area,
    Production_Line,
    Request_Date,
    Planned_Start,
    Planned_Finish,
    Actual_Start,
    Actual_Finish,
    Estimated_Labor_Hours,
    Actual_Labor_Hours,
    Estimated_Material_Cost_USD,
    Actual_Material_Cost_USD,
    Estimated_Total_Cost_USD,
    Actual_Total_Cost_USD,
    Downtime_Hours,
    Shutdown_Required,
    Root_Cause_Required,
    Permit_Required,
    Work_Center,
    Maintenance_Type,
    Failure_Description,
    Completion_Notes,
    Approval_Status,
    Cost_Center
)
SELECT

NULLIF(LTRIM(RTRIM(Work_Order_ID)), ''),
NULLIF(LTRIM(RTRIM(WO_Number)), ''),
NULLIF(LTRIM(RTRIM(Order_Type)), ''),
NULLIF(LTRIM(RTRIM(Priority)), ''),
NULLIF(LTRIM(RTRIM(Status)), ''),

NULLIF(LTRIM(RTRIM(Equipment_ID)), ''),
NULLIF(LTRIM(RTRIM(Component_ID)), ''),
NULLIF(LTRIM(RTRIM(Functional_Location_ID)), ''),
NULLIF(LTRIM(RTRIM(Maintenance_Plan_ID)), ''),
NULLIF(LTRIM(RTRIM(Failure_Code_ID)), ''),

NULLIF(LTRIM(RTRIM(Requested_By)), ''),
NULLIF(LTRIM(RTRIM(Assigned_Employee_ID)), ''),
NULLIF(LTRIM(RTRIM(Supervisor_ID)), ''),
NULLIF(LTRIM(RTRIM(Vendor_ID)), ''),

NULLIF(LTRIM(RTRIM(Plant)), ''),
NULLIF(LTRIM(RTRIM(Area)), ''),
NULLIF(LTRIM(RTRIM(Production_Line)), ''),

TRY_CONVERT(DATE, Request_Date),

TRY_CONVERT(DATETIME2, Planned_Start),
TRY_CONVERT(DATETIME2, Planned_Finish),

TRY_CONVERT(DATETIME2, Actual_Start),
TRY_CONVERT(DATETIME2, Actual_Finish),

TRY_CONVERT(DECIMAL(10,2), Estimated_Labor_Hours),
TRY_CONVERT(DECIMAL(10,2), Actual_Labor_Hours),

TRY_CONVERT(DECIMAL(18,2), Estimated_Material_Cost_USD),
TRY_CONVERT(DECIMAL(18,2), Actual_Material_Cost_USD),

TRY_CONVERT(DECIMAL(18,2), Estimated_Total_Cost_USD),
TRY_CONVERT(DECIMAL(18,2), Actual_Total_Cost_USD),

TRY_CONVERT(DECIMAL(10,2), Downtime_Hours),

NULLIF(LTRIM(RTRIM(Shutdown_Required)), ''),
NULLIF(LTRIM(RTRIM(Root_Cause_Required)), ''),
NULLIF(LTRIM(RTRIM(Permit_Required)), ''),

NULLIF(LTRIM(RTRIM(Work_Center)), ''),
NULLIF(LTRIM(RTRIM(Maintenance_Type)), ''),

NULLIF(LTRIM(RTRIM(Failure_Description)), ''),
NULLIF(LTRIM(RTRIM(Completion_Notes)), ''),

NULLIF(LTRIM(RTRIM(Approval_Status)), ''),
NULLIF(LTRIM(RTRIM(Cost_Center)), '')

FROM staging.Work_Orders_Stage;
GO