USE Chocolate_Manufacturing_DW;
GO

---------------------------------------------------------
-- 1 Missing Failure_Code_ID
---------------------------------------------------------
SELECT COUNT(*) AS Missing_Failure_Code_ID
FROM staging.Failure_Codes_Stage
WHERE Failure_Code_ID IS NULL
OR LTRIM(RTRIM(Failure_Code_ID))='';

---------------------------------------------------------
-- 2 Duplicate Failure_Code_ID
---------------------------------------------------------
SELECT
    Failure_Code_ID,
    COUNT(*) AS DuplicateCount
FROM staging.Failure_Codes_Stage
GROUP BY Failure_Code_ID
HAVING COUNT(*)>1;

---------------------------------------------------------
-- 3 Missing Failure_Code
---------------------------------------------------------
SELECT COUNT(*) AS Missing_Failure_Code
FROM staging.Failure_Codes_Stage
WHERE Failure_Code IS NULL
OR LTRIM(RTRIM(Failure_Code))='';

---------------------------------------------------------
-- 4 Missing Failure_Group
---------------------------------------------------------
SELECT COUNT(*) AS Missing_Failure_Group
FROM staging.Failure_Codes_Stage
WHERE Failure_Group IS NULL
OR LTRIM(RTRIM(Failure_Group))='';

---------------------------------------------------------
-- 5 Missing Failure_Mode
---------------------------------------------------------
SELECT COUNT(*) AS Missing_Failure_Mode
FROM staging.Failure_Codes_Stage
WHERE Failure_Mode IS NULL
OR LTRIM(RTRIM(Failure_Mode))='';

---------------------------------------------------------
-- 6 Invalid Probability
---------------------------------------------------------
SELECT *
FROM staging.Failure_Codes_Stage
WHERE TRY_CONVERT(SMALLINT,Probability) IS NULL
AND Probability IS NOT NULL
AND LTRIM(RTRIM(Probability))<>'';

---------------------------------------------------------
-- 7 Invalid Risk_Priority
---------------------------------------------------------
SELECT *
FROM staging.Failure_Codes_Stage
WHERE TRY_CONVERT(SMALLINT,Risk_Priority) IS NULL
AND Risk_Priority IS NOT NULL
AND LTRIM(RTRIM(Risk_Priority))<>'';

---------------------------------------------------------
-- 8 Invalid Estimated Downtime
---------------------------------------------------------
SELECT *
FROM staging.Failure_Codes_Stage
WHERE TRY_CONVERT(DECIMAL(10,2),Estimated_Downtime_Hours) IS NULL
AND Estimated_Downtime_Hours IS NOT NULL
AND LTRIM(RTRIM(Estimated_Downtime_Hours))<>'';

---------------------------------------------------------
-- 9 Invalid Estimated Repair
---------------------------------------------------------
SELECT *
FROM staging.Failure_Codes_Stage
WHERE TRY_CONVERT(DECIMAL(10,2),Estimated_Repair_Hours) IS NULL
AND Estimated_Repair_Hours IS NOT NULL
AND LTRIM(RTRIM(Estimated_Repair_Hours))<>'';

---------------------------------------------------------
--10 Invalid Created Year
---------------------------------------------------------
SELECT *
FROM staging.Failure_Codes_Stage
WHERE TRY_CONVERT(SMALLINT,Created_Year) IS NULL
AND Created_Year IS NOT NULL
AND LTRIM(RTRIM(Created_Year))<>'';
GO