USE Chocolate_Manufacturing_DW;
GO

SELECT COUNT(*) AS TotalRows
FROM master.Employees_Master;
GO

SELECT TOP (20) *
FROM master.Employees_Master;
GO

SELECT

SQL_VARIANT_PROPERTY(Years_Experience,'BaseType') AS YearsExperience_Type,

SQL_VARIANT_PROPERTY(Hire_Year,'BaseType') AS HireYear_Type,

SQL_VARIANT_PROPERTY(Hourly_Rate_USD,'BaseType') AS HourlyRate_Type,

SQL_VARIANT_PROPERTY(Max_Work_Hours_Day,'BaseType') AS MaxWorkHours_Type

FROM master.Employees_Master;
GO