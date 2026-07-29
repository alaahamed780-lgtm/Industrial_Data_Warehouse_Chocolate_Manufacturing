USE Chocolate_Manufacturing_DW;
GO

/*============================================================
05_Load_Production_Cost_Master.sql
============================================================*/

TRUNCATE TABLE master.Production_Cost_Master;
GO

INSERT INTO master.Production_Cost_Master
(
    Production_Cost_ID,
    Calendar_Date_Key,
    Cost_Date,
    Production_Order_ID,
    Production_Transaction_ID,
    Product_ID,
    Batch_No,
    Cost_Center_ID,
    GL_Account_ID,
    Material_Cost_USD,
    Labor_Cost_USD,
    Machine_Cost_USD,
    Energy_Cost_USD,
    Water_Cost_USD,
    Steam_Cost_USD,
    Compressed_Air_Cost_USD,
    Maintenance_Cost_USD,
    Quality_Cost_USD,
    Packaging_Cost_USD,
    Overhead_Cost_USD,
    Total_Production_Cost_USD,
    Produced_Qty_kg,
    Unit_Cost_USD_per_kg,
    Plant,
    Area,
    Status,
    Notes
)

SELECT

NULLIF(LTRIM(RTRIM(Production_Cost_ID)), ''),

TRY_CONVERT(INT, Calendar_Date_Key),

TRY_CONVERT(DATE, Cost_Date),

NULLIF(LTRIM(RTRIM(Production_Order_ID)), ''),

NULLIF(LTRIM(RTRIM(Production_Transaction_ID)), ''),

NULLIF(LTRIM(RTRIM(Product_ID)), ''),

NULLIF(LTRIM(RTRIM(Batch_No)), ''),

NULLIF(LTRIM(RTRIM(Cost_Center_ID)), ''),

NULLIF(LTRIM(RTRIM(GL_Account_ID)), ''),

TRY_CONVERT(DECIMAL(18,2), Material_Cost_USD),

TRY_CONVERT(DECIMAL(18,2), Labor_Cost_USD),

TRY_CONVERT(DECIMAL(18,2), Machine_Cost_USD),

TRY_CONVERT(DECIMAL(18,2), Energy_Cost_USD),

TRY_CONVERT(DECIMAL(18,2), Water_Cost_USD),

TRY_CONVERT(DECIMAL(18,2), Steam_Cost_USD),

TRY_CONVERT(DECIMAL(18,2), Compressed_Air_Cost_USD),

TRY_CONVERT(DECIMAL(18,2), Maintenance_Cost_USD),

TRY_CONVERT(DECIMAL(18,2), Quality_Cost_USD),

TRY_CONVERT(DECIMAL(18,2), Packaging_Cost_USD),

TRY_CONVERT(DECIMAL(18,2), Overhead_Cost_USD),

TRY_CONVERT(DECIMAL(18,2), Total_Production_Cost_USD),

TRY_CONVERT(DECIMAL(18,2), Produced_Qty_kg),

TRY_CONVERT(DECIMAL(18,2), Unit_Cost_USD_per_kg),

NULLIF(LTRIM(RTRIM(Plant)), ''),

NULLIF(LTRIM(RTRIM(Area)), ''),

NULLIF(LTRIM(RTRIM(Status)), ''),

NULLIF(LTRIM(RTRIM(Notes)), '')

FROM staging.Production_Cost_Stage;
GO

/*============================================================
Verify Load
============================================================*/

SELECT COUNT(*) AS Master_Count
FROM master.Production_Cost_Master;
GO

SELECT TOP (20) *
FROM master.Production_Cost_Master
ORDER BY Production_Cost_ID;
GO