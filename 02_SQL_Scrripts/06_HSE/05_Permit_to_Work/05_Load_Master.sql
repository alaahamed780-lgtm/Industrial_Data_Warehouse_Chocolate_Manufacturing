USE Chocolate_Manufacturing_DW;
GO

/*============================================================
05_Load_Permit_to_Work_Master.sql
============================================================*/

TRUNCATE TABLE master.Permit_to_Work_Master;
GO

INSERT INTO master.Permit_to_Work_Master
(
    Permit_ID,
    Permit_Number,
    Calendar_Date_Key,
    Issue_Date,
    Issue_DateTime,
    Permit_Type,
    Work_Order_ID,
    Equipment_ID,
    Functional_Location_ID,
    Plant,
    Area,
    Department,
    Requested_By,
    Issued_By,
    Approved_By,
    Contractor_Name,
    Vendor_ID,
    Start_DateTime,
    End_DateTime,
    Isolation_Required,
    LOTO_Required,
    Gas_Test_Required,
    Confined_Space,
    Hot_Work,
    Working_at_Height,
    Excavation,
    Electrical_Work,
    Risk_Assessment_ID,
    JSA_Completed,
    PPE_Required,
    Permit_Status,
    Close_DateTime,
    Notes
)

SELECT

NULLIF(LTRIM(RTRIM(Permit_ID)), ''),

NULLIF(LTRIM(RTRIM(Permit_Number)), ''),

TRY_CONVERT(INT, Calendar_Date_Key),

TRY_CONVERT(DATE, Issue_Date),

TRY_CONVERT(DATETIME2, Issue_DateTime),

NULLIF(LTRIM(RTRIM(Permit_Type)), ''),

NULLIF(LTRIM(RTRIM(Work_Order_ID)), ''),

NULLIF(LTRIM(RTRIM(Equipment_ID)), ''),

NULLIF(LTRIM(RTRIM(Functional_Location_ID)), ''),

NULLIF(LTRIM(RTRIM(Plant)), ''),

NULLIF(LTRIM(RTRIM(Area)), ''),

NULLIF(LTRIM(RTRIM(Department)), ''),

NULLIF(LTRIM(RTRIM(Requested_By)), ''),

NULLIF(LTRIM(RTRIM(Issued_By)), ''),

NULLIF(LTRIM(RTRIM(Approved_By)), ''),

NULLIF(LTRIM(RTRIM(Contractor_Name)), ''),

NULLIF(LTRIM(RTRIM(Vendor_ID)), ''),

TRY_CONVERT(DATETIME2, Start_DateTime),

TRY_CONVERT(DATETIME2, End_DateTime),

CASE
    WHEN UPPER(LTRIM(RTRIM(Isolation_Required))) IN ('YES','Y','TRUE','1') THEN 1
    WHEN UPPER(LTRIM(RTRIM(Isolation_Required))) IN ('NO','N','FALSE','0') THEN 0
    ELSE NULL
END,

CASE
    WHEN UPPER(LTRIM(RTRIM(LOTO_Required))) IN ('YES','Y','TRUE','1') THEN 1
    WHEN UPPER(LTRIM(RTRIM(LOTO_Required))) IN ('NO','N','FALSE','0') THEN 0
    ELSE NULL
END,

CASE
    WHEN UPPER(LTRIM(RTRIM(Gas_Test_Required))) IN ('YES','Y','TRUE','1') THEN 1
    WHEN UPPER(LTRIM(RTRIM(Gas_Test_Required))) IN ('NO','N','FALSE','0') THEN 0
    ELSE NULL
END,

CASE
    WHEN UPPER(LTRIM(RTRIM(Confined_Space))) IN ('YES','Y','TRUE','1') THEN 1
    WHEN UPPER(LTRIM(RTRIM(Confined_Space))) IN ('NO','N','FALSE','0') THEN 0
    ELSE NULL
END,

CASE
    WHEN UPPER(LTRIM(RTRIM(Hot_Work))) IN ('YES','Y','TRUE','1') THEN 1
    WHEN UPPER(LTRIM(RTRIM(Hot_Work))) IN ('NO','N','FALSE','0') THEN 0
    ELSE NULL
END,

CASE
    WHEN UPPER(LTRIM(RTRIM(Working_at_Height))) IN ('YES','Y','TRUE','1') THEN 1
    WHEN UPPER(LTRIM(RTRIM(Working_at_Height))) IN ('NO','N','FALSE','0') THEN 0
    ELSE NULL
END,

CASE
    WHEN UPPER(LTRIM(RTRIM(Excavation))) IN ('YES','Y','TRUE','1') THEN 1
    WHEN UPPER(LTRIM(RTRIM(Excavation))) IN ('NO','N','FALSE','0') THEN 0
    ELSE NULL
END,

CASE
    WHEN UPPER(LTRIM(RTRIM(Electrical_Work))) IN ('YES','Y','TRUE','1') THEN 1
    WHEN UPPER(LTRIM(RTRIM(Electrical_Work))) IN ('NO','N','FALSE','0') THEN 0
    ELSE NULL
END,

NULLIF(LTRIM(RTRIM(Risk_Assessment_ID)), ''),

CASE
    WHEN UPPER(LTRIM(RTRIM(JSA_Completed))) IN ('YES','Y','TRUE','1') THEN 1
    WHEN UPPER(LTRIM(RTRIM(JSA_Completed))) IN ('NO','N','FALSE','0') THEN 0
    ELSE NULL
END,

NULLIF(LTRIM(RTRIM(PPE_Required)), ''),

NULLIF(LTRIM(RTRIM(Permit_Status)), ''),

TRY_CONVERT(DATETIME2, Close_DateTime),

NULLIF(LTRIM(RTRIM(Notes)), '')

FROM staging.Permit_to_Work_Stage;
GO

/*============================================================
Verify Load
============================================================*/

SELECT COUNT(*) AS Master_Count
FROM master.Permit_to_Work_Master;
GO

SELECT TOP (20) *
FROM master.Permit_to_Work_Master
ORDER BY Permit_ID;
GO