USE Chocolate_Manufacturing_DW;
GO

/*============================================================
05_Load_Production_Transactions_Master.sql
============================================================*/

TRUNCATE TABLE master.Production_Transactions_Master;
GO

INSERT INTO master.Production_Transactions_Master
(
    Production_Transaction_ID,
    Production_Order_ID,
    Calendar_Date_Key,
    Transaction_Date,
    Start_DateTime,
    End_DateTime,
    Shift,
    Product_ID,
    Batch_No,
    Recipe_ID,
    BOM_ID,
    Equipment_ID,
    Operator_ID,
    Input_Raw_Material_kg,
    Output_Finished_Goods_kg,
    Scrap_kg,
    Yield_Percent,
    Runtime_Min,
    Downtime_Event_ID,
    Quality_Status,
    Energy_kWh,
    Cost_USD,
    Area,
    Production_Line,
    Status
)

SELECT

NULLIF(LTRIM(RTRIM(Production_Transaction_ID)), ''),
NULLIF(LTRIM(RTRIM(Production_Order_ID)), ''),

TRY_CONVERT(INT, Calendar_Date_Key),

TRY_CONVERT(DATE, Transaction_Date),

TRY_CONVERT(DATETIME2, Start_DateTime),
TRY_CONVERT(DATETIME2, End_DateTime),

NULLIF(LTRIM(RTRIM(Shift)), ''),

NULLIF(LTRIM(RTRIM(Product_ID)), ''),

NULLIF(LTRIM(RTRIM(Batch_No)), ''),

NULLIF(LTRIM(RTRIM(Recipe_ID)), ''),

NULLIF(LTRIM(RTRIM(BOM_ID)), ''),

NULLIF(LTRIM(RTRIM(Equipment_ID)), ''),

NULLIF(LTRIM(RTRIM(Operator_ID)), ''),

TRY_CONVERT(DECIMAL(18,2), Input_Raw_Material_kg),

TRY_CONVERT(DECIMAL(18,2), Output_Finished_Goods_kg),

TRY_CONVERT(DECIMAL(18,2), Scrap_kg),

TRY_CONVERT(DECIMAL(5,2), Yield_Percent),

TRY_CONVERT(INT, Runtime_Min),

NULLIF(LTRIM(RTRIM(Downtime_Event_ID)), ''),

NULLIF(LTRIM(RTRIM(Quality_Status)), ''),

TRY_CONVERT(DECIMAL(18,2), Energy_kWh),

TRY_CONVERT(DECIMAL(18,2), Cost_USD),

NULLIF(LTRIM(RTRIM(Area)), ''),

NULLIF(LTRIM(RTRIM(Production_Line)), ''),

NULLIF(LTRIM(RTRIM(Status)), '')

FROM staging.Production_Transactions_Stage;
GO

/*============================================================
Verify Load
============================================================*/

SELECT
    COUNT(*) AS Master_Count
FROM master.Production_Transactions_Master;
GO

SELECT TOP (20) *
FROM master.Production_Transactions_Master
ORDER BY Production_Transaction_ID;
GO