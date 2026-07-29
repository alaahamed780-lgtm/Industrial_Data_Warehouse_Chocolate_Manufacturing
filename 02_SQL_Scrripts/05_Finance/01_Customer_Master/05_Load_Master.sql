USE Chocolate_Manufacturing_DW;
GO

/*============================================================
05_Load_Customer_Master.sql
============================================================*/

TRUNCATE TABLE master.Customer_Master;
GO

INSERT INTO master.Customer_Master
(
    Customer_ID,
    Customer_Code,
    Customer_Name,
    Customer_Type,
    Industry,
    Sales_Region,
    Country,
    City,
    Address,
    Contact_Name,
    Phone,
    Email,
    Tax_Number,
    Credit_Limit_USD,
    Payment_Terms,
    Currency,
    Sales_Manager_ID,
    Preferred_Warehouse,
    Status,
    Registration_Date,
    Last_Order_Date,
    Customer_Rating,
    Annual_Sales_Target_USD,
    Risk_Level,
    Notes
)

SELECT

NULLIF(LTRIM(RTRIM(Customer_ID)), ''),

NULLIF(LTRIM(RTRIM(Customer_Code)), ''),

NULLIF(LTRIM(RTRIM(Customer_Name)), ''),

NULLIF(LTRIM(RTRIM(Customer_Type)), ''),

NULLIF(LTRIM(RTRIM(Industry)), ''),

NULLIF(LTRIM(RTRIM(Sales_Region)), ''),

NULLIF(LTRIM(RTRIM(Country)), ''),

NULLIF(LTRIM(RTRIM(City)), ''),

NULLIF(LTRIM(RTRIM(Address)), ''),

NULLIF(LTRIM(RTRIM(Contact_Name)), ''),

NULLIF(LTRIM(RTRIM(Phone)), ''),

NULLIF(LTRIM(RTRIM(Email)), ''),

NULLIF(LTRIM(RTRIM(Tax_Number)), ''),

TRY_CONVERT(DECIMAL(18,2), Credit_Limit_USD),

NULLIF(LTRIM(RTRIM(Payment_Terms)), ''),

NULLIF(LTRIM(RTRIM(Currency)), ''),

NULLIF(LTRIM(RTRIM(Sales_Manager_ID)), ''),

NULLIF(LTRIM(RTRIM(Preferred_Warehouse)), ''),

NULLIF(LTRIM(RTRIM(Status)), ''),

TRY_CONVERT(DATE, Registration_Date),

TRY_CONVERT(DATE, Last_Order_Date),

TRY_CONVERT(DECIMAL(5,2), Customer_Rating),

TRY_CONVERT(DECIMAL(18,2), Annual_Sales_Target_USD),

NULLIF(LTRIM(RTRIM(Risk_Level)), ''),

NULLIF(LTRIM(RTRIM(Notes)), '')

FROM staging.Customer_Master_Stage;
GO

/*============================================================
Verify Load
============================================================*/

SELECT COUNT(*) AS Master_Count
FROM master.Customer_Master;
GO

SELECT TOP (20) *
FROM master.Customer_Master
ORDER BY Customer_ID;
GO