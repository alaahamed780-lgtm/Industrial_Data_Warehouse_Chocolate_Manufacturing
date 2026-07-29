USE Chocolate_Manufacturing_DW;
GO

TRUNCATE TABLE master.Maintenance_Plans_Master;
GO

INSERT INTO master.Maintenance_Plans_Master
(
    Failure_Code_ID,
    Failure_Code,
    Failure_Group,
    Failure_Category,
    Failure_Mode,
    Failure_Cause,
    Failure_Effect,
    Severity,
    Probability,
    Risk_Priority,
    Equipment_Category,
    Component_Type,
    Detection_Method,
    Recommended_Action,
    Maintenance_Type,
    Downtime_Category,
    Estimated_Downtime_Hours,
    Estimated_Repair_Hours,
    Safety_Impact,
    Quality_Impact,
    Production_Impact,
    Environmental_Impact,
    Required_Skill,
    Required_Spare_Class,
    Root_Cause_Category,
    ISO_14224_Category,
    Status,
    Revision,
    Created_Year,
    Notes
)
SELECT

    NULLIF(LTRIM(RTRIM(Failure_Code_ID)), ''),
    NULLIF(LTRIM(RTRIM(Failure_Code)), ''),
    NULLIF(LTRIM(RTRIM(Failure_Group)), ''),
    NULLIF(LTRIM(RTRIM(Failure_Category)), ''),
    NULLIF(LTRIM(RTRIM(Failure_Mode)), ''),
    NULLIF(LTRIM(RTRIM(Failure_Cause)), ''),
    NULLIF(LTRIM(RTRIM(Failure_Effect)), ''),
    NULLIF(LTRIM(RTRIM(Severity)), ''),

    TRY_CONVERT(SMALLINT, Probability),
    TRY_CONVERT(SMALLINT, Risk_Priority),

    NULLIF(LTRIM(RTRIM(Equipment_Category)), ''),
    NULLIF(LTRIM(RTRIM(Component_Type)), ''),

    NULLIF(LTRIM(RTRIM(Detection_Method)), ''),
    NULLIF(LTRIM(RTRIM(Recommended_Action)), ''),

    NULLIF(LTRIM(RTRIM(Maintenance_Type)), ''),
    NULLIF(LTRIM(RTRIM(Downtime_Category)), ''),

    TRY_CONVERT(DECIMAL(10,2), Estimated_Downtime_Hours),
    TRY_CONVERT(DECIMAL(10,2), Estimated_Repair_Hours),

    NULLIF(LTRIM(RTRIM(Safety_Impact)), ''),
    NULLIF(LTRIM(RTRIM(Quality_Impact)), ''),
    NULLIF(LTRIM(RTRIM(Production_Impact)), ''),
    NULLIF(LTRIM(RTRIM(Environmental_Impact)), ''),

    NULLIF(LTRIM(RTRIM(Required_Skill)), ''),
    NULLIF(LTRIM(RTRIM(Required_Spare_Class)), ''),

    NULLIF(LTRIM(RTRIM(Root_Cause_Category)), ''),
    NULLIF(LTRIM(RTRIM(ISO_14224_Category)), ''),

    NULLIF(LTRIM(RTRIM(Status)), ''),
    NULLIF(LTRIM(RTRIM(Revision)), ''),

    TRY_CONVERT(SMALLINT, Created_Year),

    NULLIF(LTRIM(RTRIM(Notes)), '')

FROM staging.Maintenance_Plans_Stage;
GO