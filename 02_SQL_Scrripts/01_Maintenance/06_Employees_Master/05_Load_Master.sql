USE Chocolate_Manufacturing_DW;
GO

TRUNCATE TABLE master.Employees_Master;
GO

INSERT INTO master.Employees_Master
(
    Employee_ID,
    Employee_Code,
    First_Name,
    Last_Name,
    Job_Title,
    Department,
    Plant,
    Area,
    Maintenance_Team,
    Work_Center,
    Manager_ID,
    Employment_Type,
    Shift,
    Skill_Primary,
    Skill_Secondary,
    Certification_Level,
    Years_Experience,
    Hire_Year,
    Status,
    Phone_Extension,
    Email,
    Locker_No,
    Cost_Center,
    Hourly_Rate_USD,
    Overtime_Eligible,
    Safety_Training,
    Electrical_Authorized,
    Mechanical_Authorized,
    Instrumentation_Authorized,
    PLC_Experience,
    Max_Work_Hours_Day,
    Preferred_Work_Order_Type,
    Current_Assignment,
    Supervisor,
    Emergency_Response,
    Notes
)

SELECT

NULLIF(LTRIM(RTRIM(Employee_ID)),''),

NULLIF(LTRIM(RTRIM(Employee_Code)),''),

NULLIF(LTRIM(RTRIM(First_Name)),''),

NULLIF(LTRIM(RTRIM(Last_Name)),''),

NULLIF(LTRIM(RTRIM(Job_Title)),''),

NULLIF(LTRIM(RTRIM(Department)),''),

NULLIF(LTRIM(RTRIM(Plant)),''),

NULLIF(LTRIM(RTRIM(Area)),''),

NULLIF(LTRIM(RTRIM(Maintenance_Team)),''),

NULLIF(LTRIM(RTRIM(Work_Center)),''),

NULLIF(LTRIM(RTRIM(Manager_ID)),''),

NULLIF(LTRIM(RTRIM(Employment_Type)),''),

NULLIF(LTRIM(RTRIM(Shift)),''),

NULLIF(LTRIM(RTRIM(Skill_Primary)),''),

NULLIF(LTRIM(RTRIM(Skill_Secondary)),''),

NULLIF(LTRIM(RTRIM(Certification_Level)),''),

TRY_CONVERT(SMALLINT,Years_Experience),

TRY_CONVERT(SMALLINT,Hire_Year),

NULLIF(LTRIM(RTRIM(Status)),''),

NULLIF(LTRIM(RTRIM(Phone_Extension)),''),

NULLIF(LTRIM(RTRIM(Email)),''),

NULLIF(LTRIM(RTRIM(Locker_No)),''),

NULLIF(LTRIM(RTRIM(Cost_Center)),''),

TRY_CONVERT(DECIMAL(18,2),Hourly_Rate_USD),

NULLIF(LTRIM(RTRIM(Overtime_Eligible)),''),

NULLIF(LTRIM(RTRIM(Safety_Training)),''),

NULLIF(LTRIM(RTRIM(Electrical_Authorized)),''),

NULLIF(LTRIM(RTRIM(Mechanical_Authorized)),''),

NULLIF(LTRIM(RTRIM(Instrumentation_Authorized)),''),

NULLIF(LTRIM(RTRIM(PLC_Experience)),''),

TRY_CONVERT(SMALLINT,Max_Work_Hours_Day),

NULLIF(LTRIM(RTRIM(Preferred_Work_Order_Type)),''),

NULLIF(LTRIM(RTRIM(Current_Assignment)),''),

NULLIF(LTRIM(RTRIM(Supervisor)),''),

NULLIF(LTRIM(RTRIM(Emergency_Response)),''),

NULLIF(LTRIM(RTRIM(Notes)),'')

FROM staging.Employees_Stage;
GO