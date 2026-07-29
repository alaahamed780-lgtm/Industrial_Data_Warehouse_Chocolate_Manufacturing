USE Chocolate_Manufacturing_DW;
GO

/*============================================================
05_Load_Customer_Complaints_Master.sql
============================================================*/

TRUNCATE TABLE master.Customer_Complaints_Master;
GO

INSERT INTO master.Customer_Complaints_Master
(
    Complaint_ID,
    Complaint_Number,
    Customer_ID,
    Sales_Order_ID,
    Delivery_ID,
    Product_ID,
    Batch_No,
    Calendar_Date_Key,
    Complaint_Date,
    Complaint_DateTime,
    Complaint_Channel,
    Complaint_Category,
    Complaint_Type,
    Severity,
    Description,
    Root_Cause,
    Quality_Inspection_ID,
    NCR_ID,
    CAPA_ID,
    Assigned_To,
    Response_Date,
    Target_Close_Date,
    Actual_Close_Date,
    Resolution,
    Compensation_USD,
    Customer_Satisfaction_After_Closure,
    Status,
    Plant,
    Notes
)

SELECT

NULLIF(LTRIM(RTRIM(Complaint_ID)), ''),

NULLIF(LTRIM(RTRIM(Complaint_Number)), ''),

NULLIF(LTRIM(RTRIM(Customer_ID)), ''),

NULLIF(LTRIM(RTRIM(Sales_Order_ID)), ''),

NULLIF(LTRIM(RTRIM(Delivery_ID)), ''),

NULLIF(LTRIM(RTRIM(Product_ID)), ''),

NULLIF(LTRIM(RTRIM(Batch_No)), ''),

TRY_CONVERT(INT, Calendar_Date_Key),

TRY_CONVERT(DATE, Complaint_Date),

TRY_CONVERT(DATETIME, Complaint_DateTime),

NULLIF(LTRIM(RTRIM(Complaint_Channel)), ''),

NULLIF(LTRIM(RTRIM(Complaint_Category)), ''),

NULLIF(LTRIM(RTRIM(Complaint_Type)), ''),

NULLIF(LTRIM(RTRIM(Severity)), ''),

NULLIF(LTRIM(RTRIM([Description])), ''),

NULLIF(LTRIM(RTRIM(Root_Cause)), ''),

NULLIF(LTRIM(RTRIM(Quality_Inspection_ID)), ''),

NULLIF(LTRIM(RTRIM(NCR_ID)), ''),

NULLIF(LTRIM(RTRIM(CAPA_ID)), ''),

NULLIF(LTRIM(RTRIM(Assigned_To)), ''),

TRY_CONVERT(DATE, Response_Date),

TRY_CONVERT(DATE, Target_Close_Date),

TRY_CONVERT(DATE, Actual_Close_Date),

NULLIF(LTRIM(RTRIM(Resolution)), ''),

TRY_CONVERT(DECIMAL(18,2), Compensation_USD),

TRY_CONVERT(DECIMAL(5,2), Customer_Satisfaction_After_Closure),

NULLIF(LTRIM(RTRIM(Status)), ''),

NULLIF(LTRIM(RTRIM(Plant)), ''),

NULLIF(LTRIM(RTRIM(Notes)), '')

FROM staging.Customer_Complaints_Stage;
GO

/*============================================================
Verify Load
============================================================*/

SELECT COUNT(*) AS Master_Count
FROM master.Customer_Complaints_Master;
GO

SELECT TOP (20) *
FROM master.Customer_Complaints_Master
ORDER BY Complaint_ID;
GO