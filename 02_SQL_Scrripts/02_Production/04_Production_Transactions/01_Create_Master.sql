USE Chocolate_Manufacturing_DW;
GO

/*=========================================================
04_Create_Production_Transactions_Master.sql
=========================================================*/

IF OBJECT_ID('master.Production_Transactions_Master','U') IS NOT NULL
    DROP TABLE master.Production_Transactions_Master;
GO

CREATE TABLE master.Production_Transactions_Master
(
    Production_Transaction_ID    NVARCHAR(50) NOT NULL,
    Production_Order_ID          NVARCHAR(50) NOT NULL,

    Calendar_Date_Key            INT,

    Transaction_Date             DATE,

    Start_DateTime               DATETIME2,
    End_DateTime                 DATETIME2,

    Shift                        NVARCHAR(20),

    Product_ID                   NVARCHAR(50),

    Batch_No                     NVARCHAR(50),

    Recipe_ID                    NVARCHAR(50),

    BOM_ID                       NVARCHAR(50),

    Equipment_ID                 NVARCHAR(50),

    Operator_ID                  NVARCHAR(50),

    Input_Raw_Material_kg        DECIMAL(18,2),

    Output_Finished_Goods_kg     DECIMAL(18,2),

    Scrap_kg                     DECIMAL(18,2),

    Yield_Percent                DECIMAL(5,2),

    Runtime_Min                  INT,

    Downtime_Event_ID            NVARCHAR(50),

    Quality_Status               NVARCHAR(30),

    Energy_kWh                   DECIMAL(18,2),

    Cost_USD                     DECIMAL(18,2),

    Area                         NVARCHAR(100),

    Production_Line              NVARCHAR(100),

    Status                       NVARCHAR(30),

    CONSTRAINT PK_Production_Transactions_Master
        PRIMARY KEY (Production_Transaction_ID)
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
AND TABLE_NAME='Production_Transactions_Master'
ORDER BY ORDINAL_POSITION;
GO