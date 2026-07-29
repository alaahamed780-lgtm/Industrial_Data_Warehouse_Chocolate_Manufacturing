USE Chocolate_Manufacturing_DW;
GO

/*============================================================
01_Create_Production_Cost_Stage.sql
============================================================*/

IF OBJECT_ID('staging.Production_Cost_Stage','U') IS NOT NULL
    DROP TABLE staging.Production_Cost_Stage;
GO

CREATE TABLE staging.Production_Cost_Stage
(
    Production_Cost_ID NVARCHAR(50),

    Calendar_Date_Key NVARCHAR(20),

    Cost_Date NVARCHAR(30),

    Production_Order_ID NVARCHAR(50),

    Production_Transaction_ID NVARCHAR(50),

    Product_ID NVARCHAR(50),

    Batch_No NVARCHAR(50),

    Cost_Center_ID NVARCHAR(50),

    GL_Account_ID NVARCHAR(50),

    Material_Cost_USD NVARCHAR(30),

    Labor_Cost_USD NVARCHAR(30),

    Machine_Cost_USD NVARCHAR(30),

    Energy_Cost_USD NVARCHAR(30),

    Water_Cost_USD NVARCHAR(30),

    Steam_Cost_USD NVARCHAR(30),

    Compressed_Air_Cost_USD NVARCHAR(30),

    Maintenance_Cost_USD NVARCHAR(30),

    Quality_Cost_USD NVARCHAR(30),

    Packaging_Cost_USD NVARCHAR(30),

    Overhead_Cost_USD NVARCHAR(30),

    Total_Production_Cost_USD NVARCHAR(30),

    Produced_Qty_kg NVARCHAR(30),

    Unit_Cost_USD_per_kg NVARCHAR(30),

    Plant NVARCHAR(50),

    Area NVARCHAR(100),

    Status NVARCHAR(30),

    Notes NVARCHAR(500)
);
GO

/*============================================================
Verify Table
============================================================*/

SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='staging'
AND TABLE_NAME='Production_Cost_Stage'
ORDER BY ORDINAL_POSITION;
GO