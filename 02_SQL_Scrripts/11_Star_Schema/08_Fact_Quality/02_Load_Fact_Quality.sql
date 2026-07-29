USE Chocolate_Manufacturing_DW;
GO

TRUNCATE TABLE dw.Fact_Quality;
GO

INSERT INTO dw.Fact_Quality
(
    Quality_Inspection_ID,
    Inspection_No,
    Date_Key,
    Product_Key,
    Equipment_Key,
    Employee_Key,
    Production_Order_ID,
    Production_Transaction_ID,
    Batch_No,
    Lot_No,
    Material_ID,
    Inspection_Type,
    Sampling_Plan,
    Sample_Size,
    Parameter,
    Target_Value,
    Measured_Value,
    Lower_Limit,
    Upper_Limit,
    Result,
    Defect_Category,
    Defect_Code,
    Corrective_Action,
    Disposition,
    Quality_Status,
    Warehouse,
    Plant,
    Area,
    Production_Line,
    Load_Date
)

SELECT

Q.Quality_Inspection_ID,
Q.Inspection_No,

D.Date_Key,

P.Product_Key,

EQU.Equipment_Key,

EMP.Employee_Key,

Q.Production_Order_ID,
Q.Production_Transaction_ID,

Q.Batch_No,
Q.Lot_No,
Q.Material_ID,

Q.Inspection_Type,

Q.Sampling_Plan,

TRY_CAST(Q.Sample_Size AS INT),

Q.Parameter,

TRY_CAST(Q.Target_Value AS DECIMAL(18,2)),

TRY_CAST(Q.Measured_Value AS DECIMAL(18,2)),

TRY_CAST(Q.Lower_Limit AS DECIMAL(18,2)),

TRY_CAST(Q.Upper_Limit AS DECIMAL(18,2)),

Q.Result,

Q.Defect_Category,

Q.Defect_Code,

Q.Corrective_Action,

Q.Disposition,

Q.Quality_Status,

Q.Warehouse,

Q.Plant,

Q.Area,

Q.Production_Line,

TRY_CAST(Q.Load_Date AS DATETIME2)

FROM master.Quality_Inspection_Master Q

LEFT JOIN dw.Dim_Date D
ON D.[Date] = TRY_CAST(Q.Inspection_Date AS DATE)

LEFT JOIN dw.Dim_Product P
ON P.Product_ID = Q.Product_ID

LEFT JOIN dw.Dim_Equipment EQU
ON EQU.Equipment_ID = Q.Equipment_ID

LEFT JOIN dw.Dim_Employee EMP
ON EMP.Employee_ID = Q.Inspector_ID;
GO

PRINT 'Fact_Quality Loaded Successfully';
GO