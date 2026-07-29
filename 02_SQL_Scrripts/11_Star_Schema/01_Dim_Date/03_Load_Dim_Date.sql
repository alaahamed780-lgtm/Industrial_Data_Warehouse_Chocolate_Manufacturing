USE Chocolate_Manufacturing_DW;
GO

TRUNCATE TABLE dw.Dim_Date;
GO

INSERT INTO dw.Dim_Date
(
    Date_Key,
    [Date],
    [Year],
    [Quarter],
    [Month],
    Month_Name,
    Month_Short,
    Week_of_Year,
    [Day],
    Day_Name,
    Day_Short,
    Day_of_Week,
    Is_Weekend,
    Is_Month_Start,
    Is_Month_End,
    Fiscal_Year,
    Fiscal_Quarter,
    Fiscal_Month,
    Is_Leap_Year,
    Day_of_Year
)

SELECT
    Date_Key,
    [Date],
    [Year],
    [Quarter],
    [Month],
    Month_Name,
    Month_Short,
    Week_of_Year,
    [Day],
    Day_Name,
    Day_Short,
    Day_of_Week,

    CASE WHEN Is_Weekend = 'Yes' THEN CAST(1 AS BIT) ELSE CAST(0 AS BIT) END,
    CASE WHEN Is_Month_Start = 'Yes' THEN CAST(1 AS BIT) ELSE CAST(0 AS BIT) END,
    CASE WHEN Is_Month_End = 'Yes' THEN CAST(1 AS BIT) ELSE CAST(0 AS BIT) END,

    Fiscal_Year,
    Fiscal_Quarter,
    Fiscal_Month,

    CASE WHEN Is_Leap_Year = 'Yes' THEN CAST(1 AS BIT) ELSE CAST(0 AS BIT) END,

    Day_of_Year

FROM staging.Calendar_Dimension_Stage;
GO

PRINT 'Dim_Date Loaded Successfully';
GO