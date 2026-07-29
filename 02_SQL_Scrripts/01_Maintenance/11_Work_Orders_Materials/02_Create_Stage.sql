USE Chocolate_Manufacturing_DW;
GO

/*==============================================================
  Create Schema
==============================================================*/

IF NOT EXISTS (
    SELECT *
    FROM sys.schemas
    WHERE name = 'staging'
)
BEGIN
    EXEC ('CREATE SCHEMA staging');
END
GO

/*==============================================================
  Drop Stage Table
==============================================================*/

IF OBJECT_ID('staging.Work_Order_Materials_Stage','U') IS NOT NULL
DROP TABLE staging.Work_Order_Materials_Stage;
GO

/*==============================================================
  Create Stage Table
==============================================================*/

CREATE TABLE staging.Work_Order_Materials_Stage
(

Material_Transaction_ID      NVARCHAR(255),
Work_Order_ID               NVARCHAR(255),
Operation_ID                NVARCHAR(255),

Equipment_ID                NVARCHAR(255),
Component_ID                NVARCHAR(255),

Spare_Part_ID               NVARCHAR(255),
Part_Number                 NVARCHAR(255),

Warehouse                  NVARCHAR(255),
Bin_Location               NVARCHAR(255),

Issue_Date                 NVARCHAR(255),

Requested_Qty              NVARCHAR(255),
Issued_Qty                 NVARCHAR(255),
Returned_Qty               NVARCHAR(255),

Unit                       NVARCHAR(255),

Unit_Cost_USD              NVARCHAR(255),
Extended_Cost_USD          NVARCHAR(255),

Currency                   NVARCHAR(255),

Batch_Number               NVARCHAR(255),
Serial_Number              NVARCHAR(255),

Vendor_ID                  NVARCHAR(255),

Reservation_No             NVARCHAR(255),

Movement_Type              NVARCHAR(255),

Stock_Before               NVARCHAR(255),
Stock_After                NVARCHAR(255),

Critical_Spare             NVARCHAR(255),

ABC_Class                  NVARCHAR(255),

Material_Status            NVARCHAR(255),

Issued_By_Employee_ID      NVARCHAR(255),
Approved_By_Employee_ID    NVARCHAR(255),

Cost_Center                NVARCHAR(255),

Plant                      NVARCHAR(255),

Area                       NVARCHAR(255),

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
AND TABLE_NAME='Work_Order_Materials_Stage'
ORDER BY ORDINAL_POSITION;
GO