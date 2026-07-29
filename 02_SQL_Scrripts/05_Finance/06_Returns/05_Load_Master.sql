USE Chocolate_Manufacturing_DW;
GO

/*============================================================
05_Load_Returns_Master.sql
============================================================*/

TRUNCATE TABLE master.Returns_Master;
GO

INSERT INTO master.Returns_Master
(
    Return_ID,
    Return_Number,
    Sales_Order_ID,
    Delivery_ID,
    Customer_ID,
    Calendar_Date_Key,
    Return_Date,
    Return_DateTime,
    Product_ID,
    Batch_No,
    Lot_No,
    Returned_Qty,
    Accepted_Qty,
    Rejected_Qty,
    Return_Reason,
    Return_Category,
    Condition_On_Return,
    Inspection_Result,
    Disposition,
    Credit_Note_Number,
    Return_Cost_USD,
    Recovery_Value_USD,
    Quality_Inspection_ID,
    NCR_ID,
    Warehouse,
    Processed_By,
    Approved_By,
    Status,
    Plant,
    Notes
)

SELECT

NULLIF(LTRIM(RTRIM(Return_ID)), ''),

NULLIF(LTRIM(RTRIM(Return_Number)), ''),

NULLIF(LTRIM(RTRIM(Sales_Order_ID)), ''),

NULLIF(LTRIM(RTRIM(Delivery_ID)), ''),

NULLIF(LTRIM(RTRIM(Customer_ID)), ''),

TRY_CONVERT(INT, Calendar_Date_Key),

TRY_CONVERT(DATE, Return_Date),

TRY_CONVERT(DATETIME, Return_DateTime),

NULLIF(LTRIM(RTRIM(Product_ID)), ''),

NULLIF(LTRIM(RTRIM(Batch_No)), ''),

NULLIF(LTRIM(RTRIM(Lot_No)), ''),

TRY_CONVERT(DECIMAL(18,2), Returned_Qty),

TRY_CONVERT(DECIMAL(18,2), Accepted_Qty),

TRY_CONVERT(DECIMAL(18,2), Rejected_Qty),

NULLIF(LTRIM(RTRIM(Return_Reason)), ''),

NULLIF(LTRIM(RTRIM(Return_Category)), ''),

NULLIF(LTRIM(RTRIM(Condition_On_Return)), ''),

NULLIF(LTRIM(RTRIM(Inspection_Result)), ''),

NULLIF(LTRIM(RTRIM(Disposition)), ''),

NULLIF(LTRIM(RTRIM(Credit_Note_Number)), ''),

TRY_CONVERT(DECIMAL(18,2), Return_Cost_USD),

TRY_CONVERT(DECIMAL(18,2), Recovery_Value_USD),

NULLIF(LTRIM(RTRIM(Quality_Inspection_ID)), ''),

NULLIF(LTRIM(RTRIM(NCR_ID)), ''),

NULLIF(LTRIM(RTRIM(Warehouse)), ''),

NULLIF(LTRIM(RTRIM(Processed_By)), ''),

NULLIF(LTRIM(RTRIM(Approved_By)), ''),

NULLIF(LTRIM(RTRIM(Status)), ''),

NULLIF(LTRIM(RTRIM(Plant)), ''),

NULLIF(LTRIM(RTRIM(Notes)), '')

FROM staging.Returns_Stage;
GO

/*============================================================
Verify Load
============================================================*/

SELECT COUNT(*) AS Master_Count
FROM master.Returns_Master;
GO

SELECT TOP (20) *
FROM master.Returns_Master
ORDER BY Return_ID;
GO