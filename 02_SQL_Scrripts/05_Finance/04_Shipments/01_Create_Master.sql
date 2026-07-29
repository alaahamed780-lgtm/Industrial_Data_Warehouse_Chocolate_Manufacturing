USE Chocolate_Manufacturing_DW;
GO

/*============================================================
04_Create_Shipments_Master.sql
============================================================*/

IF OBJECT_ID('master.Shipments_Master','U') IS NOT NULL
    DROP TABLE master.Shipments_Master;
GO

CREATE TABLE master.Shipments_Master
(
    Shipment_ID NVARCHAR(50) NOT NULL,

    Shipment_Number NVARCHAR(50),

    Sales_Order_ID NVARCHAR(50),

    Customer_ID NVARCHAR(50),

    Calendar_Date_Key INT,

    Dispatch_Date DATE,

    Estimated_Arrival_Date DATE,

    Actual_Arrival_Date DATE,

    Warehouse NVARCHAR(50),

    Carrier NVARCHAR(100),

    Vehicle_ID NVARCHAR(50),

    Driver_ID NVARCHAR(50),

    Route_Code NVARCHAR(50),

    Shipment_Type NVARCHAR(50),

    Shipment_Status NVARCHAR(50),

    Tracking_Number NVARCHAR(100),

    Packages_Count INT,

    Gross_Weight_kg DECIMAL(18,2),

    Net_Weight_kg DECIMAL(18,2),

    Volume_m3 DECIMAL(18,2),

    Freight_Cost_USD DECIMAL(18,2),

    Insurance_Cost_USD DECIMAL(18,2),

    Temperature_Controlled NVARCHAR(20),

    Seal_Number NVARCHAR(50),

    Delivery_Priority NVARCHAR(30),

    Created_By NVARCHAR(50),

    Approved_By NVARCHAR(50),

    Plant NVARCHAR(50),

    Notes NVARCHAR(500),

    Load_Date DATETIME2
        CONSTRAINT DF_Shipments_Master_LoadDate
        DEFAULT(GETDATE()),

    CONSTRAINT PK_Shipments_Master
        PRIMARY KEY (Shipment_ID)
);
GO

/*============================================================
Verify Table
============================================================*/

SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='master'
AND TABLE_NAME='Shipments_Master'
ORDER BY ORDINAL_POSITION;
GO