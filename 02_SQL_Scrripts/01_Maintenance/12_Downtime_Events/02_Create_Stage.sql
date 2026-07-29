USE Chocolate_Manufacturing_DW;
GO

/*==============================================================
  Create Schema
==============================================================*/

IF NOT EXISTS
(
    SELECT *
    FROM sys.schemas
    WHERE name = 'staging'
)
BEGIN
    EXEC('CREATE SCHEMA staging');
END
GO

/*==============================================================
  Drop Stage Table
==============================================================*/

IF OBJECT_ID('staging.Downtime_Events_Stage','U') IS NOT NULL
DROP TABLE staging.Downtime_Events_Stage;
GO

/*==============================================================
  Create Stage Table
==============================================================*/

CREATE TABLE staging.Downtime_Events_Stage
(

Downtime_Event_ID          NVARCHAR(255),

Event_Date                 NVARCHAR(255),

Start_DateTime             NVARCHAR(255),

End_DateTime               NVARCHAR(255),

Duration_Minutes           NVARCHAR(255),

Shift                      NVARCHAR(255),

Plant                      NVARCHAR(255),

Area                       NVARCHAR(255),

Production_Line            NVARCHAR(255),

Equipment_ID               NVARCHAR(255),

Component_ID               NVARCHAR(255),

Functional_Location_ID     NVARCHAR(255),

Work_Order_ID              NVARCHAR(255),

Failure_Code_ID            NVARCHAR(255),

Downtime_Type              NVARCHAR(255),

Failure_Mode               NVARCHAR(255),

Root_Cause                 NVARCHAR(255),

Priority                   NVARCHAR(255),

Planned_Unplanned          NVARCHAR(255),

Production_Order           NVARCHAR(255),

Product_Code               NVARCHAR(255),

Lost_Production_kg         NVARCHAR(255),

OEE_Loss_Percent           NVARCHAR(255),

MTTR_Hours                 NVARCHAR(255),

MTBF_Hours                 NVARCHAR(255),

Operator_ID                NVARCHAR(255),

Maintenance_Team           NVARCHAR(255),

Vendor_ID                  NVARCHAR(255),

Weather                    NVARCHAR(255),

Status                     NVARCHAR(255),

Created_Date               NVARCHAR(255),

Closed_Date                NVARCHAR(255),

Cost_Impact_USD            NVARCHAR(255),

Safety_Incident            NVARCHAR(255),

Quality_Impact             NVARCHAR(255),

Notes                      NVARCHAR(MAX)

);
GO

/*==============================================================
  Verify Stage Table
==============================================================*/

SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='staging'
AND TABLE_NAME='Downtime_Events_Stage'
ORDER BY ORDINAL_POSITION;
GO