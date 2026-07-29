USE Chocolate_Manufacturing_DW;
GO

TRUNCATE TABLE master.Laboratory_Test_Results_Master;
GO

INSERT INTO master.Laboratory_Test_Results_Master
(
    Lab_Test_Result_ID,
    Lab_Report_No,
    Quality_Inspection_ID,
    Calendar_Date_Key,
    Test_Date,
    Test_DateTime,
    Product_ID,
    Batch_No,
    Lot_No,
    Sample_ID,
    Laboratory,
    Technician_ID,
    Test_Category,
    Test_Name,
    Test_Method,
    Unit,
    Target_Value,
    Measured_Value,
    Lower_Limit,
    Upper_Limit,
    Result,
    Severity,
    Retest_Required,
    Equipment_ID,
    Production_Order_ID,
    Production_Transaction_ID,
    Certificate_No,
    Approval_Status,
    Plant,
    Area,
    Notes
)
SELECT

    Lab_Test_Result_ID,
    Lab_Report_No,
    Quality_Inspection_ID,

    TRY_CONVERT(INT, Calendar_Date_Key),
    TRY_CONVERT(DATE, Test_Date),
    TRY_CONVERT(DATETIME2, Test_DateTime),

    Product_ID,
    Batch_No,
    Lot_No,
    Sample_ID,
    Laboratory,
    Technician_ID,
    Test_Category,
    Test_Name,
    Test_Method,
    Unit,

    TRY_CONVERT(DECIMAL(18,2), Target_Value),
    TRY_CONVERT(DECIMAL(18,2), Measured_Value),
    TRY_CONVERT(DECIMAL(18,2), Lower_Limit),
    TRY_CONVERT(DECIMAL(18,2), Upper_Limit),

    Result,
    Severity,
    Retest_Required,

    Equipment_ID,
    Production_Order_ID,
    Production_Transaction_ID,

    Certificate_No,
    Approval_Status,
    Plant,
    Area,
    Notes

FROM staging.Laboratory_Test_Results_Stage;
GO

SELECT COUNT(*) AS Master_Count
FROM master.Laboratory_Test_Results_Master;
GO

SELECT TOP (20) *
FROM master.Laboratory_Test_Results_Master
ORDER BY Lab_Test_Result_ID;
GO