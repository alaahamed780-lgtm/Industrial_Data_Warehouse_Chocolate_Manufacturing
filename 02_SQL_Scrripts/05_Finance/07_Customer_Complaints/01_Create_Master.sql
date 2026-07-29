USE Chocolate_Manufacturing_DW;
GO

/*============================================================
04_Create_Customer_Complaints_Master.sql
============================================================*/

IF OBJECT_ID('master.Customer_Complaints_Master','U') IS NOT NULL
    DROP TABLE master.Customer_Complaints_Master;
GO

CREATE TABLE master.Customer_Complaints_Master
(
    Complaint_ID NVARCHAR(50) NOT NULL,

    Complaint_Number NVARCHAR(50),

    Customer_ID NVARCHAR(50),

    Sales_Order_ID NVARCHAR(50),

    Delivery_ID NVARCHAR(50),

    Product_ID NVARCHAR(50),

    Batch_No NVARCHAR(50),

    Calendar_Date_Key INT,

    Complaint_Date DATE,

    Complaint_DateTime DATETIME,

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

    Response_Date DATE,

    Target_Close_Date DATE,

    Actual_Close_Date DATE,

    Resolution NVARCHAR(1000),

    Compensation_USD DECIMAL(18,2),

    Customer_Satisfaction_After_Closure DECIMAL(5,2),

    Status NVARCHAR(50),

    Plant NVARCHAR(50),

    Notes NVARCHAR(500),

    Load_Date DATETIME2
        CONSTRAINT DF_Customer_Complaints_Master_LoadDate
        DEFAULT(GETDATE()),

    CONSTRAINT PK_Customer_Complaints_Master
        PRIMARY KEY (Complaint_ID)
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
  AND TABLE_NAME = 'Customer_Complaints_Master'
ORDER BY ORDINAL_POSITION;
GO