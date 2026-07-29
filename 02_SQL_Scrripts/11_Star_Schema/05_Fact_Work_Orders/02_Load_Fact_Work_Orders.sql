USE Chocolate_Manufacturing_DW;
GO

TRUNCATE TABLE dw.Fact_Work_Orders;
GO

INSERT INTO dw.Fact_Work_Orders
(
    Work_Order_ID,
    WO_Number,

    Date_Key,
    Equipment_Key,
    Employee_Key,

    Order_Type,
    Priority,
    Status,

    Component_ID,
    Functional_Location_ID,
    Maintenance_Plan_ID,
    Failure_Code_ID,

    Requested_By,
    Supervisor_ID,
    Vendor_ID,

    Plant,
    Area,
    Production_Line,

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

    WO.Work_Order_ID,
    WO.WO_Number,

    DD.Date_Key,
    DE.Equipment_Key,
    EMP.Employee_Key,

    WO.Order_Type,
    WO.Priority,
    WO.Status,

    WO.Component_ID,
    WO.Functional_Location_ID,
    WO.Maintenance_Plan_ID,
    WO.Failure_Code_ID,

    WO.Requested_By,
    WO.Supervisor_ID,
    WO.Vendor_ID,

    WO.Plant,
    WO.Area,
    WO.Production_Line,

    WO.Planned_Start,
    WO.Planned_Finish,

    WO.Actual_Start,
    WO.Actual_Finish,

    WO.Estimated_Labor_Hours,
    WO.Actual_Labor_Hours,

    WO.Estimated_Material_Cost_USD,
    WO.Actual_Material_Cost_USD,

    WO.Estimated_Total_Cost_USD,
    WO.Actual_Total_Cost_USD,

    WO.Downtime_Hours,

    WO.Shutdown_Required,
    WO.Root_Cause_Required,
    WO.Permit_Required,

    WO.Work_Center,
    WO.Maintenance_Type,

    WO.Failure_Description,
    WO.Completion_Notes,

    WO.Approval_Status,

    WO.Cost_Center

FROM master.Work_Orders_Master WO

LEFT JOIN dw.Dim_Date DD
ON DD.Date = WO.Request_Date

LEFT JOIN dw.Dim_Equipment DE
ON DE.Equipment_ID = WO.Equipment_ID

LEFT JOIN dw.Dim_Employee EMP
ON EMP.Employee_ID = WO.Assigned_Employee_ID;
GO

PRINT 'Fact_Work_Orders Loaded Successfully';
GO