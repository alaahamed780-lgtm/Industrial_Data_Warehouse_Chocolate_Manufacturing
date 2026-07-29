USE Chocolate_Manufacturing_DW;
GO

/*============================================================
04_Create_Production_Cost_Master.sql
============================================================*/

IF OBJECT_ID('master.Production_Cost_Master','U') IS NOT NULL
    DROP TABLE master.Production_Cost_Master;
GO

CREATE TABLE master.Production_Cost_Master
(
    Production_Cost_ID NVARCHAR(50) NOT NULL,

    Calendar_Date_Key INT,

    Cost_Date DATE,

    Production_Order_ID NVARCHAR(50),

    Production_Transaction_ID NVARCHAR(50),

    Product_ID NVARCHAR(50),

    Batch_No NVARCHAR(50),

    Cost_Center_ID NVARCHAR(50),

    GL_Account_ID NVARCHAR(50),

    Material_Cost_USD DECIMAL(18,2),

    Labor_Cost_USD DECIMAL(18,2),

    Machine_Cost_USD DECIMAL(18,2),

    Energy_Cost_USD DECIMAL(18,2),

    Water_Cost_USD DECIMAL(18,2),

    Steam_Cost_USD DECIMAL(18,2),

    Compressed_Air_Cost_USD DECIMAL(18,2),

    Maintenance_Cost_USD DECIMAL(18,2),

    Quality_Cost_USD DECIMAL(18,2),

    Packaging_Cost_USD DECIMAL(18,2),

    Overhead_Cost_USD DECIMAL(18,2),

    Total_Production_Cost_USD DECIMAL(18,2),

    Produced_Qty_kg DECIMAL(18,2),

    Unit_Cost_USD_per_kg DECIMAL(18,2),

    Plant NVARCHAR(50),

    Area NVARCHAR(100),

    Status NVARCHAR(30),

    Notes NVARCHAR(500),

    Load_Date DATETIME2
        CONSTRAINT DF_Production_Cost_Master_LoadDate
        DEFAULT(GETDATE()),

    CONSTRAINT PK_Production_Cost_Master
        PRIMARY KEY (Production_Cost_ID)
);
GO

/*============================================================
Verify Table
============================================================*/

SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'master'
AND TABLE_NAME = 'Production_Cost_Master'
ORDER BY ORDINAL_POSITION;
GO