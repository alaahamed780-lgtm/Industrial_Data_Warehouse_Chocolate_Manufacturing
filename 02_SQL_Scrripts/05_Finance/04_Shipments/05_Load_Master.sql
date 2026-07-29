USE Chocolate_Manufacturing_DW;
GO

/*============================================================
05_Load_Shipments_Master.sql
============================================================*/

TRUNCATE TABLE master.Shipments_Master;
GO

INSERT INTO master.Shipments_Master
(
    Shipment_ID,
    Shipment_Number,
    Sales_Order_ID,
    Customer_ID,
    Calendar_Date_Key,
    Dispatch_Date,
    Estimated_Arrival_Date,
    Actual_Arrival_Date,
    Warehouse,
    Carrier,
    Vehicle_ID,
    Driver_ID,
    Route_Code,
    Shipment_Type,
    Shipment_Status,
    Tracking_Number,
    Packages_Count,
    Gross_Weight_kg,
    Net_Weight_kg,
    Volume_m3,
    Freight_Cost_USD,
    Insurance_Cost_USD,
    Temperature_Controlled,
    Seal_Number,
    Delivery_Priority,
    Created_By,
    Approved_By,
    Plant,
    Notes
)

SELECT

NULLIF(LTRIM(RTRIM(Shipment_ID)), ''),

NULLIF(LTRIM(RTRIM(Shipment_Number)), ''),

NULLIF(LTRIM(RTRIM(Sales_Order_ID)), ''),

NULLIF(LTRIM(RTRIM(Customer_ID)), ''),

TRY_CONVERT(INT, Calendar_Date_Key),

TRY_CONVERT(DATE, Dispatch_Date),

TRY_CONVERT(DATE, Estimated_Arrival_Date),

TRY_CONVERT(DATE, Actual_Arrival_Date),

NULLIF(LTRIM(RTRIM(Warehouse)), ''),

NULLIF(LTRIM(RTRIM(Carrier)), ''),

NULLIF(LTRIM(RTRIM(Vehicle_ID)), ''),

NULLIF(LTRIM(RTRIM(Driver_ID)), ''),

NULLIF(LTRIM(RTRIM(Route_Code)), ''),

NULLIF(LTRIM(RTRIM(Shipment_Type)), ''),

NULLIF(LTRIM(RTRIM(Shipment_Status)), ''),

NULLIF(LTRIM(RTRIM(Tracking_Number)), ''),

TRY_CONVERT(INT, Packages_Count),

TRY_CONVERT(DECIMAL(18,2), Gross_Weight_kg),

TRY_CONVERT(DECIMAL(18,2), Net_Weight_kg),

TRY_CONVERT(DECIMAL(18,2), Volume_m3),

TRY_CONVERT(DECIMAL(18,2), Freight_Cost_USD),

TRY_CONVERT(DECIMAL(18,2), Insurance_Cost_USD),

NULLIF(LTRIM(RTRIM(Temperature_Controlled)), ''),

NULLIF(LTRIM(RTRIM(Seal_Number)), ''),

NULLIF(LTRIM(RTRIM(Delivery_Priority)), ''),

NULLIF(LTRIM(RTRIM(Created_By)), ''),

NULLIF(LTRIM(RTRIM(Approved_By)), ''),

NULLIF(LTRIM(RTRIM(Plant)), ''),

NULLIF(LTRIM(RTRIM(Notes)), '')

FROM staging.Shipments_Stage;
GO

/*============================================================
Verify Load
============================================================*/

SELECT COUNT(*) AS Master_Count
FROM master.Shipments_Master;
GO

SELECT TOP (20) *
FROM master.Shipments_Master
ORDER BY Shipment_ID;
GO