USE Chocolate_Manufacturing_DW;
GO

/*============================================================
01_Create_Safety_Training_Stage.sql
============================================================*/

IF OBJECT_ID('staging.Safety_Training_Stage','U') IS NOT NULL
    DROP TABLE staging.Safety_Training_Stage;
GO

CREATE TABLE staging.Safety_Training_Stage
(
    Training_Record_ID NVARCHAR(50),
    Training_ID NVARCHAR(50),
    Calendar_Date_Key NVARCHAR(20),
    Training_Date NVARCHAR(30),
    Training_DateTime NVARCHAR(30),
    Employee_ID NVARCHAR(50),
    Department NVARCHAR(100),
    Job_Title NVARCHAR(100),
    Training_Course NVARCHAR(200),
    Training_Category NVARCHAR(100),
    Trainer_Name NVARCHAR(150),
    Training_Provider NVARCHAR(150),
    Training_Hours NVARCHAR(20),
    Training_Method NVARCHAR(50),
    Assessment_Score NVARCHAR(20),
    Pass_Status NVARCHAR(20),
    Certificate_Number NVARCHAR(50),
    Certificate_Issue_Date NVARCHAR(30),
    Certificate_Expiry_Date NVARCHAR(30),
    Retraining_Required NVARCHAR(20),
    Next_Training_Date NVARCHAR(30),
    Related_Permit_Type NVARCHAR(100),
    Related_Risk_Category NVARCHAR(100),
    Cost_USD NVARCHAR(20),
    Status NVARCHAR(30),
    Plant NVARCHAR(50),
    Area NVARCHAR(100),
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
  AND TABLE_NAME = 'Safety_Training_Stage'
ORDER BY ORDINAL_POSITION;
GO