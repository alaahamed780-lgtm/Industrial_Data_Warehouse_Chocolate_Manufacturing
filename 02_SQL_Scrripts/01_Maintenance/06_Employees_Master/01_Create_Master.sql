USE Chocolate_Manufacturing_DW;
GO

IF OBJECT_ID('master.Employees_Master','U') IS NOT NULL
    DROP TABLE master.Employees_Master;
GO

CREATE TABLE master.Employees_Master
(
    Employee_ID                    NVARCHAR(20)     NOT NULL,
    Employee_Code                  NVARCHAR(20)     NULL,

    First_Name                     NVARCHAR(100)    NULL,
    Last_Name                      NVARCHAR(100)    NULL,

    Job_Title                      NVARCHAR(150)    NULL,
    Department                     NVARCHAR(100)    NULL,

    Plant                          NVARCHAR(50)     NULL,
    Area                           NVARCHAR(100)    NULL,

    Maintenance_Team               NVARCHAR(100)    NULL,
    Work_Center                    NVARCHAR(50)     NULL,

    Manager_ID                     NVARCHAR(20)     NULL,

    Employment_Type                NVARCHAR(50)     NULL,

    Shift                          NVARCHAR(20)     NULL,

    Skill_Primary                  NVARCHAR(100)    NULL,
    Skill_Secondary                NVARCHAR(100)    NULL,

    Certification_Level            NVARCHAR(50)     NULL,

    Years_Experience               SMALLINT         NULL,

    Hire_Year                      SMALLINT         NULL,

    Status                         NVARCHAR(30)     NULL,

    Phone_Extension                NVARCHAR(20)     NULL,

    Email                          NVARCHAR(255)    NULL,

    Locker_No                      NVARCHAR(30)     NULL,

    Cost_Center                    NVARCHAR(50)     NULL,

    Hourly_Rate_USD                DECIMAL(18,2)    NULL,

    Overtime_Eligible              NVARCHAR(10)     NULL,

    Safety_Training                NVARCHAR(30)     NULL,

    Electrical_Authorized          NVARCHAR(10)     NULL,

    Mechanical_Authorized          NVARCHAR(10)     NULL,

    Instrumentation_Authorized     NVARCHAR(10)     NULL,

    PLC_Experience                 NVARCHAR(10)     NULL,

    Max_Work_Hours_Day             SMALLINT         NULL,

    Preferred_Work_Order_Type      NVARCHAR(50)     NULL,

    Current_Assignment             NVARCHAR(100)    NULL,

    Supervisor                     NVARCHAR(100)    NULL,

    Emergency_Response             NVARCHAR(10)     NULL,

    Notes                          NVARCHAR(MAX)    NULL,

    CONSTRAINT PK_Employees_Master
        PRIMARY KEY(Employee_ID)
);
GO