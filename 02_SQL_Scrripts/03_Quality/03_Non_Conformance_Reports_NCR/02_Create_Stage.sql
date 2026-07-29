USE Chocolate_Manufacturing_DW;
GO

/*============================================================
04_Create_Non_Conformance_Reports_Master.sql
============================================================*/

IF OBJECT_ID('master.Non_Conformance_Reports_Master','U') IS NOT NULL
    DROP TABLE master.Non_Conformance_Reports_Master;
GO

CREATE TABLE master.Non_Conformance_Reports_Master
(
    NCR_ID                        NVARCHAR(30) NOT NULL,
    NCR_Number                    NVARCHAR(30),

    Quality_Inspection_ID         NVARCHAR(30),
    Lab_Test_Result_ID            NVARCHAR(30),

    Calendar_Date_Key             INT,

    Report_Date                   DATE,
    Report_DateTime               DATETIME2,

    Product_ID                    NVARCHAR(30),

    Batch_No                      NVARCHAR(30),
    Lot_No                        NVARCHAR(30),

    Production_Order_ID           NVARCHAR(30),
    Production_Transaction_ID     NVARCHAR(30),

    Equipment_ID                  NVARCHAR(30),

    NCR_Category                  NVARCHAR(100),

    Defect_Type                   NVARCHAR(100),
    Defect_Code                   NVARCHAR(50),

    Severity                      NVARCHAR(30),

    Root_Cause                    NVARCHAR(500),

    Immediate_Action              NVARCHAR(500),

    Corrective_Action             NVARCHAR(500),

    Preventive_Action             NVARCHAR(500),

    Disposition                   NVARCHAR(100),

    Responsible_Employee_ID       NVARCHAR(30),

    Department                    NVARCHAR(100),

    Target_Close_Date             DATE,

    Actual_Close_Date             DATE,

    Status                        NVARCHAR(50),

    Verification_Result           NVARCHAR(100),

    Verified_By                   NVARCHAR(30),

    Estimated_Cost_USD            DECIMAL(18,2),

    Plant                         NVARCHAR(50),

    Area                          NVARCHAR(100),

    Notes                         NVARCHAR(500),

    Load_Date                     DATETIME2
        CONSTRAINT DF_NCR_LoadDate DEFAULT(GETDATE()),

    CONSTRAINT PK_NCR_Master
        PRIMARY KEY (NCR_ID)
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
AND TABLE_NAME='Non_Conformance_Reports_Master'
ORDER BY ORDINAL_POSITION;
GO