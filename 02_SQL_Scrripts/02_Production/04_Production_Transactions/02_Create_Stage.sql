USE Chocolate_Manufacturing_DW;
GO

/*==============================================================
Create Stage Table : Production_Transactions_Stage
==============================================================*/

IF OBJECT_ID('staging.Production_Transactions_Stage','U') IS NOT NULL
    DROP TABLE staging.Production_Transactions_Stage;
GO

CREATE TABLE staging.Production_Transactions_Stage
(
    Production_Transaction_ID NVARCHAR(255),
    Production_Order_ID       NVARCHAR(255),
    Calendar_Date_Key         NVARCHAR(255),
    Transaction_Date          NVARCHAR(255),
    Start_DateTime            NVARCHAR(255),
    End_DateTime              NVARCHAR(255),
    Shift                     NVARCHAR(255),
    Product_ID                NVARCHAR(255),
    Batch_No                  NVARCHAR(255),
    Recipe_ID                 NVARCHAR(255),
    BOM_ID                    NVARCHAR(255),
    Equipment_ID              NVARCHAR(255),
    Operator_ID               NVARCHAR(255),
    Input_Raw_Material_kg     NVARCHAR(255),
    Output_Finished_Goods_kg  NVARCHAR(255),
    Scrap_kg                  NVARCHAR(255),
    Yield_Percent             NVARCHAR(255),
    Runtime_Min               NVARCHAR(255),
    Downtime_Event_ID         NVARCHAR(255),
    Quality_Status            NVARCHAR(255),
    Energy_kWh                NVARCHAR(255),
    Cost_USD                  NVARCHAR(255),
    Area                      NVARCHAR(255),
    Production_Line           NVARCHAR(255),
    Status                    NVARCHAR(255)
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
AND TABLE_NAME='Production_Transactions_Stage'
ORDER BY ORDINAL_POSITION;
GO