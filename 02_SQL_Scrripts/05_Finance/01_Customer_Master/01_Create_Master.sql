USE Chocolate_Manufacturing_DW;
GO

/*============================================================
04_Create_Customer_Master.sql
============================================================*/

IF OBJECT_ID('master.Customer_Master','U') IS NOT NULL
    DROP TABLE master.Customer_Master;
GO

CREATE TABLE master.Customer_Master
(
    Customer_ID NVARCHAR(50) NOT NULL,

    Customer_Code NVARCHAR(50),

    Customer_Name NVARCHAR(200),

    Customer_Type NVARCHAR(50),

    Industry NVARCHAR(100),

    Sales_Region NVARCHAR(100),

    Country NVARCHAR(100),

    City NVARCHAR(100),

    Address NVARCHAR(300),

    Contact_Name NVARCHAR(150),

    Phone NVARCHAR(50),

    Email NVARCHAR(200),

    Tax_Number NVARCHAR(100),

    Credit_Limit_USD DECIMAL(18,2),

    Payment_Terms NVARCHAR(100),

    Currency NVARCHAR(20),

    Sales_Manager_ID NVARCHAR(50),

    Preferred_Warehouse NVARCHAR(50),

    Status NVARCHAR(30),

    Registration_Date DATE,

    Last_Order_Date DATE,

    Customer_Rating DECIMAL(5,2),

    Annual_Sales_Target_USD DECIMAL(18,2),

    Risk_Level NVARCHAR(30),

    Notes NVARCHAR(500),

    Load_Date DATETIME2
        CONSTRAINT DF_Customer_Master_LoadDate
        DEFAULT(GETDATE()),

    CONSTRAINT PK_Customer_Master
        PRIMARY KEY (Customer_ID)
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
AND TABLE_NAME='Customer_Master'
ORDER BY ORDINAL_POSITION;
GO