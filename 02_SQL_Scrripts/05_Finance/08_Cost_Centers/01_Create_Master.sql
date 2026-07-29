USE Chocolate_Manufacturing_DW;
GO

/*============================================================
04_Create_Cost_Centers_Master.sql
============================================================*/

IF OBJECT_ID('master.Cost_Centers_Master','U') IS NOT NULL
    DROP TABLE master.Cost_Centers_Master;
GO

CREATE TABLE master.Cost_Centers_Master
(
    Cost_Center_ID NVARCHAR(50) NOT NULL,

    Cost_Center_Code NVARCHAR(50),

    Cost_Center_Name NVARCHAR(150),

    Department NVARCHAR(100),

    Parent_Cost_Center NVARCHAR(50),

    Manager_ID NVARCHAR(50),

    Plant NVARCHAR(50),

    Area NVARCHAR(100),

    Budget_Type NVARCHAR(50),

    Annual_Budget_USD DECIMAL(18,2),

    Currency NVARCHAR(20),

    Start_Date DATE,

    End_Date DATE,

    Status NVARCHAR(30),

    Notes NVARCHAR(500),

    Load_Date DATETIME2
        CONSTRAINT DF_Cost_Centers_Master_LoadDate
        DEFAULT(GETDATE()),

    CONSTRAINT PK_Cost_Centers_Master
        PRIMARY KEY (Cost_Center_ID)
);
GO

/*============================================================
Verify Table
============================================================*/

SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'master'
  AND TABLE_NAME = 'Cost_Centers_Master'
ORDER BY ORDINAL_POSITION;
GO