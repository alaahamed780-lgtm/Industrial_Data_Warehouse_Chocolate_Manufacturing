USE Chocolate_Manufacturing_DW;
GO

/*==============================================================
Create Stage Table : Production_Orders
==============================================================*/

IF NOT EXISTS (
    SELECT *
    FROM sys.schemas
    WHERE name = 'staging'
)
BEGIN
    EXEC('CREATE SCHEMA staging');
END
GO

IF OBJECT_ID('staging.Production_Orders_Stage','U') IS NOT NULL
    DROP TABLE staging.Production_Orders_Stage;
GO

CREATE TABLE staging.Production_Orders_Stage
(
    Production_Order_ID     NVARCHAR(255),
    Production_Order_No     NVARCHAR(255),
    Product_ID              NVARCHAR(255),
    BOM_ID                  NVARCHAR(255),
    Recipe_ID               NVARCHAR(255),
    Plant                   NVARCHAR(255),
    Area                    NVARCHAR(255),
    Production_Line         NVARCHAR(255),
    Priority                NVARCHAR(255),
    Status                  NVARCHAR(255),

    Planned_Qty             NVARCHAR(255),
    Produced_Qty            NVARCHAR(255),
    Scrap_Qty               NVARCHAR(255),
    Yield_Percent           NVARCHAR(255),

    Planned_Start           NVARCHAR(255),
    Planned_End             NVARCHAR(255),
    Actual_Start            NVARCHAR(255),
    Actual_End              NVARCHAR(255),

    Shift                   NVARCHAR(255),
    Work_Center             NVARCHAR(255),
    Equipment_ID            NVARCHAR(255),
    Supervisor_ID           NVARCHAR(255),

    Batch_No                NVARCHAR(255),
    Lot_No                  NVARCHAR(255),

    Quality_Status          NVARCHAR(255),
    Warehouse               NVARCHAR(255),
    Customer_Type           NVARCHAR(255),
    Market                  NVARCHAR(255),

    Planned_Cost            NVARCHAR(255),
    Actual_Cost             NVARCHAR(255),

    Calendar_Key            NVARCHAR(255),

    Created_Date            NVARCHAR(255),
    Closed_Date             NVARCHAR(255),

    Notes                   NVARCHAR(MAX)
);
GO

/*==============================================================
Verify Stage Table
==============================================================*/

SELECT
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='staging'
AND TABLE_NAME='Production_Orders_Stage'
ORDER BY ORDINAL_POSITION;
GO