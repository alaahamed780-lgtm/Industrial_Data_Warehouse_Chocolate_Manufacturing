USE Chocolate_Manufacturing_DW;
GO

/*============================================================
04_Create_Inventory_Balance_Master.sql
============================================================*/

IF OBJECT_ID('master.Inventory_Balance_Master','U') IS NOT NULL
    DROP TABLE master.Inventory_Balance_Master;
GO

CREATE TABLE master.Inventory_Balance_Master
(
    Inventory_Balance_ID         NVARCHAR(30) NOT NULL,

    Snapshot_Date                DATE,
    Calendar_Date_Key            INT,

    Warehouse                    NVARCHAR(50),
    Bin_Location                 NVARCHAR(50),

    Material_ID                  NVARCHAR(30),
    Spare_Part_ID                NVARCHAR(30),
    Product_ID                   NVARCHAR(30),

    Batch_No                     NVARCHAR(50),
    Lot_No                       NVARCHAR(50),

    Quantity_On_Hand             DECIMAL(18,2),
    Reserved_Qty                 DECIMAL(18,2),
    Available_Qty                DECIMAL(18,2),

    Reorder_Point                DECIMAL(18,2),
    Maximum_Stock                DECIMAL(18,2),
    Safety_Stock                 DECIMAL(18,2),

    UOM                          NVARCHAR(20),

    Average_Cost_USD             DECIMAL(18,2),
    Inventory_Value_USD          DECIMAL(18,2),

    ABC_Class                    NVARCHAR(20),
    Critical_Item                NVARCHAR(20),

    Last_Receipt_Date            DATE,
    Last_Issue_Date              DATE,
    Last_Count_Date              DATE,

    Inventory_Status             NVARCHAR(30),

    Plant                        NVARCHAR(50),
    Area                         NVARCHAR(100),

    Cycle_Count_Frequency        NVARCHAR(30),

    Responsible_Employee_ID      NVARCHAR(30),

    Notes                        NVARCHAR(500),

    Load_Date DATETIME2
        CONSTRAINT DF_Inventory_Balance_LoadDate
        DEFAULT(GETDATE()),

    CONSTRAINT PK_Inventory_Balance_Master
        PRIMARY KEY (Inventory_Balance_ID)
);
GO

/*============================================================
Verify Table
============================================================*/

SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='master'
AND TABLE_NAME='Inventory_Balance_Master'
ORDER BY ORDINAL_POSITION;
GO