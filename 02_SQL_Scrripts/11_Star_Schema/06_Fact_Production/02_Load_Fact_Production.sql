USE Chocolate_Manufacturing_DW;
GO

TRUNCATE TABLE dw.Fact_Production;
GO

INSERT INTO dw.Fact_Production
(
    Production_Order_ID,
    Production_Order_No,

    Date_Key,
    Product_Key,
    Equipment_Key,

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

P.Production_Order_ID,
P.Production_Order_No,

D.Date_Key,
PR.Product_Key,
E.Equipment_Key,

P.BOM_ID,
P.Recipe_ID,

P.Plant,
P.Area,
P.Production_Line,

P.Priority,
P.Status,

TRY_CAST(P.Planned_Qty AS DECIMAL(18,2)),
TRY_CAST(P.Produced_Qty AS DECIMAL(18,2)),
TRY_CAST(P.Scrap_Qty AS DECIMAL(18,2)),
TRY_CAST(P.Yield_Percent AS DECIMAL(18,2)),

P.Planned_Start,
P.Planned_End,
P.Actual_Start,
P.Actual_End,

P.Shift,
P.Work_Center,

P.Supervisor_ID,
P.Batch_No,
P.Lot_No,

P.Quality_Status,
P.Warehouse,
P.Customer_Type,
P.Market,

TRY_CAST(P.Planned_Cost AS DECIMAL(18,2)),
TRY_CAST(P.Actual_Cost AS DECIMAL(18,2)),

TRY_CAST(P.Calendar_Key AS INT),

TRY_CAST(P.Created_Date AS DATE),
TRY_CAST(P.Closed_Date AS DATE),

P.Notes

FROM master.Production_Orders_Master P

LEFT JOIN dw.Dim_Date D
       ON D.Date = P.Created_Date

LEFT JOIN dw.Dim_Product PR
       ON PR.Product_ID = P.Product_ID

LEFT JOIN dw.Dim_Equipment E
       ON E.Equipment_ID = P.Equipment_ID;
GO

PRINT 'Fact_Production Loaded Successfully';
GO