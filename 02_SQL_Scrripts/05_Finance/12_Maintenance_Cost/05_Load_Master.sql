USE Chocolate_Manufacturing_DW;
GO

/*============================================================
05_Load_Maintenance_Cost_Master.sql
============================================================*/

TRUNCATE TABLE master.Maintenance_Cost_Master;
GO

INSERT INTO master.Maintenance_Cost_Master
(
    Maintenance_Cost_ID,
    Calendar_Date_Key,
    Cost_Date,
    Work_Order_ID,
    Equipment_ID,
    Functional_Location_ID,
    Cost_Center_ID,
    GL_Account_ID,
    Maintenance_Plan_ID,
    Maintenance_Type,
    Failure_Code,
    Vendor_ID,
    Labor_Hours,
    Labor_Cost_USD,
    Spare_Parts_Cost_USD,
    External_Service_Cost_USD,
    Tool_Cost_USD,
    Energy_Cost_USD,
    Utilities_Cost_USD,
    Overhead_Cost_USD,
    Total_Maintenance_Cost_USD,
    Downtime_Min,
    MTTR_Min,
    Technician_ID,
    Plant,
    Area,
    Status,
    Notes
)

SELECT

NULLIF(LTRIM(RTRIM(Maintenance_Cost_ID)), ''),

TRY_CONVERT(INT, Calendar_Date_Key),

TRY_CONVERT(DATE, Cost_Date),

NULLIF(LTRIM(RTRIM(Work_Order_ID)), ''),

NULLIF(LTRIM(RTRIM(Equipment_ID)), ''),

NULLIF(LTRIM(RTRIM(Functional_Location_ID)), ''),

NULLIF(LTRIM(RTRIM(Cost_Center_ID)), ''),

NULLIF(LTRIM(RTRIM(GL_Account_ID)), ''),

NULLIF(LTRIM(RTRIM(Maintenance_Plan_ID)), ''),

NULLIF(LTRIM(RTRIM(Maintenance_Type)), ''),

NULLIF(LTRIM(RTRIM(Failure_Code)), ''),

NULLIF(LTRIM(RTRIM(Vendor_ID)), ''),

TRY_CONVERT(DECIMAL(18,2), Labor_Hours),

TRY_CONVERT(DECIMAL(18,2), Labor_Cost_USD),

TRY_CONVERT(DECIMAL(18,2), Spare_Parts_Cost_USD),

TRY_CONVERT(DECIMAL(18,2), External_Service_Cost_USD),

TRY_CONVERT(DECIMAL(18,2), Tool_Cost_USD),

TRY_CONVERT(DECIMAL(18,2), Energy_Cost_USD),

TRY_CONVERT(DECIMAL(18,2), Utilities_Cost_USD),

TRY_CONVERT(DECIMAL(18,2), Overhead_Cost_USD),

TRY_CONVERT(DECIMAL(18,2), Total_Maintenance_Cost_USD),

TRY_CONVERT(DECIMAL(18,2), Downtime_Min),

TRY_CONVERT(DECIMAL(18,2), MTTR_Min),

NULLIF(LTRIM(RTRIM(Technician_ID)), ''),

NULLIF(LTRIM(RTRIM(Plant)), ''),

NULLIF(LTRIM(RTRIM(Area)), ''),

NULLIF(LTRIM(RTRIM(Status)), ''),

NULLIF(LTRIM(RTRIM(Notes)), '')

FROM staging.Maintenance_Cost_Stage;
GO

/*============================================================
Verify Load
============================================================*/

SELECT COUNT(*) AS Master_Count
FROM master.Maintenance_Cost_Master;
GO

SELECT TOP (20) *
FROM master.Maintenance_Cost_Master
ORDER BY Maintenance_Cost_ID;
GO