USE Chocolate_Manufacturing_DW;
GO

/*============================================================
01_Create_Inventory_Balance_Stage.sql
============================================================*/

IF OBJECT_ID('staging.Inventory_Balance_Stage','U') IS NOT NULL
    DROP TABLE staging.Inventory_Balance_Stage;
GO

CREATE TABLE staging.Inventory_Balance_Stage
(
    Inventory_Balance_ID NVARCHAR(50),

    Snapshot_Date NVARCHAR(30),
    Calendar_Date_Key NVARCHAR(20),

    Warehouse NVARCHAR(50),
    Bin_Location NVARCHAR(50),

    Material_ID NVARCHAR(30),
    Spare_Part_ID NVARCHAR(30),
    Product_ID NVARCHAR(30),

    Batch_No NVARCHAR(50),
    Lot_No NVARCHAR(50),

    Quantity_On_Hand NVARCHAR(30),
    Reserved_Qty NVARCHAR(30),
    Available_Qty NVARCHAR(30),

    Reorder_Point NVARCHAR(30),
    Maximum_Stock NVARCHAR(30),
    Safety_Stock NVARCHAR(30),

    UOM NVARCHAR(20),

    Average_Cost_USD NVARCHAR(30),
    Inventory_Value_USD NVARCHAR(30),

    ABC_Class NVARCHAR(20),
    Critical_Item NVARCHAR(20),

    Last_Receipt_Date NVARCHAR(30),
    Last_Issue_Date NVARCHAR(30),
    Last_Count_Date NVARCHAR(30),

    Inventory_Status NVARCHAR(30),

    Plant NVARCHAR(50),
    Area NVARCHAR(100),

    Cycle_Count_Frequency NVARCHAR(30),

    Responsible_Employee_ID NVARCHAR(30),

    Notes NVARCHAR(500)
);
GO

/*============================================================
Verify Table
============================================================*/

SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='staging'
AND TABLE_NAME='Inventory_Balance_Stage'
ORDER BY ORDINAL_POSITION;
GO