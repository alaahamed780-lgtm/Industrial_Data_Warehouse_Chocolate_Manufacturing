USE Chocolate_Manufacturing_DW;
GO

IF OBJECT_ID('staging.Employees_Stage','U') IS NOT NULL
    DROP TABLE staging.Employees_Stage;
GO

CREATE TABLE staging.Employees_Stage
(
    Employee_ID                    NVARCHAR(255),
    Employee_Code                  NVARCHAR(255),

    First_Name                     NVARCHAR(255),
    Last_Name                      NVARCHAR(255),

    Job_Title                      NVARCHAR(255),
    Department                     NVARCHAR(255),

    Plant                          NVARCHAR(255),
    Area                           NVARCHAR(255),

    Maintenance_Team               NVARCHAR(255),
    Work_Center                    NVARCHAR(255),

    Manager_ID                     NVARCHAR(255),

    Employment_Type                NVARCHAR(255),

    Shift                          NVARCHAR(255),

    Skill_Primary                  NVARCHAR(255),
    Skill_Secondary                NVARCHAR(255),

    Certification_Level            NVARCHAR(255),

    Years_Experience               NVARCHAR(255),

    Hire_Year                      NVARCHAR(255),

    Status                         NVARCHAR(255),

    Phone_Extension                NVARCHAR(255),

    Email                          NVARCHAR(255),

    Locker_No                      NVARCHAR(255),

    Cost_Center                    NVARCHAR(255),

    Hourly_Rate_USD                NVARCHAR(255),

    Overtime_Eligible              NVARCHAR(255),

    Safety_Training                NVARCHAR(255),

    Electrical_Authorized          NVARCHAR(255),

    Mechanical_Authorized          NVARCHAR(255),

    Instrumentation_Authorized     NVARCHAR(255),

    PLC_Experience                 NVARCHAR(255),

    Max_Work_Hours_Day             NVARCHAR(255),

    Preferred_Work_Order_Type      NVARCHAR(255),

    Current_Assignment             NVARCHAR(255),

    Supervisor                     NVARCHAR(255),

    Emergency_Response             NVARCHAR(255),

    Notes                          NVARCHAR(MAX)
);
GO