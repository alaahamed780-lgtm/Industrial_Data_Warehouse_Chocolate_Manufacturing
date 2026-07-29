USE Chocolate_Manufacturing_DW;
GO

/*============================================================
01_Create_Shipments_Stage.sql
============================================================*/

IF OBJECT_ID('staging.Shipments_Stage','U') IS NOT NULL
    DROP TABLE staging.Shipments_Stage;
GO

CREATE TABLE staging.Shipments_Stage
(
    Shipment_ID NVARCHAR(50),

    Shipment_Number NVARCHAR(50),

    Sales_Order_ID NVARCHAR(50),

    Customer_ID NVARCHAR(50),

    Calendar_Date_Key NVARCHAR(20),

    Dispatch_Date NVARCHAR(30),

    Estimated_Arrival_Date NVARCHAR(30),

    Actual_Arrival_Date NVARCHAR(30),

    Warehouse NVARCHAR(50),

    Carrier NVARCHAR(100),

    Vehicle_ID NVARCHAR(50),

    Driver_ID NVARCHAR(50),

    Route_Code NVARCHAR(50),

    Shipment_Type NVARCHAR(50),

    Shipment_Status NVARCHAR(50),

    Tracking_Number NVARCHAR(100),

    Packages_Count NVARCHAR(20),

    Gross_Weight_kg NVARCHAR(30),

    Net_Weight_kg NVARCHAR(30),

    Volume_m3 NVARCHAR(30),

    Freight_Cost_USD NVARCHAR(30),

    Insurance_Cost_USD NVARCHAR(30),

    Temperature_Controlled NVARCHAR(20),

    Seal_Number NVARCHAR(50),

    Delivery_Priority NVARCHAR(30),

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
WHERE TABLE_SCHEMA='staging'
  AND TABLE_NAME='Shipments_Stage'
ORDER BY ORDINAL_POSITION;
GO