USE Chocolate_Manufacturing_DW;
GO

/*============================================================
05_Load_Cost_Centers_Master.sql
============================================================*/

TRUNCATE TABLE master.Cost_Centers_Master;
GO

INSERT INTO master.Cost_Centers_Master
(
    Cost_Center_ID,
    Cost_Center_Code,
    Cost_Center_Name,
    Department,
    Parent_Cost_Center,
    Manager_ID,
    Plant,
    Area,
    Budget_Type,
    Annual_Budget_USD,
    Currency,
    Start_Date,
    End_Date,
    Status,
    Notes
)

SELECT

NULLIF(LTRIM(RTRIM(Cost_Center_ID)), ''),

NULLIF(LTRIM(RTRIM(Cost_Center_Code)), ''),

NULLIF(LTRIM(RTRIM(Cost_Center_Name)), ''),

NULLIF(LTRIM(RTRIM(Department)), ''),

NULLIF(LTRIM(RTRIM(Parent_Cost_Center)), ''),

NULLIF(LTRIM(RTRIM(Manager_ID)), ''),

NULLIF(LTRIM(RTRIM(Plant)), ''),

NULLIF(LTRIM(RTRIM(Area)), ''),

NULLIF(LTRIM(RTRIM(Budget_Type)), ''),

TRY_CONVERT(DECIMAL(18,2), Annual_Budget_USD),

NULLIF(LTRIM(RTRIM(Currency)), ''),

TRY_CONVERT(DATE, Start_Date),

TRY_CONVERT(DATE, End_Date),

NULLIF(LTRIM(RTRIM(Status)), ''),

NULLIF(LTRIM(RTRIM(Notes)), '')

FROM staging.Cost_Centers_Stage;
GO

/*============================================================
Verify Load
============================================================*/

SELECT COUNT(*) AS Master_Count
FROM master.Cost_Centers_Master;
GO

SELECT TOP (20) *
FROM master.Cost_Centers_Master
ORDER BY Cost_Center_ID;
GO