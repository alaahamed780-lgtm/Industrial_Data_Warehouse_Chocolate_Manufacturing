USE Chocolate_Manufacturing_DW;
GO

/*============================================================
01_Create_Deliveries_Stage.sql
============================================================*/

IF OBJECT_ID('staging.Deliveries_Stage','U') IS NOT NULL
    DROP TABLE staging.Deliveries_Stage;
GO

CREATE TABLE staging.Deliveries_Stage
(
    Delivery_ID NVARCHAR(50),

    Delivery_Number NVARCHAR(50),

    Shipment_ID NVARCHAR(50),

    Sales_Order_ID NVARCHAR(50),

    Customer_ID NVARCHAR(50),

    Calendar_Date_Key NVARCHAR(20),

    Delivery_Date NVARCHAR(30),

    Delivery_DateTime NVARCHAR(30),

    Warehouse NVARCHAR(50),

    Vehicle_ID NVARCHAR(50),

    Driver_ID NVARCHAR(50),

    Receiver_Name NVARCHAR(100),

    Proof_of_Delivery_No NVARCHAR(100),

    Delivery_Status NVARCHAR(50),

    On_Time_Delivery NVARCHAR(20),

    Delivery_Time_Min NVARCHAR(20),

    Delivered_Qty NVARCHAR(30),

    Rejected_Qty NVARCHAR(30),

    Return_Qty NVARCHAR(30),

    Delivery_Condition NVARCHAR(50),

    Customer_Signature NVARCHAR(20),

    GPS_Latitude NVARCHAR(30),

    GPS_Longitude NVARCHAR(30),

    Freight_Cost_USD NVARCHAR(30),

    Delivery_Cost_USD NVARCHAR(30),

    Created_By NVARCHAR(50),

    Approved_By NVARCHAR(50),

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
  AND TABLE_NAME = 'Deliveries_Stage'
ORDER BY ORDINAL_POSITION;
GO