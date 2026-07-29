USE Chocolate_Manufacturing_DW;
GO

/*============================================================
04_Create_Sales_Orders_Master.sql
============================================================*/

IF OBJECT_ID('master.Sales_Orders_Master','U') IS NOT NULL
    DROP TABLE master.Sales_Orders_Master;
GO

CREATE TABLE master.Sales_Orders_Master
(
    Sales_Order_ID NVARCHAR(50) NOT NULL,

    Sales_Order_No NVARCHAR(50),

    Customer_ID NVARCHAR(50),

    Calendar_Date_Key INT,

    Order_Date DATE,

    Requested_Delivery_Date DATE,

    Promised_Delivery_Date DATE,

    Order_Status NVARCHAR(50),

    Priority NVARCHAR(30),

    Sales_Channel NVARCHAR(50),

    Sales_Region NVARCHAR(100),

    Currency NVARCHAR(20),

    Payment_Terms NVARCHAR(100),

    Warehouse NVARCHAR(50),

    Sales_Manager_ID NVARCHAR(50),

    Total_Items INT,

    Ordered_Qty DECIMAL(18,2),

    Net_Amount_USD DECIMAL(18,2),

    Discount_USD DECIMAL(18,2),

    Tax_USD DECIMAL(18,2),

    Grand_Total_USD DECIMAL(18,2),

    Production_Order_ID NVARCHAR(50),

    Shipment_Status NVARCHAR(50),

    Delivery_Status NVARCHAR(50),

    Created_By NVARCHAR(50),

    Approved_By NVARCHAR(50),

    Plant NVARCHAR(50),

    Notes NVARCHAR(500),

    Load_Date DATETIME2
        CONSTRAINT DF_Sales_Orders_Master_LoadDate
        DEFAULT(GETDATE()),

    CONSTRAINT PK_Sales_Orders_Master
        PRIMARY KEY (Sales_Order_ID)
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
AND TABLE_NAME='Sales_Orders_Master'
ORDER BY ORDINAL_POSITION;
GO