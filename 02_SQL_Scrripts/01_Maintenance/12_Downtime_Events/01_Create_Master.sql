USE Chocolate_Manufacturing_DW;
GO

/*===========================================================
Create Master Schema
===========================================================*/

IF NOT EXISTS (
    SELECT *
    FROM sys.schemas
    WHERE name = 'master'
)
BEGIN
    EXEC('CREATE SCHEMA master');
END
GO

/*===========================================================
Drop Master Table
===========================================================*/

IF OBJECT_ID('master.Downtime_Events_Master','U') IS NOT NULL
    DROP TABLE master.Downtime_Events_Master;
GO

/*===========================================================
Create Master Table
===========================================================*/

CREATE TABLE master.Downtime_Events_Master
(
    Downtime_Event_ID      NVARCHAR(50)    NOT NULL PRIMARY KEY,

    Event_Date             DATE,
    Start_DateTime         DATETIME2,
    End_DateTime           DATETIME2,

    Duration_Minutes       DECIMAL(10,2),

    Shift                  NVARCHAR(50),
    Plant                  NVARCHAR(100),
    Area                   NVARCHAR(100),
    Production_Line        NVARCHAR(100),

    Equipment_ID           NVARCHAR(50),
    Component_ID           NVARCHAR(50),
    Functional_Location_ID NVARCHAR(50),

    Work_Order_ID          NVARCHAR(50),
    Failure_Code_ID        NVARCHAR(50),

    Downtime_Type          NVARCHAR(100),
    Failure_Mode           NVARCHAR(255),
    Root_Cause             NVARCHAR(255),

    Priority               NVARCHAR(50),
    Planned_Unplanned      NVARCHAR(50),

    Production_Order       NVARCHAR(50),
    Product_Code           NVARCHAR(50),

    Lost_Production_kg     DECIMAL(18,2),

    OEE_Loss_Percent       DECIMAL(10,2),

    MTTR_Hours             DECIMAL(10,2),
    MTBF_Hours             DECIMAL(10,2),

    Operator_ID            NVARCHAR(50),
    Maintenance_Team       NVARCHAR(100),
    Vendor_ID              NVARCHAR(50),

    Weather                NVARCHAR(100),

    Status                 NVARCHAR(100),

    Created_Date           DATE,
    Closed_Date            DATE,

    Cost_Impact_USD        DECIMAL(18,2),

    Safety_Incident        NVARCHAR(20),

    Quality_Impact         NVARCHAR(255),

    Notes                  NVARCHAR(MAX)
);
GO

/*===========================================================
Verify Master Table
===========================================================*/

SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='master'
AND TABLE_NAME='Downtime_Events_Master'
ORDER BY ORDINAL_POSITION;
GO
USE Chocolate_Manufacturing_DW;
GO

/*==============================================================
Verify Master Table Structure
==============================================================*/

SELECT
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'master'
AND TABLE_NAME = 'Downtime_Events_Master'
ORDER BY ORDINAL_POSITION;
GO

/*==============================================================
Verify Row Count
==============================================================*/

SELECT
    COUNT(*) AS TotalRows
FROM master.Downtime_Events_Master;
GO

/*==============================================================
Verify Primary Key
==============================================================*/

SELECT
    COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'master'
AND TABLE_NAME = 'Downtime_Events_Master';
GO

/*==============================================================
Table Created Successfully
==============================================================*/

PRINT 'Downtime_Events_Master Created Successfully';
GO