USE Chocolate_Manufacturing_DW;
GO

/*============================================================
05_Load_Quality_Inspection_Master.sql
============================================================*/

TRUNCATE TABLE master.Quality_Inspection_Master;
GO

INSERT INTO master.Quality_Inspection_Master
(
    Quality_Inspection_ID,
    Inspection_No,
    Calendar_Date_Key,
    Inspection_Date,
    Inspection_DateTime,
    Inspection_Type,
    Production_Order_ID,
    Production_Transaction_ID,
    Product_ID,
    Batch_No,
    Lot_No,
    Material_ID,
    Equipment_ID,
    Inspector_ID,
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
    Notes
)

SELECT

NULLIF(LTRIM(RTRIM(Quality_Inspection_ID)), ''),
NULLIF(LTRIM(RTRIM(Inspection_No)), ''),

TRY_CONVERT(INT, Calendar_Date_Key),

TRY_CONVERT(DATE, Inspection_Date),

TRY_CONVERT(DATETIME2, Inspection_DateTime),

NULLIF(LTRIM(RTRIM(Inspection_Type)), ''),

NULLIF(LTRIM(RTRIM(Production_Order_ID)), ''),

NULLIF(LTRIM(RTRIM(Production_Transaction_ID)), ''),

NULLIF(LTRIM(RTRIM(Product_ID)), ''),

NULLIF(LTRIM(RTRIM(Batch_No)), ''),

NULLIF(LTRIM(RTRIM(Lot_No)), ''),

NULLIF(LTRIM(RTRIM(Material_ID)), ''),

NULLIF(LTRIM(RTRIM(Equipment_ID)), ''),

NULLIF(LTRIM(RTRIM(Inspector_ID)), ''),

NULLIF(LTRIM(RTRIM(Sampling_Plan)), ''),

TRY_CONVERT(INT, Sample_Size),

NULLIF(LTRIM(RTRIM(Parameter)), ''),

TRY_CONVERT(DECIMAL(18,4), Target_Value),

TRY_CONVERT(DECIMAL(18,4), Measured_Value),

TRY_CONVERT(DECIMAL(18,4), Lower_Limit),

TRY_CONVERT(DECIMAL(18,4), Upper_Limit),

NULLIF(LTRIM(RTRIM(Result)), ''),

NULLIF(LTRIM(RTRIM(Defect_Category)), ''),

NULLIF(LTRIM(RTRIM(Defect_Code)), ''),

NULLIF(LTRIM(RTRIM(Corrective_Action)), ''),

NULLIF(LTRIM(RTRIM(Disposition)), ''),

NULLIF(LTRIM(RTRIM(Quality_Status)), ''),

NULLIF(LTRIM(RTRIM(Warehouse)), ''),

NULLIF(LTRIM(RTRIM(Plant)), ''),

NULLIF(LTRIM(RTRIM(Area)), ''),

NULLIF(LTRIM(RTRIM(Production_Line)), ''),

NULLIF(LTRIM(RTRIM(Notes)), '')

FROM staging.Quality_Inspection_Stage;
GO

/*============================================================
Verify Load
============================================================*/

SELECT
    COUNT(*) AS Master_Count
FROM master.Quality_Inspection_Master;
GO

SELECT TOP (20) *
FROM master.Quality_Inspection_Master
ORDER BY Quality_Inspection_ID;
GO