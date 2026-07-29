USE Chocolate_Manufacturing_DW;
GO

/*=========================================================
04_Create_Production_Orders_Master.sql
=========================================================*/

IF OBJECT_ID('master.Production_Orders_Master','U') IS NOT NULL
DROP TABLE master.Production_Orders_Master;
GO

CREATE TABLE master.Production_Orders_Master
(
    Production_Order_ID     NVARCHAR(50) NOT NULL,
    Production_Order_No     NVARCHAR(50),

    Product_ID              NVARCHAR(50) NOT NULL,
    BOM_ID                  NVARCHAR(50),
    Recipe_ID               NVARCHAR(50),

    Plant                   NVARCHAR(100),
    Area                    NVARCHAR(100),
    Production_Line         NVARCHAR(100),

    Priority                NVARCHAR(30),
    Status                  NVARCHAR(30),

    Planned_Qty             DECIMAL(18,2),
    Produced_Qty            DECIMAL(18,2),
    Scrap_Qty               DECIMAL(18,2),

    Yield_Percent           DECIMAL(5,2),

    Planned_Start           DATETIME2,
    Planned_End             DATETIME2,

    Actual_Start            DATETIME2,
    Actual_End              DATETIME2,

    Shift                   NVARCHAR(30),
    Work_Center             NVARCHAR(100),

    Equipment_ID            NVARCHAR(50),
    Supervisor_ID           NVARCHAR(50),

    Batch_No                NVARCHAR(100),
    Lot_No                  NVARCHAR(100),

    Quality_Status          NVARCHAR(50),

    Warehouse               NVARCHAR(100),

    Customer_Type           NVARCHAR(100),

    Market                  NVARCHAR(100),

    Planned_Cost            DECIMAL(18,2),
    Actual_Cost             DECIMAL(18,2),

    Calendar_Key            INT,

    Created_Date            DATE,

    Closed_Date             DATE,

    Notes                   NVARCHAR(MAX),

    CONSTRAINT PK_Production_Orders_Master
    PRIMARY KEY (Production_Order_ID)
);
GO

/*=========================================================
Verify Table
=========================================================*/

SELECT
COLUMN_NAME,
DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='master'
AND TABLE_NAME='Production_Orders_Master'
ORDER BY ORDINAL_POSITION;
GO