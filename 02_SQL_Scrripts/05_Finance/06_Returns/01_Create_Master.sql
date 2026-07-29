USE Chocolate_Manufacturing_DW;
GO

/*============================================================
04_Create_Returns_Master.sql
============================================================*/

IF OBJECT_ID('master.Returns_Master','U') IS NOT NULL
    DROP TABLE master.Returns_Master;
GO

CREATE TABLE master.Returns_Master
(
    Return_ID NVARCHAR(50) NOT NULL,

    Return_Number NVARCHAR(50),

    Sales_Order_ID NVARCHAR(50),

    Delivery_ID NVARCHAR(50),

    Customer_ID NVARCHAR(50),

    Calendar_Date_Key INT,

    Return_Date DATE,

    Return_DateTime DATETIME,

    Product_ID NVARCHAR(50),

    Batch_No NVARCHAR(50),

    Lot_No NVARCHAR(50),

    Returned_Qty DECIMAL(18,2),

    Accepted_Qty DECIMAL(18,2),

    Rejected_Qty DECIMAL(18,2),

    Return_Reason NVARCHAR(100),

    Return_Category NVARCHAR(50),

    Condition_On_Return NVARCHAR(100),

    Inspection_Result NVARCHAR(100),

    Disposition NVARCHAR(100),

    Credit_Note_Number NVARCHAR(50),

    Return_Cost_USD DECIMAL(18,2),

    Recovery_Value_USD DECIMAL(18,2),

    Quality_Inspection_ID NVARCHAR(50),

    NCR_ID NVARCHAR(50),

    Warehouse NVARCHAR(50),

    Processed_By NVARCHAR(50),

    Approved_By NVARCHAR(50),

    Status NVARCHAR(50),

    Plant NVARCHAR(50),

    Notes NVARCHAR(500),

    Load_Date DATETIME2
        CONSTRAINT DF_Returns_Master_LoadDate
        DEFAULT(GETDATE()),

    CONSTRAINT PK_Returns_Master
        PRIMARY KEY(Return_ID)
);
GO

/*============================================================
Verify Table
============================================================*/

SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'master'
  AND TABLE_NAME = 'Returns_Master'
ORDER BY ORDINAL_POSITION;
GO