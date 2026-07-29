USE Chocolate_Manufacturing_DW;
GO

TRUNCATE TABLE dw.Fact_Inventory;
GO

INSERT INTO dw.Fact_Inventory
(
    Inventory_Transaction_ID,
    Transaction_No,
    Movement_Type,
    Date_Key,
    Product_Key,
    Employee_Key,
    Spare_Part_ID,
    Material_ID,
    Warehouse,
    Bin_Location,
    Batch_No,
    Lot_No,
    Reference_Document,
    Reference_Type,
    Work_Order_ID,
    Production_Order_ID,
    Vendor_ID,
    Quantity,
    UOM,
    Unit_Cost_USD,
    Extended_Cost_USD,
    Stock_Before,
    Stock_After,
    Approval_Status,
    Reason_Code,
    Plant,
    Area,
    Status,
    Load_Date
)

SELECT

    I.Inventory_Transaction_ID,

    I.Transaction_No,

    TRY_CAST(I.Movement_Type AS INT),

    D.Date_Key,

    P.Product_Key,

    E.Employee_Key,

    I.Spare_Part_ID,

    I.Material_ID,

    I.Warehouse,

    I.Bin_Location,

    I.Batch_No,

    I.Lot_No,

    I.Reference_Document,

    I.Reference_Type,

    I.Work_Order_ID,

    I.Production_Order_ID,

    I.Vendor_ID,

    TRY_CAST(I.Quantity AS DECIMAL(18,2)),

    I.UOM,

    TRY_CAST(I.Unit_Cost_USD AS DECIMAL(18,2)),

    TRY_CAST(I.Extended_Cost_USD AS DECIMAL(18,2)),

    TRY_CAST(I.Stock_Before AS DECIMAL(18,2)),

    TRY_CAST(I.Stock_After AS DECIMAL(18,2)),

    I.Approval_Status,

    I.Reason_Code,

    I.Plant,

    I.Area,

    I.Status,

    TRY_CAST(I.Load_Date AS DATETIME2)

FROM master.Inventory_Transactions_Master I

LEFT JOIN dw.Dim_Date D
    ON D.[Date] = TRY_CAST(I.Transaction_Date AS DATE)

LEFT JOIN dw.Dim_Product P
    ON P.Product_ID = I.Product_ID

LEFT JOIN dw.Dim_Employee E
    ON E.Employee_ID = I.Employee_ID;

PRINT 'Fact_Inventory Loaded Successfully';
GO