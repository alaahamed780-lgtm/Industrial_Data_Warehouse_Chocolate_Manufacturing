USE Chocolate_Manufacturing_DW;
GO

PRINT '==============================================';
PRINT ' Laboratory_Test_Results Verification';
PRINT '==============================================';

SELECT
'Stage Count' AS Check_Name,
COUNT(*) AS Result
FROM staging.Laboratory_Test_Results_Stage

UNION ALL

SELECT
'Master Count',
COUNT(*)
FROM master.Laboratory_Test_Results_Master;
GO


SELECT
COUNT(DISTINCT Lab_Test_Result_ID) AS Distinct_Results
FROM master.Laboratory_Test_Results_Master;
GO


SELECT

MIN(Test_Date) AS First_Test,

MAX(Test_Date) AS Last_Test,

MIN(Test_DateTime) AS First_DateTime,

MAX(Test_DateTime) AS Last_DateTime

FROM master.Laboratory_Test_Results_Master;
GO


SELECT

MIN(Target_Value) AS Min_Target,
MAX(Target_Value) AS Max_Target,
AVG(Target_Value) AS Avg_Target,

MIN(Measured_Value) AS Min_Measured,
MAX(Measured_Value) AS Max_Measured,
AVG(Measured_Value) AS Avg_Measured

FROM master.Laboratory_Test_Results_Master;
GO


SELECT TOP (20) *

FROM master.Laboratory_Test_Results_Master

ORDER BY Lab_Test_Result_ID;
GO