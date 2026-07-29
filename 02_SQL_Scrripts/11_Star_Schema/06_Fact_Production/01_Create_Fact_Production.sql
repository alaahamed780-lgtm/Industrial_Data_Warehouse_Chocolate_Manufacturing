USE Chocolate_Manufacturing_DW;
GO

IF OBJECT_ID('dw.Fact_Production','U') IS NOT NULL
    DROP TABLE dw.Fact_Production;
GO

CREATE TABLE dw.Fact_Production
(
    Production_Key BIGINT IDENTITY(1,1) PRIMARY KEY,

    Production_Order_ID NVARCHAR(50) NOT NULL,
    Production_Order_No NVARCHAR(50),

    Date_Key INT,
    Product_Key INT,
    Equipment_Key INT,

    BOM_ID NVARCHAR(50),
    Recipe_ID NVARCHAR(50),

    Plant NVARCHAR(100),
    Area NVARCHAR(100),
    Production_Line NVARCHAR(100),

    Priority NVARCHAR(50),
    Status NVARCHAR(50),

    Planned_Qty DECIMAL(18,2),
    Produced_Qty DECIMAL(18,2),
    Scrap_Qty DECIMAL(18,2),
    Yield_Percent DECIMAL(18,2),

    Planned_Start DATETIME2,
    Planned_End DATETIME2,
    Actual_Start DATETIME2,
    Actual_End DATETIME2,

    Shift NVARCHAR(50),
    Work_Center NVARCHAR(100),

    Supervisor_ID NVARCHAR(50),
    Batch_No NVARCHAR(50),
    Lot_No NVARCHAR(50),

    Quality_Status NVARCHAR(100),
    Warehouse NVARCHAR(100),
    Customer_Type NVARCHAR(100),
    Market NVARCHAR(100),

    Planned_Cost DECIMAL(18,2),
    Actual_Cost DECIMAL(18,2),

    Calendar_Key INT,

    Created_Date DATE,
    Closed_Date DATE,

    Notes NVARCHAR(MAX)
);
GO

PRINT 'dw.Fact_Production Created Successfully';
GO