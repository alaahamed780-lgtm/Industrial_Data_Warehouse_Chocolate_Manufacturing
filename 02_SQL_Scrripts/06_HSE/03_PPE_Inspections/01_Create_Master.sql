USE Chocolate_Manufacturing_DW;
GO

/*============================================================
04_Create_PPE_Inspections_Master.sql
============================================================*/

IF OBJECT_ID('master.PPE_Inspections_Master','U') IS NOT NULL
    DROP TABLE master.PPE_Inspections_Master;
GO

CREATE TABLE master.PPE_Inspections_Master
(
    PPE_Inspection_ID NVARCHAR(50) NOT NULL,

    Inspection_Number NVARCHAR(50),

    Calendar_Date_Key INT,

    Inspection_Date DATE,

    Inspection_DateTime DATETIME2,

    Plant NVARCHAR(50),

    Area NVARCHAR(100),

    Department NVARCHAR(100),

    Employee_ID NVARCHAR(50),

    Inspector_ID NVARCHAR(50),

    PPE_Type NVARCHAR(100),

    PPE_Item_ID NVARCHAR(50),

    Serial_Number NVARCHAR(100),

    Condition NVARCHAR(50),

    Compliance_Status NVARCHAR(50),

    Expiry_Date DATE,

    Last_Inspection_Date DATE,

    Next_Inspection_Date DATE,

    Defect_Found BIT,

    Corrective_Action NVARCHAR(500),

    Replacement_Required BIT,

    Replacement_Date DATE,

    CAPA_ID NVARCHAR(50),

    Work_Order_ID NVARCHAR(50),

    Risk_Level NVARCHAR(30),

    Status NVARCHAR(30),

    Notes NVARCHAR(500),

    Load_Date DATETIME2
        CONSTRAINT DF_PPE_Inspections_Master_LoadDate
        DEFAULT(GETDATE()),

    CONSTRAINT PK_PPE_Inspections_Master
        PRIMARY KEY (PPE_Inspection_ID)
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
AND TABLE_NAME='PPE_Inspections_Master'
ORDER BY ORDINAL_POSITION;
GO