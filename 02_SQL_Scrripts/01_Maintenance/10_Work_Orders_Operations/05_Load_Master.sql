USE Chocolate_Manufacturing_DW;
GO

------------------------------------------------------------
-- تنظيف جدول Master
------------------------------------------------------------
TRUNCATE TABLE master.Work_Order_Operations_Master;
GO

------------------------------------------------------------
-- تحميل البيانات من Stage إلى Master
------------------------------------------------------------
INSERT INTO master.Work_Order_Operations_Master
(
    Operation_ID,
    Work_Order_ID,
    Operation_No,
    Operation_Name,
    Operation_Type,
    Sequence,
    Work_Center,
    Employee_ID,
    Required_Skill,
    Equipment_ID,
    Component_ID,

    Planned_Start,
    Actual_Start,
    Planned_Finish,
    Actual_Finish,

    Estimated_Hours,
    Actual_Hours,

    Status,
    Completion_Percent,

    Inspection_Required,
    Shutdown_Required,
    Safety_Permit,

    Tool_Group,
    Required_Tools,

    Operation_Cost_USD,
    Labor_Cost_USD,
    Material_Cost_USD,

    QC_Check,
    Operation_Result,
    Delay_Reason,
    Failure_Code_ID,
    Vendor_ID,
    Notes
)

SELECT

    NULLIF(LTRIM(RTRIM(Operation_ID)),''),

    NULLIF(LTRIM(RTRIM(Work_Order_ID)),''),

    TRY_CONVERT(SMALLINT,Operation_No),

    NULLIF(LTRIM(RTRIM(Operation_Name)),''),

    NULLIF(LTRIM(RTRIM(Operation_Type)),''),

    TRY_CONVERT(SMALLINT,[Sequence]),

    NULLIF(LTRIM(RTRIM(Work_Center)),''),

    NULLIF(LTRIM(RTRIM(Employee_ID)),''),

    NULLIF(LTRIM(RTRIM(Required_Skill)),''),

    NULLIF(LTRIM(RTRIM(Equipment_ID)),''),

    NULLIF(LTRIM(RTRIM(Component_ID)),''),

    TRY_CONVERT(DATETIME2,Planned_Start),

    TRY_CONVERT(DATETIME2,Actual_Start),

    TRY_CONVERT(DATETIME2,Planned_Finish),

    TRY_CONVERT(DATETIME2,Actual_Finish),

    TRY_CONVERT(DECIMAL(10,2),Estimated_Hours),

    TRY_CONVERT(DECIMAL(10,2),Actual_Hours),

    NULLIF(LTRIM(RTRIM(Status)),''),

    TRY_CONVERT(SMALLINT,[Completion_%]),

    NULLIF(LTRIM(RTRIM(Inspection_Required)),''),

    NULLIF(LTRIM(RTRIM(Shutdown_Required)),''),

    NULLIF(LTRIM(RTRIM(Safety_Permit)),''),

    NULLIF(LTRIM(RTRIM(Tool_Group)),''),

    NULLIF(LTRIM(RTRIM(Required_Tools)),''),

    TRY_CONVERT(DECIMAL(18,2),Operation_Cost_USD),

    TRY_CONVERT(DECIMAL(18,2),Labor_Cost_USD),

    TRY_CONVERT(DECIMAL(18,2),Material_Cost_USD),

    NULLIF(LTRIM(RTRIM(QC_Check)),''),

    NULLIF(LTRIM(RTRIM(Operation_Result)),''),

    NULLIF(LTRIM(RTRIM(Delay_Reason)),''),

    NULLIF(LTRIM(RTRIM(Failure_Code_ID)),''),

    NULLIF(LTRIM(RTRIM(Vendor_ID)),''),

    NULLIF(LTRIM(RTRIM(Notes)),'')

FROM staging.Work_Order_Operations_Stage;
GO