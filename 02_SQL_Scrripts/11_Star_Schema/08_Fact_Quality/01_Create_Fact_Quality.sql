USE Chocolate_Manufacturing_DW;
GO

IF OBJECT_ID('dw.Fact_Quality','U') IS NOT NULL
    DROP TABLE dw.Fact_Quality;
GO

CREATE TABLE dw.Fact_Quality
(
    Quality_Key INT IDENTITY(1,1) PRIMARY KEY,

    Quality_Inspection_ID NVARCHAR(50) NOT NULL,

    Inspection_No NVARCHAR(50),

    Date_Key INT,

    Product_Key INT,

    Equipment_Key INT,

    Employee_Key INT,

    Production_Order_ID NVARCHAR(50),

    Production_Transaction_ID NVARCHAR(50),

    Batch_No NVARCHAR(50),

    Lot_No NVARCHAR(50),

    Material_ID NVARCHAR(50),

    Inspection_Type NVARCHAR(100),

    Sampling_Plan NVARCHAR(100),

    Sample_Size INT,

    Parameter NVARCHAR(100),

    Target_Value DECIMAL(18,2),

    Measured_Value DECIMAL(18,2),

    Lower_Limit DECIMAL(18,2),

    Upper_Limit DECIMAL(18,2),

    Result NVARCHAR(50),

    Defect_Category NVARCHAR(100),

    Defect_Code NVARCHAR(50),

    Corrective_Action NVARCHAR(255),

    Disposition NVARCHAR(100),

    Quality_Status NVARCHAR(50),

    Warehouse NVARCHAR(100),

    Plant NVARCHAR(100),

    Area NVARCHAR(100),

    Production_Line NVARCHAR(100),

    Load_Date DATETIME2
);
GO

ALTER TABLE dw.Fact_Quality
ADD CONSTRAINT FK_FactQuality_Date
FOREIGN KEY(Date_Key)
REFERENCES dw.Dim_Date(Date_Key);
GO

ALTER TABLE dw.Fact_Quality
ADD CONSTRAINT FK_FactQuality_Product
FOREIGN KEY(Product_Key)
REFERENCES dw.Dim_Product(Product_Key);
GO

ALTER TABLE dw.Fact_Quality
ADD CONSTRAINT FK_FactQuality_Equipment
FOREIGN KEY(Equipment_Key)
REFERENCES dw.Dim_Equipment(Equipment_Key);
GO

ALTER TABLE dw.Fact_Quality
ADD CONSTRAINT FK_FactQuality_Employee
FOREIGN KEY(Employee_Key)
REFERENCES dw.Dim_Employee(Employee_Key);
GO

PRINT 'Fact_Quality Created Successfully';
GO