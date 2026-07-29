USE Chocolate_Manufacturing_DW;
GO

TRUNCATE TABLE dw.Fact_NCR;
GO

INSERT INTO dw.Fact_NCR
(
    Date_Key,
    Product_Key,
    Equipment_Key,
    Employee_Key,

    NCR_ID,
    NCR_Number,
    Quality_Inspection_ID,
    Lab_Test_Result_ID,

    Production_Order_ID,
    Production_Transaction_ID,

    Batch_No,
    Lot_No,

    NCR_Category,
    Defect_Type,
    Defect_Code,
    Severity,
    Root_Cause,

    Immediate_Action,
    Corrective_Action,
    Preventive_Action,

    Disposition,
    Department,

    Target_Close_Date,
    Actual_Close_Date,

    Status,
    Verification_Result,
    Verified_By,

    Estimated_Cost_USD,

    Plant,
    Area,
    Notes
)

SELECT

    ISNULL(D.Date_Key,-1) AS Date_Key,

    ISNULL(P.Product_Key,-1) AS Product_Key,

    ISNULL(EQ.Equipment_Key,-1) AS Equipment_Key,

    ISNULL(E.Employee_Key,-1) AS Employee_Key,

    N.NCR_ID,
    N.NCR_Number,
    N.Quality_Inspection_ID,
    N.Lab_Test_Result_ID,

    N.Production_Order_ID,
    N.Production_Transaction_ID,

    N.Batch_No,
    N.Lot_No,

    N.NCR_Category,
    N.Defect_Type,
    N.Defect_Code,
    N.Severity,
    N.Root_Cause,

    N.Immediate_Action,
    N.Corrective_Action,
    N.Preventive_Action,

    N.Disposition,
    N.Department,

    TRY_CAST(N.Target_Close_Date AS DATE),

    TRY_CAST(N.Actual_Close_Date AS DATE),

    N.Status,
    N.Verification_Result,
    N.Verified_By,

    N.Estimated_Cost_USD,

    N.Plant,
    N.Area,
    N.Notes

FROM master.Non_Conformance_Reports_Master N

LEFT JOIN dw.Dim_Date D
    ON D.Date = TRY_CAST(N.Report_Date AS DATE)

LEFT JOIN dw.Dim_Product P
    ON P.Product_ID = N.Product_ID

LEFT JOIN dw.Dim_Equipment EQ
    ON EQ.Equipment_ID = N.Equipment_ID

LEFT JOIN dw.Dim_Employee E
    ON E.Employee_ID = N.Responsible_Employee_ID;
GO

PRINT 'Fact_NCR Loaded Successfully';
GO