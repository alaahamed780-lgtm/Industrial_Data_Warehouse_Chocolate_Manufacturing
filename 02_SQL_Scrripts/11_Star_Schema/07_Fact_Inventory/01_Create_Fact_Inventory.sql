USE Chocolate_Manufacturing_DW;
GO

IF OBJECT_ID('dw.Fact_Inventory','U') IS NOT NULL
    DROP TABLE dw.Fact_Inventory;
GO

CREATE TABLE dw.Fact_Inventory
(
    Inventory_Key INT IDENTITY(1,1) PRIMARY KEY,

    Inventory_Transaction_ID NVARCHAR(50) NOT NULL,
    Transaction_No NVARCHAR(50),

    Movement_Type INT,

    Date_Key INT,

    Product_Key INT,

    Employee_Key INT,

    Spare_Part_ID NVARCHAR(50),

    Material_ID NVARCHAR(50),

    Warehouse NVARCHAR(100),

    Bin_Location NVARCHAR(100),

    Batch_No NVARCHAR(100),

    Lot_No NVARCHAR(100),

    Reference_Document NVARCHAR(100),

    Reference_Type NVARCHAR(100),

    Work_Order_ID NVARCHAR(50),

    Production_Order_ID NVARCHAR(50),

    Vendor_ID NVARCHAR(50),

    Quantity DECIMAL(18,2),

    UOM NVARCHAR(50),

    Unit_Cost_USD DECIMAL(18,2),

    Extended_Cost_USD DECIMAL(18,2),

    Stock_Before DECIMAL(18,2),

    Stock_After DECIMAL(18,2),

    Approval_Status NVARCHAR(50),

    Reason_Code NVARCHAR(50),

    Plant NVARCHAR(100),

    Area NVARCHAR(100),

    Status NVARCHAR(50),

    Load_Date DATETIME2
);
GO

ALTER TABLE dw.Fact_Inventory
ADD CONSTRAINT FK_FactInventory_Date
FOREIGN KEY(Date_Key)
REFERENCES dw.Dim_Date(Date_Key);
GO

ALTER TABLE dw.Fact_Inventory
ADD CONSTRAINT FK_FactInventory_Product
FOREIGN KEY(Product_Key)
REFERENCES dw.Dim_Product(Product_Key);
GO

ALTER TABLE dw.Fact_Inventory
ADD CONSTRAINT FK_FactInventory_Employee
FOREIGN KEY(Employee_Key)
REFERENCES dw.Dim_Employee(Employee_Key);
GO

PRINT 'Fact_Inventory Created Successfully';
GO