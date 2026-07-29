USE Chocolate_Manufacturing_DW;
GO

/*============================================================
04_Create_Maintenance_Cost_Master.sql
============================================================*/

IF OBJECT_ID('master.Maintenance_Cost_Master','U') IS NOT NULL
    DROP TABLE master.Maintenance_Cost_Master;
GO

CREATE TABLE master.Maintenance_Cost_Master
(
    Maintenance_Cost_ID NVARCHAR(50) NOT NULL,

    Calendar_Date_Key INT,

    Cost_Date DATE,

    Work_Order_ID NVARCHAR(50),

    Equipment_ID NVARCHAR(50),

    Functional_Location_ID NVARCHAR(50),

    Cost_Center_ID NVARCHAR(50),

    GL_Account_ID NVARCHAR(50),

    Maintenance_Plan_ID NVARCHAR(50),

    Maintenance_Type NVARCHAR(50),

    Failure_Code NVARCHAR(50),

    Vendor_ID NVARCHAR(50),

    Labor_Hours DECIMAL(18,2),

    Labor_Cost_USD DECIMAL(18,2),

    Spare_Parts_Cost_USD DECIMAL(18,2),

    External_Service_Cost_USD DECIMAL(18,2),

    Tool_Cost_USD DECIMAL(18,2),

    Energy_Cost_USD DECIMAL(18,2),

    Utilities_Cost_USD DECIMAL(18,2),

    Overhead_Cost_USD DECIMAL(18,2),

    Total_Maintenance_Cost_USD DECIMAL(18,2),

    Downtime_Min DECIMAL(18,2),

    MTTR_Min DECIMAL(18,2),

    Technician_ID NVARCHAR(50),

    Plant NVARCHAR(50),

    Area NVARCHAR(100),

    Status NVARCHAR(30),

    Notes NVARCHAR(500),

    Load_Date DATETIME2
        CONSTRAINT DF_Maintenance_Cost_Master_LoadDate
        DEFAULT(GETDATE()),

    CONSTRAINT PK_Maintenance_Cost_Master
        PRIMARY KEY (Maintenance_Cost_ID)
);
GO

/*============================================================
Verify Table
============================================================*/

SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='master'
AND TABLE_NAME='Maintenance_Cost_Master'
ORDER BY ORDINAL_POSITION;
GO