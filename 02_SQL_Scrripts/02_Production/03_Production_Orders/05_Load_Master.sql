USE Chocolate_Manufacturing_DW;
GO

/*============================================================
05_Load_Production_Orders_Master.sql
============================================================*/

TRUNCATE TABLE master.Production_Orders_Master;
GO

INSERT INTO master.Production_Orders_Master
(
    Production_Order_ID,
    Production_Order_No,
    Product_ID,
    BOM_ID,
    Recipe_ID,
    Plant,
    Area,
    Production_Line,
    Priority,
    Status,
    Planned_Qty,
    Produced_Qty,
    Scrap_Qty,
    Yield_Percent,
    Planned_Start,
    Planned_End,
    Actual_Start,
    Actual_End,
    Shift,
    Work_Center,
    Equipment_ID,
    Supervisor_ID,
    Batch_No,
    Lot_No,
    Quality_Status,
    Warehouse,
    Customer_Type,
    Market,
    Planned_Cost,
    Actual_Cost,
    Calendar_Key,
    Created_Date,
    Closed_Date,
    Notes
)

SELECT

NULLIF(LTRIM(RTRIM(Production_Order_ID)), ''),
NULLIF(LTRIM(RTRIM(Production_Order_No)), ''),
NULLIF(LTRIM(RTRIM(Product_ID)), ''),
NULLIF(LTRIM(RTRIM(BOM_ID)), ''),
NULLIF(LTRIM(RTRIM(Recipe_ID)), ''),
NULLIF(LTRIM(RTRIM(Plant)), ''),
NULLIF(LTRIM(RTRIM(Area)), ''),
NULLIF(LTRIM(RTRIM(Production_Line)), ''),
NULLIF(LTRIM(RTRIM(Priority)), ''),
NULLIF(LTRIM(RTRIM(Status)), ''),

TRY_CONVERT(DECIMAL(18,2), Planned_Qty),
TRY_CONVERT(DECIMAL(18,2), Produced_Qty),
TRY_CONVERT(DECIMAL(18,2), Scrap_Qty),
TRY_CONVERT(DECIMAL(5,2), Yield_Percent),

TRY_CONVERT(DATETIME2, Planned_Start),
TRY_CONVERT(DATETIME2, Planned_End),
TRY_CONVERT(DATETIME2, Actual_Start),
TRY_CONVERT(DATETIME2, Actual_End),

NULLIF(LTRIM(RTRIM(Shift)), ''),
NULLIF(LTRIM(RTRIM(Work_Center)), ''),
NULLIF(LTRIM(RTRIM(Equipment_ID)), ''),
NULLIF(LTRIM(RTRIM(Supervisor_ID)), ''),
NULLIF(LTRIM(RTRIM(Batch_No)), ''),
NULLIF(LTRIM(RTRIM(Lot_No)), ''),
NULLIF(LTRIM(RTRIM(Quality_Status)), ''),
NULLIF(LTRIM(RTRIM(Warehouse)), ''),
NULLIF(LTRIM(RTRIM(Customer_Type)), ''),
NULLIF(LTRIM(RTRIM(Market)), ''),

TRY_CONVERT(DECIMAL(18,2), Planned_Cost),
TRY_CONVERT(DECIMAL(18,2), Actual_Cost),

TRY_CONVERT(INT, Calendar_Key),

TRY_CONVERT(DATE, Created_Date),
TRY_CONVERT(DATE, Closed_Date),

NULLIF(LTRIM(RTRIM(Notes)), '')

FROM staging.Production_Orders_Stage;
GO

/*============================================================
Verify Load
============================================================*/

SELECT COUNT(*) AS Master_Count
FROM master.Production_Orders_Master;
GO

SELECT TOP (20) *
FROM master.Production_Orders_Master
ORDER BY Production_Order_ID;
GO