USE Chocolate_Manufacturing_DW;
GO

/*============================================================
01_Create_PPE_Inspections_Stage.sql
============================================================*/

IF OBJECT_ID('staging.PPE_Inspections_Stage','U') IS NOT NULL
    DROP TABLE staging.PPE_Inspections_Stage;
GO

CREATE TABLE staging.PPE_Inspections_Stage
(
    PPE_Inspection_ID NVARCHAR(50),

    Inspection_Number NVARCHAR(50),

    Calendar_Date_Key NVARCHAR(20),

    Inspection_Date NVARCHAR(30),

    Inspection_DateTime NVARCHAR(30),

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

    Expiry_Date NVARCHAR(30),

    Last_Inspection_Date NVARCHAR(30),

    Next_Inspection_Date NVARCHAR(30),

    Defect_Found NVARCHAR(10),

    Corrective_Action NVARCHAR(500),

    Replacement_Required NVARCHAR(10),

    Replacement_Date NVARCHAR(30),

    CAPA_ID NVARCHAR(50),

    Work_Order_ID NVARCHAR(50),

    Risk_Level NVARCHAR(30),

    Status NVARCHAR(30),

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
  AND TABLE_NAME = 'PPE_Inspections_Stage'
ORDER BY ORDINAL_POSITION;
GO