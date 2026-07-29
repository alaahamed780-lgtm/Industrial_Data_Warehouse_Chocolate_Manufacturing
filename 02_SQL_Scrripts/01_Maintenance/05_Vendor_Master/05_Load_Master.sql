USE Chocolate_Manufacturing_DW;
GO

TRUNCATE TABLE master.Vendor_Master;
GO

INSERT INTO master.Vendor_Master
(
    Vendor_ID,
    Vendor_Code,
    Vendor_Name,
    Vendor_Type,
    Category,
    Country,
    City,
    Region,
    Status,
    OEM_Flag,
    Preferred_Vendor,
    Manufacturer_Brand,
    Contact_Department,
    Email,
    Phone,
    Website,
    Payment_Terms,
    Currency,
    Lead_Time_Days,
    On_Time_Delivery_Percent,
    Quality_Rating,
    Vendor_Rating,
    Approved_Date,
    Contract_End_Year,
    Supplied_Category,
    Critical_Supplier,
    Warehouse_Service,
    Emergency_Support,
    MOQ,
    Annual_Spend_USD,
    Incoterm,
    Cost_Center,
    Plant,
    Area,
    Notes
)

SELECT

NULLIF(LTRIM(RTRIM(Vendor_ID)),''),

NULLIF(LTRIM(RTRIM(Vendor_Code)),''),

NULLIF(LTRIM(RTRIM(Vendor_Name)),''),

NULLIF(LTRIM(RTRIM(Vendor_Type)),''),

NULLIF(LTRIM(RTRIM(Category)),''),

NULLIF(LTRIM(RTRIM(Country)),''),

NULLIF(LTRIM(RTRIM(City)),''),

NULLIF(LTRIM(RTRIM(Region)),''),

NULLIF(LTRIM(RTRIM(Status)),''),

NULLIF(LTRIM(RTRIM(OEM_Flag)),''),

NULLIF(LTRIM(RTRIM(Preferred_Vendor)),''),

NULLIF(LTRIM(RTRIM(Manufacturer_Brand)),''),

NULLIF(LTRIM(RTRIM(Contact_Department)),''),

NULLIF(LTRIM(RTRIM(Email)),''),

NULLIF(LTRIM(RTRIM(Phone)),''),

NULLIF(LTRIM(RTRIM(Website)),''),

NULLIF(LTRIM(RTRIM(Payment_Terms)),''),

NULLIF(LTRIM(RTRIM(Currency)),''),

TRY_CONVERT(SMALLINT,Lead_Time_Days),

TRY_CONVERT(DECIMAL(5,2),On_Time_Delivery_Percent),

TRY_CONVERT(DECIMAL(5,2),Quality_Rating),

TRY_CONVERT(DECIMAL(5,2),Vendor_Rating),

TRY_CONVERT(DATE,Approved_Date),

TRY_CONVERT(SMALLINT,Contract_End_Year),

NULLIF(LTRIM(RTRIM(Supplied_Category)),''),

NULLIF(LTRIM(RTRIM(Critical_Supplier)),''),

NULLIF(LTRIM(RTRIM(Warehouse_Service)),''),

NULLIF(LTRIM(RTRIM(Emergency_Support)),''),

TRY_CONVERT(SMALLINT,MOQ),

TRY_CONVERT(DECIMAL(18,2),Annual_Spend_USD),

NULLIF(LTRIM(RTRIM(Incoterm)),''),

NULLIF(LTRIM(RTRIM(Cost_Center)),''),

NULLIF(LTRIM(RTRIM(Plant)),''),

NULLIF(LTRIM(RTRIM(Area)),''),

NULLIF(LTRIM(RTRIM(Notes)),'')

FROM staging.Vendor_Stage;
GO