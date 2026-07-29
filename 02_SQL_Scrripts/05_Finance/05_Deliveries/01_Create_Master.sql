USE Chocolate_Manufacturing_DW;
GO

/*============================================================
04_Create_Deliveries_Master.sql
============================================================*/

IF OBJECT_ID('master.Deliveries_Master','U') IS NOT NULL
    DROP TABLE master.Deliveries_Master;
GO

CREATE TABLE master.Deliveries_Master
(
    Delivery_ID NVARCHAR(50) NOT NULL,

    Delivery_Number NVARCHAR(50),

    Shipment_ID NVARCHAR(50),

    Sales_Order_ID NVARCHAR(50),

    Customer_ID NVARCHAR(50),

    Calendar_Date_Key INT,

    Delivery_Date DATE,

    Delivery_DateTime DATETIME,

    Warehouse NVARCHAR(50),

    Vehicle_ID NVARCHAR(50),

    Driver_ID NVARCHAR(50),

    Receiver_Name NVARCHAR(100),

    Proof_of_Delivery_No NVARCHAR(100),

    Delivery_Status NVARCHAR(50),

    On_Time_Delivery NVARCHAR(20),

    Delivery_Time_Min INT,

    Delivered_Qty DECIMAL(18,2),

    Rejected_Qty DECIMAL(18,2),

    Return_Qty DECIMAL(18,2),

    Delivery_Condition NVARCHAR(50),

    Customer_Signature NVARCHAR(20),

    GPS_Latitude DECIMAL(10,6),

    GPS_Longitude DECIMAL(10,6),

    Freight_Cost_USD DECIMAL(18,2),

    Delivery_Cost_USD DECIMAL(18,2),

    Created_By NVARCHAR(50),

    Approved_By NVARCHAR(50),

    Plant NVARCHAR(50),

    Notes NVARCHAR(500),

    Load_Date DATETIME2
        CONSTRAINT DF_Deliveries_Master_LoadDate
        DEFAULT(GETDATE()),

    CONSTRAINT PK_Deliveries_Master
        PRIMARY KEY (Delivery_ID)
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
  AND TABLE_NAME = 'Deliveries_Master'
ORDER BY ORDINAL_POSITION;
GO