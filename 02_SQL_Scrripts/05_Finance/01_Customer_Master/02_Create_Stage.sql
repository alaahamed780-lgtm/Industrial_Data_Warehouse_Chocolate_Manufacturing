USE Chocolate_Manufacturing_DW;
GO

/*============================================================
01_Create_Customer_Master_Stage.sql
============================================================*/

IF OBJECT_ID('staging.Customer_Master_Stage','U') IS NOT NULL
    DROP TABLE staging.Customer_Master_Stage;
GO

CREATE TABLE staging.Customer_Master_Stage
(
    Customer_ID NVARCHAR(50),

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

    Credit_Limit_USD NVARCHAR(50),

    Payment_Terms NVARCHAR(100),

    Currency NVARCHAR(20),

    Sales_Manager_ID NVARCHAR(50),

    Preferred_Warehouse NVARCHAR(50),

    Status NVARCHAR(30),

    Registration_Date NVARCHAR(30),

    Last_Order_Date NVARCHAR(30),

    Customer_Rating NVARCHAR(20),

    Annual_Sales_Target_USD NVARCHAR(50),

    Risk_Level NVARCHAR(30),

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
AND TABLE_NAME='Customer_Master_Stage'
ORDER BY ORDINAL_POSITION;
GO