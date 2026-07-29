USE Chocolate_Manufacturing_DW;
GO

IF OBJECT_ID('dw.Fact_NCR','U') IS NOT NULL
    DROP TABLE dw.Fact_NCR;
GO

CREATE TABLE dw.Fact_NCR
(
    NCR_Key INT IDENTITY(1,1) PRIMARY KEY,

    Date_Key INT NOT NULL,
    Product_Key INT NOT NULL,
    Equipment_Key INT NULL,
    Employee_Key INT NULL,

    NCR_ID NVARCHAR(50) NOT NULL,
    NCR_Number NVARCHAR(50),

    Quality_Inspection_ID NVARCHAR(50),
    Lab_Test_Result_ID NVARCHAR(50),

    Production_Order_ID NVARCHAR(50),
    Production_Transaction_ID NVARCHAR(50),

    Batch_No NVARCHAR(100),
    Lot_No NVARCHAR(100),

    NCR_Category NVARCHAR(100),
    Defect_Type NVARCHAR(100),
    Defect_Code NVARCHAR(100),

    Severity NVARCHAR(50),

    Root_Cause NVARCHAR(MAX),

    Immediate_Action NVARCHAR(MAX),
    Corrective_Action NVARCHAR(MAX),
    Preventive_Action NVARCHAR(MAX),

    Disposition NVARCHAR(100),

    Department NVARCHAR(100),

    Target_Close_Date DATE,
    Actual_Close_Date DATE,

    Status NVARCHAR(50),

    Verification_Result NVARCHAR(100),

    Verified_By NVARCHAR(100),

    Estimated_Cost_USD DECIMAL(18,2),

    Plant NVARCHAR(100),
    Area NVARCHAR(100),

    Notes NVARCHAR(MAX)
);
GO

PRINT 'Fact_NCR Created Successfully';
GO