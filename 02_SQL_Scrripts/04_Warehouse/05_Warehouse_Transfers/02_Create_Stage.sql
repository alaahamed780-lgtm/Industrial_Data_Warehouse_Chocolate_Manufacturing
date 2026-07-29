USE Chocolate_Manufacturing_DW;
GO

/*============================================================
01_Create_Warehouse_Transfers_Stage.sql
============================================================*/

IF OBJECT_ID('staging.Warehouse_Transfers_Stage','U') IS NOT NULL
    DROP TABLE staging.Warehouse_Transfers_Stage;
GO

CREATE TABLE staging.Warehouse_Transfers_Stage
(
    Warehouse_Transfer_ID NVARCHAR(50),
    Transfer_Number NVARCHAR(50),

    Calendar_Date_Key NVARCHAR(20),

    Transfer_Date NVARCHAR(30),
    Transfer_DateTime NVARCHAR(50),

    Transfer_Type NVARCHAR(50),

    Material_ID NVARCHAR(30),
    Spare_Part_ID NVARCHAR(30),
    Product_ID NVARCHAR(30),

    From_Warehouse NVARCHAR(50),
    From_Bin NVARCHAR(50),

    To_Warehouse NVARCHAR(50),
    To_Bin NVARCHAR(50),

    Quantity NVARCHAR(30),
    UOM NVARCHAR(20),

    Unit_Cost_USD NVARCHAR(30),
    Extended_Cost_USD NVARCHAR(30),

    Stock_Before_From NVARCHAR(30),
    Stock_After_From NVARCHAR(30),

    Stock_Before_To NVARCHAR(30),
    Stock_After_To NVARCHAR(30),

    Batch_No NVARCHAR(50),
    Lot_No NVARCHAR(50),

    Requested_By NVARCHAR(30),
    Approved_By NVARCHAR(30),
    Executed_By NVARCHAR(30),

    Reason_Code NVARCHAR(100),

    Reference_Document NVARCHAR(100),
    Reference_Type NVARCHAR(50),

    Plant NVARCHAR(50),
    Area NVARCHAR(100),

    Status NVARCHAR(50),

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
AND TABLE_NAME='Warehouse_Transfers_Stage'
ORDER BY ORDINAL_POSITION;
GO