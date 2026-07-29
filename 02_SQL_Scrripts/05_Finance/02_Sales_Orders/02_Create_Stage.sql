USE Chocolate_Manufacturing_DW;
GO

/*============================================================
01_Create_Sales_Orders_Stage.sql
============================================================*/

IF OBJECT_ID('staging.Sales_Orders_Stage','U') IS NOT NULL
    DROP TABLE staging.Sales_Orders_Stage;
GO

CREATE TABLE staging.Sales_Orders_Stage
(
    Sales_Order_ID NVARCHAR(50),

    Sales_Order_No NVARCHAR(50),

    Customer_ID NVARCHAR(50),

    Calendar_Date_Key NVARCHAR(20),

    Order_Date NVARCHAR(30),

    Requested_Delivery_Date NVARCHAR(30),

    Promised_Delivery_Date NVARCHAR(30),

    Order_Status NVARCHAR(50),

    Priority NVARCHAR(30),

    Sales_Channel NVARCHAR(50),

    Sales_Region NVARCHAR(100),

    Currency NVARCHAR(20),

    Payment_Terms NVARCHAR(100),

    Warehouse NVARCHAR(50),

    Sales_Manager_ID NVARCHAR(50),

    Total_Items NVARCHAR(20),

    Ordered_Qty NVARCHAR(30),

    Net_Amount_USD NVARCHAR(30),

    Discount_USD NVARCHAR(30),

    Tax_USD NVARCHAR(30),

    Grand_Total_USD NVARCHAR(30),

    Production_Order_ID NVARCHAR(50),

    Shipment_Status NVARCHAR(50),

    Delivery_Status NVARCHAR(50),

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
  AND TABLE_NAME = 'Sales_Orders_Stage'
ORDER BY ORDINAL_POSITION;
GO