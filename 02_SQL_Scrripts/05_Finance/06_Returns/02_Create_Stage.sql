USE Chocolate_Manufacturing_DW;
GO

/*============================================================
01_Create_Returns_Stage.sql
============================================================*/

IF OBJECT_ID('staging.Returns_Stage','U') IS NOT NULL
    DROP TABLE staging.Returns_Stage;
GO

CREATE TABLE staging.Returns_Stage
(
    Return_ID NVARCHAR(50),

    Return_Number NVARCHAR(50),

    Sales_Order_ID NVARCHAR(50),

    Delivery_ID NVARCHAR(50),

    Customer_ID NVARCHAR(50),

    Calendar_Date_Key NVARCHAR(20),

    Return_Date NVARCHAR(30),

    Return_DateTime NVARCHAR(30),

    Product_ID NVARCHAR(50),

    Batch_No NVARCHAR(50),

    Lot_No NVARCHAR(50),

    Returned_Qty NVARCHAR(30),

    Accepted_Qty NVARCHAR(30),

    Rejected_Qty NVARCHAR(30),

    Return_Reason NVARCHAR(100),

    Return_Category NVARCHAR(50),

    Condition_On_Return NVARCHAR(100),

    Inspection_Result NVARCHAR(100),

    Disposition NVARCHAR(100),

    Credit_Note_Number NVARCHAR(50),

    Return_Cost_USD NVARCHAR(30),

    Recovery_Value_USD NVARCHAR(30),

    Quality_Inspection_ID NVARCHAR(50),

    NCR_ID NVARCHAR(50),

    Warehouse NVARCHAR(50),

    Processed_By NVARCHAR(50),

    Approved_By NVARCHAR(50),

    Status NVARCHAR(50),

    Plant NVARCHAR(50),

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
WHERE TABLE_SCHEMA = 'staging'
  AND TABLE_NAME = 'Returns_Stage'
ORDER BY ORDINAL_POSITION;
GO