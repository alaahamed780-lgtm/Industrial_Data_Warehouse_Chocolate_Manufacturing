USE Chocolate_Manufacturing_DW;
GO

PRINT '=========================================';
PRINT 'Insert Unknown Member - Dim_Date';
PRINT '=========================================';
GO

IF NOT EXISTS (SELECT 1 FROM dw.Dim_Date WHERE Date_Key = -1)
BEGIN
    

    INSERT INTO dw.Dim_Date
    (
        Date_Key,
        Date,
        Year,
        Quarter,
        Month,
        Month_Name,
        Month_Short,
        Week_of_Year,
        Day,
        Day_Name,
        Day_Short,
        Day_of_Week,
        Is_Weekend,
        Is_Month_Start,
        Is_Month_End,
        Fiscal_Year,
        Fiscal_Quarter,
        Fiscal_Month,
        Is_Leap_Year,
        Day_of_Year
    )
    VALUES
    (
        -1,
        '1900-01-01',
        1900,
        1,
        1,
        'Unknown',
        'UNK',
        1,
        1,
        'Unknown',
        'UNK',
        1,
        0,
        0,
        0,
        1900,
        1,
        1,
        0,
        1
    );

    
END
GO
PRINT '=========================================';
PRINT 'Insert Unknown Member - Dim_Product';
PRINT '=========================================';
GO

IF NOT EXISTS (SELECT 1 FROM dw.Dim_Product WHERE Product_Key = -1)
BEGIN

SET IDENTITY_INSERT dw.Dim_Product ON;

INSERT INTO dw.Dim_Product
(
    Product_Key,
    Product_ID,
    SKU,
    Barcode,
    Product_Name,
    Brand,
    Product_Family,
    Category,
    Chocolate_Type,
    Cocoa_Percent,
    Net_Weight,
    Package_Type,
    Units_Per_Carton,
    Cartons_Per_Pallet,
    Shelf_Life_Days,
    Storage_Temperature,
    Recipe_ID,
    BOM_ID,
    Primary_Process_Line,
    Primary_Plant,
    Quality_Standard,
    Allergen_Info,
    Market,
    Country,
    Currency,
    Standard_Cost,
    Standard_Price,
    Launch_Date,
    Status,
    Export_Product,
    Organic,
    Sugar_Free,
    Packaging,
    Primary_Warehouse,
    Batch_Control,
    FEFO_Required,
    Nutritional_Info,
    HS_Code,
    Product_Model,
    Revision,
    Created_Date,
    Last_Update,
    Notes
)
VALUES
(
    -1,
    'UNKNOWN',
    'UNKNOWN',
    'UNKNOWN',
    'Unknown Product',
    'Unknown',
    'Unknown',
    'Unknown',
    'Unknown',
    0,
    0,
    'Unknown',
    0,
    0,
    0,
    'Unknown',
    'UNKNOWN',
    'UNKNOWN',
    'Unknown',
    'Unknown',
    'Unknown',
    'Unknown',
    'Unknown',
    'Unknown',
    'USD',
    0,
    0,
    '1900-01-01',
    'Unknown',
    'No',
    'No',
    'No',
    'Unknown',
    'Unknown',
    'No',
    'No',
    'Unknown',
    'Unknown',
    'Unknown',
    '1.0',
    '1900-01-01',
    '1900-01-01',
    'Unknown Record'
);

SET IDENTITY_INSERT dw.Dim_Product OFF;

END
GO

PRINT 'Insert Unknown Member - Dim_Equipment';

IF NOT EXISTS
(
    SELECT 1
    FROM dw.Dim_Equipment
    WHERE Equipment_Key = -1
)
BEGIN

SET IDENTITY_INSERT dw.Dim_Equipment ON;

INSERT INTO dw.Dim_Equipment
(
    Equipment_Key,
    Equipment_ID,
    Asset_Tag,
    Equipment_Name,
    Equipment_Type,
    Category,
    Subcategory,
    Plant,
    Building,
    Area,
    Production_Line,
    Functional_Location,
    Parent_Equipment,
    Manufacturer,
    Model,
    Serial_Number,
    Country,
    Installation_Year,
    Commissioning_Date,
    Criticality,
    Risk_Class,
    Status,
    Maintenance_Team,
    Cost_Center,
    Created_Date
)
VALUES
(
    -1,
    'UNK',
    'UNK',
    'Unknown Equipment',
    'Unknown',
    'Unknown',
    'Unknown',
    'Unknown',
    'Unknown',
    'Unknown',
    'Unknown',
    'Unknown',
    'Unknown',
    'Unknown',
    'Unknown',
    'Unknown',
    'Unknown',
    1900,
    '1900-01-01',
    'Unknown',
    'Unknown',
    'Unknown',
    'Unknown',
    'Unknown',
    '1900-01-01'
);

SET IDENTITY_INSERT dw.Dim_Equipment OFF;

END
GO
PRINT 'Insert Unknown Member - Dim_Employee';

IF NOT EXISTS
(
    SELECT 1
    FROM dw.Dim_Employee
    WHERE Employee_Key = -1
)
BEGIN

SET IDENTITY_INSERT dw.Dim_Employee ON;

INSERT INTO dw.Dim_Employee
(
    Employee_Key,
    Employee_ID,
    Employee_Code,
    First_Name,
    Last_Name,
    Job_Title,
    Department,
    Plant,
    Area,
    Maintenance_Team,
    Work_Center,
    Manager_ID,
    Employment_Type,
    Shift,
    Skill_Primary,
    Skill_Secondary,
    Certification_Level,
    Years_Experience,
    Hire_Year,
    Status,
    Phone_Extension,
    Email,
    Locker_No,
    Cost_Center,
    Hourly_Rate_USD,
    Overtime_Eligible,
    Safety_Training,
    Electrical_Authorization,
    Mechanical_Authorization,
    Instrumentation_Authorization,
    PLC_Experience,
    Max_Work_Hours,
    Preferred_Work_Area,
    Current_Assignment,
    Supervisor,
    Emergency_Response_Team,
    Notes
)
VALUES
(
    -1,
    'UNK',
    'UNK',
    'Unknown',
    'Unknown',
    'Unknown',
    'Unknown',
    'Unknown',
    'Unknown',
    'Unknown',
    'Unknown',
    'UNK',
    'Unknown',
    'Unknown',
    'Unknown',
    'Unknown',
    'Unknown',
    0,
    1900,
    'Unknown',
    'Unknown',
    'Unknown',
    'Unknown',
    'Unknown',
    0,
    'No',
    'No',
    'No',
    'No',
    'No',
    'No',
    0,
    'Unknown',
    'Unknown',
    'Unknown',
    'No',
    'Unknown Record'
);

SET IDENTITY_INSERT dw.Dim_Employee OFF;

END
GO