USE Chocolate_Manufacturing_DW;
GO

/*============================================================
01_Create_Customer_Complaints_Stage.sql
============================================================*/

IF OBJECT_ID('staging.Customer_Complaints_Stage','U') IS NOT NULL
    DROP TABLE staging.Customer_Complaints_Stage;
GO

CREATE TABLE staging.Customer_Complaints_Stage
(
    Complaint_ID NVARCHAR(50),

    Complaint_Number NVARCHAR(50),

    Customer_ID NVARCHAR(50),

    Sales_Order_ID NVARCHAR(50),

    Delivery_ID NVARCHAR(50),

    Product_ID NVARCHAR(50),

    Batch_No NVARCHAR(50),

    Calendar_Date_Key NVARCHAR(20),

    Complaint_Date NVARCHAR(30),

    Complaint_DateTime NVARCHAR(30),

    Complaint_Channel NVARCHAR(50),

    Complaint_Category NVARCHAR(50),

    Complaint_Type NVARCHAR(50),

    Severity NVARCHAR(30),

    Description NVARCHAR(1000),

    Root_Cause NVARCHAR(500),

    Quality_Inspection_ID NVARCHAR(50),

    NCR_ID NVARCHAR(50),

    CAPA_ID NVARCHAR(50),

    Assigned_To NVARCHAR(50),

    Response_Date NVARCHAR(30),

    Target_Close_Date NVARCHAR(30),

    Actual_Close_Date NVARCHAR(30),

    Resolution NVARCHAR(1000),

    Compensation_USD NVARCHAR(30),

    Customer_Satisfaction_After_Closure NVARCHAR(30),

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
  AND TABLE_NAME = 'Customer_Complaints_Stage'
ORDER BY ORDINAL_POSITION;
GO