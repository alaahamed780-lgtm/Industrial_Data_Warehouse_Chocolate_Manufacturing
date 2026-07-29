USE Chocolate_Manufacturing_DW;
GO

-- حذف الجدول إذا كان موجودًا
IF OBJECT_ID('staging.Calendar_Dimension_Stage','U') IS NOT NULL
    DROP TABLE staging.Calendar_Dimension_Stage;
GO

CREATE TABLE staging.Calendar_Dimension_Stage
(
    Date_Key            INT,
    [Date]              DATE,

    [Year]              SMALLINT,
    [Quarter]           TINYINT,
    [Month]             TINYINT,

    Month_Name          NVARCHAR(20),
    Month_Short         NVARCHAR(10),

    Week_of_Year        TINYINT,

    [Day]               TINYINT,
    Day_Name            NVARCHAR(20),
    Day_Short           NVARCHAR(10),

    Day_of_Week         TINYINT,

    Is_Weekend          NVARCHAR(3),
    Is_Month_Start      NVARCHAR(3),
    Is_Month_End        NVARCHAR(3),

    Fiscal_Year         SMALLINT,
    Fiscal_Quarter      TINYINT,
    Fiscal_Month        TINYINT,

    Is_Leap_Year        NVARCHAR(3),

    Day_of_Year         SMALLINT
);
GO

PRINT 'Calendar Stage Created Successfully';