USE Chocolate_Manufacturing_DW;
GO

/*============================================================
01_Create_Permit_to_Work_Stage.sql
============================================================*/

IF OBJECT_ID('staging.Permit_to_Work_Stage','U') IS NOT NULL
    DROP TABLE staging.Permit_to_Work_Stage;
GO

CREATE TABLE staging.Permit_to_Work_Stage
(
    Permit_ID NVARCHAR(50),
    Permit_Number NVARCHAR(50),
    Calendar_Date_Key NVARCHAR(20),
    Issue_Date NVARCHAR(30),
    Issue_DateTime NVARCHAR(30),
    Permit_Type NVARCHAR(100),
    Work_Order_ID NVARCHAR(50),
    Equipment_ID NVARCHAR(50),
    Functional_Location_ID NVARCHAR(50),
    Plant NVARCHAR(50),
    Area NVARCHAR(100),
    Department NVARCHAR(100),
    Requested_By NVARCHAR(50),
    Issued_By NVARCHAR(50),
    Approved_By NVARCHAR(50),
    Contractor_Name NVARCHAR(200),
    Vendor_ID NVARCHAR(50),
    Start_DateTime NVARCHAR(30),
    End_DateTime NVARCHAR(30),
    Isolation_Required NVARCHAR(20),
    LOTO_Required NVARCHAR(20),
    Gas_Test_Required NVARCHAR(20),
    Confined_Space NVARCHAR(20),
    Hot_Work NVARCHAR(20),
    Working_at_Height NVARCHAR(20),
    Excavation NVARCHAR(20),
    Electrical_Work NVARCHAR(20),
    Risk_Assessment_ID NVARCHAR(50),
    JSA_Completed NVARCHAR(20),
    PPE_Required NVARCHAR(500),
    Permit_Status NVARCHAR(50),
    Close_DateTime NVARCHAR(30),
    Notes NVARCHAR(500)
);
GO

/*============================================================
Verify Table
============================================================*/

SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'staging'
  AND TABLE_NAME = 'Permit_to_Work_Stage'
ORDER BY ORDINAL_POSITION;
GO