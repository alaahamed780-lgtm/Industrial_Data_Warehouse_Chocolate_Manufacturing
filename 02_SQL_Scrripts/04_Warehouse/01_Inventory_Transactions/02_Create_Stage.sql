USE Chocolate_Manufacturing_DW;
GO

/*==============================================================
Create Stage Table : Inventory_Transactions_Stage
==============================================================*/

IF OBJECT_ID('staging.Inventory_Transactions_Stage','U') IS NOT NULL
    DROP TABLE staging.Inventory_Transactions_Stage;
GO

CREATE TABLE staging.Inventory_Transactions_Stage
(
    Inventory_Transaction_ID NVARCHAR(255),
    Transaction_No           NVARCHAR(255),
    Transaction_Type         NVARCHAR(255),
    Movement_Type            NVARCHAR(255),
    Calendar_Date_Key        NVARCHAR(255),
    Transaction_Date         NVARCHAR(255),
    Transaction_DateTime     NVARCHAR(255),
    Spare_Part_ID            NVARCHAR(255),
    Material_ID              NVARCHAR(255),
    Product_ID               NVARCHAR(255),
    Warehouse                NVARCHAR(255),
    Bin_Location             NVARCHAR(255),
    Batch_No                 NVARCHAR(255),
    Lot_No                   NVARCHAR(255),
    Reference_Document       NVARCHAR(255),
    Reference_Type           NVARCHAR(255),
    Work_Order_ID            NVARCHAR(255),
    Production_Order_ID      NVARCHAR(255),
    Vendor_ID                NVARCHAR(255),
    Quantity                 NVARCHAR(255),
    UOM                      NVARCHAR(255),
    Unit_Cost_USD            NVARCHAR(255),
    Extended_Cost_USD        NVARCHAR(255),
    Stock_Before             NVARCHAR(255),
    Stock_After              NVARCHAR(255),
    Employee_ID              NVARCHAR(255),
    Approval_Status          NVARCHAR(255),
    Reason_Code              NVARCHAR(255),
    Plant                    NVARCHAR(255),
    Area                     NVARCHAR(255),
    Status                   NVARCHAR(255),
    Notes                    NVARCHAR(255)
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
AND TABLE_NAME='Inventory_Transactions_Stage'
ORDER BY ORDINAL_POSITION;
GO