USE Chocolate_Manufacturing_DW;
GO

IF NOT EXISTS (
    SELECT *
    FROM sys.schemas
    WHERE name = 'staging'
)
BEGIN
    EXEC('CREATE SCHEMA staging');
END
GO

IF OBJECT_ID('staging.Laboratory_Test_Results_Stage','U') IS NOT NULL
DROP TABLE staging.Laboratory_Test_Results_Stage;
GO

CREATE TABLE staging.Laboratory_Test_Results_Stage
(
    Lab_Test_Result_ID             NVARCHAR(255),
    Lab_Report_No                  NVARCHAR(255),
    Quality_Inspection_ID          NVARCHAR(255),
    Calendar_Date_Key              NVARCHAR(255),
    Test_Date                      NVARCHAR(255),
    Test_DateTime                  NVARCHAR(255),
    Product_ID                     NVARCHAR(255),
    Batch_No                       NVARCHAR(255),
    Lot_No                         NVARCHAR(255),
    Sample_ID                      NVARCHAR(255),
    Laboratory                     NVARCHAR(255),
    Technician_ID                  NVARCHAR(255),
    Test_Category                  NVARCHAR(255),
    Test_Name                      NVARCHAR(255),
    Test_Method                    NVARCHAR(255),
    Unit                           NVARCHAR(255),
    Target_Value                   NVARCHAR(255),
    Measured_Value                 NVARCHAR(255),
    Lower_Limit                    NVARCHAR(255),
    Upper_Limit                    NVARCHAR(255),
    Result                         NVARCHAR(255),
    Severity                       NVARCHAR(255),
    Retest_Required                NVARCHAR(255),
    Equipment_ID                   NVARCHAR(255),
    Production_Order_ID            NVARCHAR(255),
    Production_Transaction_ID      NVARCHAR(255),
    Certificate_No                 NVARCHAR(255),
    Approval_Status                NVARCHAR(255),
    Plant                          NVARCHAR(255),
    Area                           NVARCHAR(255),
    Notes                          NVARCHAR(255)
);
GO

SELECT
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='staging'
AND TABLE_NAME='Laboratory_Test_Results_Stage'
ORDER BY ORDINAL_POSITION;
GO