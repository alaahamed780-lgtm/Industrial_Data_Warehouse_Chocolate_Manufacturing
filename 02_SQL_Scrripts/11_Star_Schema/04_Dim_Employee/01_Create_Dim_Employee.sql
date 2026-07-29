USE Chocolate_Manufacturing_DW;
GO

IF OBJECT_ID('dw.Dim_Employee','U') IS NOT NULL
    DROP TABLE dw.Dim_Employee;
GO

CREATE TABLE dw.Dim_Employee
(
    Employee_Key INT IDENTITY(1,1) PRIMARY KEY,

    Employee_ID NVARCHAR(50) NOT NULL,
    Employee_Code NVARCHAR(50),

    First_Name NVARCHAR(100),
    Last_Name NVARCHAR(100),

    Job_Title NVARCHAR(100),
    Department NVARCHAR(100),

    Plant NVARCHAR(100),
    Area NVARCHAR(100),

    Maintenance_Team NVARCHAR(100),
    Work_Center NVARCHAR(100),

    Manager_ID NVARCHAR(50),

    Employment_Type NVARCHAR(50),

    Shift NVARCHAR(50),

    Skill_Primary NVARCHAR(100),
    Skill_Secondary NVARCHAR(100),

    Certification_Level NVARCHAR(100),

    Years_Experience SMALLINT,

    Hire_Year SMALLINT,

    Status NVARCHAR(50),

    Phone_Extension NVARCHAR(20),

    Email NVARCHAR(150),

    Locker_No NVARCHAR(50),

    Cost_Center NVARCHAR(50),

    Hourly_Rate_USD DECIMAL(18,2),

    Overtime_Eligible NVARCHAR(20),

    Safety_Training NVARCHAR(50),

    Electrical_Authorization NVARCHAR(100),

    Mechanical_Authorization NVARCHAR(100),

    Instrumentation_Authorization NVARCHAR(100),

    PLC_Experience NVARCHAR(100),

    Max_Work_Hours SMALLINT,

    Preferred_Work_Area NVARCHAR(100),

    Current_Assignment NVARCHAR(150),

    Supervisor NVARCHAR(100),

    Emergency_Response_Team NVARCHAR(100),

    Notes NVARCHAR(MAX)
);
GO

PRINT 'dw.Dim_Employee Created Successfully';
GO