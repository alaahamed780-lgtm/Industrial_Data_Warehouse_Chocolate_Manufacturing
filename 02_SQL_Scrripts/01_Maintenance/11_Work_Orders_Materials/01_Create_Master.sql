USE Chocolate_Manufacturing_DW;
GO

/*==============================================================
  Create Schema
==============================================================*/

IF NOT EXISTS
(
    SELECT *
    FROM sys.schemas
    WHERE name = 'master'
)
BEGIN
    EXEC ('CREATE SCHEMA master');
END
GO

/*==============================================================
  Drop Master Table
==============================================================*/

IF OBJECT_ID('master.Work_Order_Materials_Master','U') IS NOT NULL
DROP TABLE master.Work_Order_Materials_Master;
GO

/*==============================================================
  Create Master Table
==============================================================*/

CREATE TABLE master.Work_Order_Materials_Master
(

Material_Transaction_ID      NVARCHAR(50)    NOT NULL,
Work_Order_ID               NVARCHAR(50)    NOT NULL,
Operation_ID                NVARCHAR(50)    NOT NULL,

Equipment_ID                NVARCHAR(50)    NULL,
Component_ID                NVARCHAR(50)    NULL,

Spare_Part_ID               NVARCHAR(50)    NULL,
Part_Number                 NVARCHAR(100)   NULL,

Warehouse                   NVARCHAR(100)   NULL,
Bin_Location                NVARCHAR(100)   NULL,

Issue_Date                  DATETIME2       NULL,

Requested_Qty               DECIMAL(18,2)   NULL,
Issued_Qty                  DECIMAL(18,2)   NULL,
Returned_Qty                DECIMAL(18,2)   NULL,

Unit                        NVARCHAR(50)    NULL,

Unit_Cost_USD               DECIMAL(18,2)   NULL,
Extended_Cost_USD           DECIMAL(18,2)   NULL,

Currency                    NVARCHAR(20)    NULL,

Batch_Number                NVARCHAR(100)   NULL,
Serial_Number               NVARCHAR(100)   NULL,

Vendor_ID                   NVARCHAR(50)    NULL,

Reservation_No              NVARCHAR(100)   NULL,

Movement_Type               NVARCHAR(50)    NULL,

Stock_Before                DECIMAL(18,2)   NULL,
Stock_After                 DECIMAL(18,2)   NULL,

Critical_Spare              BIT             NULL,

ABC_Class                   NVARCHAR(10)    NULL,

Material_Status             NVARCHAR(50)    NULL,

Issued_By_Employee_ID       NVARCHAR(50)    NULL,
Approved_By_Employee_ID     NVARCHAR(50)    NULL,

Cost_Center                 NVARCHAR(50)    NULL,

Plant                       NVARCHAR(100)   NULL,

Area                        NVARCHAR(100)   NULL,

Notes                       NVARCHAR(MAX)   NULL,

CONSTRAINT PK_Work_Order_Materials_Master
PRIMARY KEY(Material_Transaction_ID)

);
GO

/*==============================================================
 Verify Master Table
==============================================================*/

SELECT
COLUMN_NAME,
DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='master'
AND TABLE_NAME='Work_Order_Materials_Master'
ORDER BY ORDINAL_POSITION;
GO