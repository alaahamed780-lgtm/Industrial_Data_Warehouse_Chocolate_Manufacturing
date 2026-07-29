USE Chocolate_Manufacturing_DW;
GO

IF OBJECT_ID('master.Vendor_Master','U') IS NOT NULL
    DROP TABLE master.Vendor_Master;
GO

CREATE TABLE master.Vendor_Master
(
    Vendor_ID                NVARCHAR(20)      NOT NULL,
    Vendor_Code              NVARCHAR(30)      NULL,
    Vendor_Name              NVARCHAR(200)     NOT NULL,
    Vendor_Type              NVARCHAR(100)     NULL,
    Category                 NVARCHAR(100)     NULL,

    Country                  NVARCHAR(100)     NULL,
    City                     NVARCHAR(100)     NULL,
    Region                   NVARCHAR(100)     NULL,
    Status                   NVARCHAR(30)      NULL,

    OEM_Flag                 NVARCHAR(10)      NULL,
    Preferred_Vendor         NVARCHAR(10)      NULL,

    Manufacturer_Brand       NVARCHAR(150)     NULL,
    Contact_Department       NVARCHAR(100)     NULL,

    Email                    NVARCHAR(150)     NULL,
    Phone                    NVARCHAR(50)      NULL,
    Website                  NVARCHAR(200)     NULL,

    Payment_Terms            NVARCHAR(100)     NULL,
    Currency                 NVARCHAR(20)      NULL,

    Lead_Time_Days           SMALLINT          NULL,

    On_Time_Delivery_Percent DECIMAL(5,2)      NULL,

    Quality_Rating           DECIMAL(5,2)      NULL,
    Vendor_Rating            DECIMAL(5,2)      NULL,

    Approved_Date            DATE              NULL,

    Contract_End_Year        SMALLINT          NULL,

    Supplied_Category        NVARCHAR(100)     NULL,

    Critical_Supplier        NVARCHAR(10)      NULL,

    Warehouse_Service        NVARCHAR(10)      NULL,

    Emergency_Support        NVARCHAR(50)      NULL,

    MOQ                      SMALLINT          NULL,

    Annual_Spend_USD         DECIMAL(18,2)     NULL,

    Incoterm                 NVARCHAR(50)      NULL,

    Cost_Center              NVARCHAR(100)     NULL,

    Plant                    NVARCHAR(50)      NULL,

    Area                     NVARCHAR(100)     NULL,

    Notes                    NVARCHAR(MAX)     NULL,

    CONSTRAINT PK_Vendor_Master
        PRIMARY KEY (Vendor_ID)
);
GO