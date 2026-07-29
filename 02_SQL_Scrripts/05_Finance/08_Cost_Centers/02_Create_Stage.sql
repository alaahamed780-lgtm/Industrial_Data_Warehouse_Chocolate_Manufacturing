USE Chocolate_Manufacturing_DW;
GO

/*============================================================
01_Create_Cost_Centers_Stage.sql
============================================================*/

IF OBJECT_ID('staging.Cost_Centers_Stage','U') IS NOT NULL
    DROP TABLE staging.Cost_Centers_Stage;
GO

CREATE TABLE staging.Cost_Centers_Stage
(
    Cost_Center_ID NVARCHAR(50),

    Cost_Center_Code NVARCHAR(50),

    Cost_Center_Name NVARCHAR(150),

    Department NVARCHAR(100),

    Parent_Cost_Center NVARCHAR(50),

    Manager_ID NVARCHAR(50),

    Plant NVARCHAR(50),

    Area NVARCHAR(100),

    Budget_Type NVARCHAR(50),

    Annual_Budget_USD NVARCHAR(30),

    Currency NVARCHAR(20),

    Start_Date NVARCHAR(30),

    End_Date NVARCHAR(30),

    Status NVARCHAR(30),

    Notes NVARCHAR(500)
);
GO

/*============================================================
Verify Table
============================================================*/

SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'staging'
AND TABLE_NAME = 'Cost_Centers_Stage'
ORDER BY ORDINAL_POSITION;
GO