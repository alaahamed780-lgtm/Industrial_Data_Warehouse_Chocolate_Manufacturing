USE Chocolate_Manufacturing_DW;
GO

/*============================================================
04_Create_Permit_to_Work_Master.sql
============================================================*/

IF OBJECT_ID('master.Permit_to_Work_Master','U') IS NOT NULL
    DROP TABLE master.Permit_to_Work_Master;
GO

CREATE TABLE master.Permit_to_Work_Master
(
    Permit_ID NVARCHAR(50) NOT NULL,

    Permit_Number NVARCHAR(50),

    Calendar_Date_Key INT,

    Issue_Date DATE,

    Issue_DateTime DATETIME2,

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

    Start_DateTime DATETIME2,

    End_DateTime DATETIME2,

    Isolation_Required BIT,

    LOTO_Required BIT,

    Gas_Test_Required BIT,

    Confined_Space BIT,

    Hot_Work BIT,

    Working_at_Height BIT,

    Excavation BIT,

    Electrical_Work BIT,

    Risk_Assessment_ID NVARCHAR(50),

    JSA_Completed BIT,

    PPE_Required NVARCHAR(500),

    Permit_Status NVARCHAR(50),

    Close_DateTime DATETIME2,

    Notes NVARCHAR(500),

    Load_Date DATETIME2
        CONSTRAINT DF_Permit_to_Work_Master_LoadDate
        DEFAULT(GETDATE()),

    CONSTRAINT PK_Permit_to_Work_Master
        PRIMARY KEY (Permit_ID)
);
GO

/*============================================================
Verify Table
============================================================*/

SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='master'
AND TABLE_NAME='Permit_to_Work_Master'
ORDER BY ORDINAL_POSITION;
GO