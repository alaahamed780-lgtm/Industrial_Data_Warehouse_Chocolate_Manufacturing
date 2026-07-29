USE Chocolate_Manufacturing_DW;
GO

/*============================================================
05_Load_Deliveries_Master.sql
============================================================*/

TRUNCATE TABLE master.Deliveries_Master;
GO

INSERT INTO master.Deliveries_Master
(
    Delivery_ID,
    Delivery_Number,
    Shipment_ID,
    Sales_Order_ID,
    Customer_ID,
    Calendar_Date_Key,
    Delivery_Date,
    Delivery_DateTime,
    Warehouse,
    Vehicle_ID,
    Driver_ID,
    Receiver_Name,
    Proof_of_Delivery_No,
    Delivery_Status,
    On_Time_Delivery,
    Delivery_Time_Min,
    Delivered_Qty,
    Rejected_Qty,
    Return_Qty,
    Delivery_Condition,
    Customer_Signature,
    GPS_Latitude,
    GPS_Longitude,
    Freight_Cost_USD,
    Delivery_Cost_USD,
    Created_By,
    Approved_By,
    Plant,
    Notes
)

SELECT

NULLIF(LTRIM(RTRIM(Delivery_ID)), ''),

NULLIF(LTRIM(RTRIM(Delivery_Number)), ''),

NULLIF(LTRIM(RTRIM(Shipment_ID)), ''),

NULLIF(LTRIM(RTRIM(Sales_Order_ID)), ''),

NULLIF(LTRIM(RTRIM(Customer_ID)), ''),

TRY_CONVERT(INT, Calendar_Date_Key),

TRY_CONVERT(DATE, Delivery_Date),

TRY_CONVERT(DATETIME, Delivery_DateTime),

NULLIF(LTRIM(RTRIM(Warehouse)), ''),

NULLIF(LTRIM(RTRIM(Vehicle_ID)), ''),

NULLIF(LTRIM(RTRIM(Driver_ID)), ''),

NULLIF(LTRIM(RTRIM(Receiver_Name)), ''),

NULLIF(LTRIM(RTRIM(Proof_of_Delivery_No)), ''),

NULLIF(LTRIM(RTRIM(Delivery_Status)), ''),

NULLIF(LTRIM(RTRIM(On_Time_Delivery)), ''),

TRY_CONVERT(INT, Delivery_Time_Min),

TRY_CONVERT(DECIMAL(18,2), Delivered_Qty),

TRY_CONVERT(DECIMAL(18,2), Rejected_Qty),

TRY_CONVERT(DECIMAL(18,2), Return_Qty),

NULLIF(LTRIM(RTRIM(Delivery_Condition)), ''),

NULLIF(LTRIM(RTRIM(Customer_Signature)), ''),

TRY_CONVERT(DECIMAL(10,6), GPS_Latitude),

TRY_CONVERT(DECIMAL(10,6), GPS_Longitude),

TRY_CONVERT(DECIMAL(18,2), Freight_Cost_USD),

TRY_CONVERT(DECIMAL(18,2), Delivery_Cost_USD),

NULLIF(LTRIM(RTRIM(Created_By)), ''),

NULLIF(LTRIM(RTRIM(Approved_By)), ''),

NULLIF(LTRIM(RTRIM(Plant)), ''),

NULLIF(LTRIM(RTRIM(Notes)), '')

FROM staging.Deliveries_Stage;
GO

/*============================================================
Verify Load
============================================================*/

SELECT COUNT(*) AS Master_Count
FROM master.Deliveries_Master;
GO

SELECT TOP (20) *
FROM master.Deliveries_Master
ORDER BY Delivery_ID;
GO