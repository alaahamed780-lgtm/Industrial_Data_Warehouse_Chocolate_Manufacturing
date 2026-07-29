USE Chocolate_Manufacturing_DW;
GO

IF OBJECT_ID('master.Laboratory_Test_Results_Master','U') IS NOT NULL
DROP TABLE master.Laboratory_Test_Results_Master;
GO

CREATE TABLE master.Laboratory_Test_Results_Master
(
    Lab_Test_Result_ID            NVARCHAR(30)     NOT NULL PRIMARY KEY,
    Lab_Report_No                 NVARCHAR(30)     NOT NULL,
    Quality_Inspection_ID         NVARCHAR(30)     NOT NULL,

    Calendar_Date_Key            INT              NOT NULL,
    Test_Date                    DATE             NOT NULL,
    Test_DateTime                DATETIME2        NOT NULL,

    Product_ID                   NVARCHAR(30)     NOT NULL,
    Batch_No                     NVARCHAR(30)     NULL,
    Lot_No                       NVARCHAR(30)     NULL,
    Sample_ID                    NVARCHAR(30)     NULL,

    Laboratory                   NVARCHAR(100)    NULL,
    Technician_ID                NVARCHAR(30)     NULL,

    Test_Category                NVARCHAR(50)     NULL,
    Test_Name                    NVARCHAR(100)    NULL,
    Test_Method                  NVARCHAR(100)    NULL,
    Unit                         NVARCHAR(20)     NULL,

    Target_Value                 DECIMAL(18,2)    NULL,
    Measured_Value               DECIMAL(18,2)    NULL,
    Lower_Limit                  DECIMAL(18,2)    NULL,
    Upper_Limit                  DECIMAL(18,2)    NULL,

    Result                       NVARCHAR(20)     NULL,
    Severity                     NVARCHAR(20)     NULL,
    Retest_Required              NVARCHAR(10)     NULL,

    Equipment_ID                 NVARCHAR(30)     NULL,
    Production_Order_ID          NVARCHAR(30)     NULL,
    Production_Transaction_ID    NVARCHAR(30)     NULL,

    Certificate_No               NVARCHAR(30)     NULL,
    Approval_Status              NVARCHAR(30)     NULL,

    Plant                        NVARCHAR(30)     NULL,
    Area                         NVARCHAR(100)    NULL,
    Notes                        NVARCHAR(255)    NULL,

    Load_Date                    DATETIME2 NOT NULL
        CONSTRAINT DF_LabResults_LoadDate DEFAULT(GETDATE())
);
GO

SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='master'
AND TABLE_NAME='Laboratory_Test_Results_Master'
ORDER BY ORDINAL_POSITION;
GO