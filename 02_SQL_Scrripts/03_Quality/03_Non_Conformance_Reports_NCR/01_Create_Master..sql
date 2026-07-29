USE Chocolate_Manufacturing_DW;
GO

/*============================================================
01_Create_Non_Conformance_Reports_Stage.sql
============================================================*/

IF OBJECT_ID('staging.Non_Conformance_Reports_Stage','U') IS NOT NULL
DROP TABLE staging.Non_Conformance_Reports_Stage;
GO

CREATE TABLE staging.Non_Conformance_Reports_Stage
(
    NCR_ID                       NVARCHAR(255),
    NCR_Number                   NVARCHAR(255),
    Quality_Inspection_ID        NVARCHAR(255),
    Lab_Test_Result_ID           NVARCHAR(255),

    Calendar_Date_Key            NVARCHAR(255),

    Report_Date                  NVARCHAR(255),
    Report_DateTime              NVARCHAR(255),

    Product_ID                   NVARCHAR(255),

    Batch_No                     NVARCHAR(255),
    Lot_No                       NVARCHAR(255),

    Production_Order_ID          NVARCHAR(255),
    Production_Transaction_ID    NVARCHAR(255),

    Equipment_ID                 NVARCHAR(255),

    NCR_Category                 NVARCHAR(255),

    Defect_Type                  NVARCHAR(255),
    Defect_Code                  NVARCHAR(255),

    Severity                     NVARCHAR(255),

    Root_Cause                   NVARCHAR(255),

    Immediate_Action             NVARCHAR(255),

    Corrective_Action            NVARCHAR(255),

    Preventive_Action            NVARCHAR(255),

    Disposition                  NVARCHAR(255),

    Responsible_Employee_ID      NVARCHAR(255),

    Department                   NVARCHAR(255),

    Target_Close_Date            NVARCHAR(255),

    Actual_Close_Date            NVARCHAR(255),

    Status                       NVARCHAR(255),

    Verification_Result          NVARCHAR(255),

    Verified_By                  NVARCHAR(255),

    Estimated_Cost_USD           NVARCHAR(255),

    Plant                        NVARCHAR(255),

    Area                         NVARCHAR(255),

    Notes                        NVARCHAR(255)
);
GO

/*============================================================
Verify Table
============================================================*/

SELECT
COLUMN_NAME,
DATA_TYPE,
CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='staging'
AND TABLE_NAME='Non_Conformance_Reports_Stage'
ORDER BY ORDINAL_POSITION;
GO