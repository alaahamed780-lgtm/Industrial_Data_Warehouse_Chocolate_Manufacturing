USE Chocolate_Manufacturing_DW;
GO

TRUNCATE TABLE dw.Dim_Employee;
GO

INSERT INTO dw.Dim_Employee
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
Electrical_Authorization,
Mechanical_Authorization,
Instrumentation_Authorization,
PLC_Experience,
Max_Work_Hours,
Preferred_Work_Area,
Current_Assignment,
Supervisor,
Emergency_Response_Team,
Notes
)

SELECT

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

TRY_CAST(Years_Experience AS SMALLINT),

TRY_CAST(Hire_Year AS SMALLINT),

Status,
Phone_Extension,
Email,
Locker_No,
Cost_Center,

TRY_CAST(Hourly_Rate_USD AS DECIMAL(18,2)),

Overtime_Eligible,
Safety_Training,

Electrical_Authorized,

Mechanical_Authorized,

Instrumentation_Authorized,

PLC_Experience,

TRY_CAST(Max_Work_Hours_Day AS SMALLINT),

Preferred_Work_Order_Type,

Current_Assignment,

Supervisor,

Emergency_Response,

Notes

FROM master.Employees_Master;
GO

PRINT 'Dim_Employee Loaded Successfully';
GO