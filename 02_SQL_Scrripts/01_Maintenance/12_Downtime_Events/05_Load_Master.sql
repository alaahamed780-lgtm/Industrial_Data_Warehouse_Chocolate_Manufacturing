USE Chocolate_Manufacturing_DW;
GO

/*============================================================
Load Data From Stage To Master
============================================================*/

TRUNCATE TABLE master.Downtime_Events_Master;
GO

INSERT INTO master.Downtime_Events_Master
(
    Downtime_Event_ID,
    Event_Date,
    Start_DateTime,
    End_DateTime,
    Duration_Minutes,
    Shift,
    Plant,
    Area,
    Production_Line,
    Equipment_ID,
    Component_ID,
    Functional_Location_ID,
    Work_Order_ID,
    Failure_Code_ID,
    Downtime_Type,
    Failure_Mode,
    Root_Cause,
    Priority,
    Planned_Unplanned,
    Production_Order,
    Product_Code,
    Lost_Production_kg,
    OEE_Loss_Percent,
    MTTR_Hours,
    MTBF_Hours,
    Operator_ID,
    Maintenance_Team,
    Vendor_ID,
    Weather,
    Status,
    Created_Date,
    Closed_Date,
    Cost_Impact_USD,
    Safety_Incident,
    Quality_Impact,
    Notes
)

SELECT

    NULLIF(LTRIM(RTRIM(Downtime_Event_ID)),''),
    TRY_CONVERT(DATE,Event_Date),
    TRY_CONVERT(DATETIME2,Start_DateTime),
    TRY_CONVERT(DATETIME2,End_DateTime),
    TRY_CONVERT(DECIMAL(10,2),Duration_Minutes),

    NULLIF(LTRIM(RTRIM(Shift)),''),
    NULLIF(LTRIM(RTRIM(Plant)),''),
    NULLIF(LTRIM(RTRIM(Area)),''),
    NULLIF(LTRIM(RTRIM(Production_Line)),''),
    NULLIF(LTRIM(RTRIM(Equipment_ID)),''),
    NULLIF(LTRIM(RTRIM(Component_ID)),''),
    NULLIF(LTRIM(RTRIM(Functional_Location_ID)),''),
    NULLIF(LTRIM(RTRIM(Work_Order_ID)),''),
    NULLIF(LTRIM(RTRIM(Failure_Code_ID)),''),
    NULLIF(LTRIM(RTRIM(Downtime_Type)),''),
    NULLIF(LTRIM(RTRIM(Failure_Mode)),''),
    NULLIF(LTRIM(RTRIM(Root_Cause)),''),
    NULLIF(LTRIM(RTRIM(Priority)),''),
    NULLIF(LTRIM(RTRIM(Planned_Unplanned)),''),
    NULLIF(LTRIM(RTRIM(Production_Order)),''),
    NULLIF(LTRIM(RTRIM(Product_Code)),''),

    TRY_CONVERT(DECIMAL(18,2),Lost_Production_kg),
    TRY_CONVERT(DECIMAL(5,2),OEE_Loss_Percent),
        TRY_CONVERT(DECIMAL(10,2),MTTR_Hours),
    TRY_CONVERT(DECIMAL(10,2),MTBF_Hours),

    NULLIF(LTRIM(RTRIM(Operator_ID)),''),
    NULLIF(LTRIM(RTRIM(Maintenance_Team)),''),
    NULLIF(LTRIM(RTRIM(Vendor_ID)),''),
    NULLIF(LTRIM(RTRIM(Weather)),''),
    NULLIF(LTRIM(RTRIM(Status)),''),

    TRY_CONVERT(DATE,Created_Date),
    TRY_CONVERT(DATE,Closed_Date),

    TRY_CONVERT(DECIMAL(18,2),Cost_Impact_USD),

    NULLIF(LTRIM(RTRIM(Safety_Incident)),''),
    NULLIF(LTRIM(RTRIM(Quality_Impact)),''),
    NULLIF(LTRIM(RTRIM(Notes)),'')

FROM staging.Downtime_Events_Stage;
GO

/*============================================================
Verify Load
============================================================*/

SELECT COUNT(*) AS Stage_Count
FROM staging.Downtime_Events_Stage;
GO

SELECT COUNT(*) AS Master_Count
FROM master.Downtime_Events_Master;
GO

SELECT TOP (20) *
FROM master.Downtime_Events_Master;
GO