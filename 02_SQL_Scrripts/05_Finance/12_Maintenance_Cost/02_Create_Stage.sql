USE Chocolate_Manufacturing_DW;
GO

/*============================================================
01_Create_Maintenance_Cost_Stage.sql
============================================================*/

IF OBJECT_ID('staging.Maintenance_Cost_Stage','U') IS NOT NULL
    DROP TABLE staging.Maintenance_Cost_Stage;
GO

CREATE TABLE staging.Maintenance_Cost_Stage
(
    Maintenance_Cost_ID NVARCHAR(50),

    Calendar_Date_Key NVARCHAR(20),

    Cost_Date NVARCHAR(30),

    Work_Order_ID NVARCHAR(50),

    Equipment_ID NVARCHAR(50),

    Functional_Location_ID NVARCHAR(50),

    Cost_Center_ID NVARCHAR(50),

    GL_Account_ID NVARCHAR(50),

    Maintenance_Plan_ID NVARCHAR(50),

    Maintenance_Type NVARCHAR(50),

    Failure_Code NVARCHAR(50),

    Vendor_ID NVARCHAR(50),

    Labor_Hours NVARCHAR(30),

    Labor_Cost_USD NVARCHAR(30),

    Spare_Parts_Cost_USD NVARCHAR(30),

    External_Service_Cost_USD NVARCHAR(30),

    Tool_Cost_USD NVARCHAR(30),

    Energy_Cost_USD NVARCHAR(30),

    Utilities_Cost_USD NVARCHAR(30),

    Overhead_Cost_USD NVARCHAR(30),

    Total_Maintenance_Cost_USD NVARCHAR(30),

    Downtime_Min NVARCHAR(30),

    MTTR_Min NVARCHAR(30),

    Technician_ID NVARCHAR(50),

    Plant NVARCHAR(50),

    Area NVARCHAR(100),

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
AND TABLE_NAME = 'Maintenance_Cost_Stage'
ORDER BY ORDINAL_POSITION;
GO