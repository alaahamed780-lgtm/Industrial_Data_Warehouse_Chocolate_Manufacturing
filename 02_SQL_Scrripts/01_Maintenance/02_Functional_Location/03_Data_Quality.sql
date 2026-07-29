USE Chocolate_Manufacturing_DW;
GO

---------------------------------------------------
-- 1 Total Rows
---------------------------------------------------

SELECT COUNT(*) AS TotalRows
FROM staging.Functional_Location_Stage;

---------------------------------------------------
-- 2 Missing Functional Location ID
---------------------------------------------------

SELECT COUNT(*) AS Missing_Functional_Location_ID
FROM staging.Functional_Location_Stage
WHERE Functional_Location_ID IS NULL
OR LTRIM(RTRIM(Functional_Location_ID))='';

---------------------------------------------------
-- 3 Duplicate Functional Location ID
---------------------------------------------------

SELECT
Functional_Location_ID,
COUNT(*) AS DuplicateCount
FROM staging.Functional_Location_Stage
GROUP BY Functional_Location_ID
HAVING COUNT(*)>1;

---------------------------------------------------
-- 4 Missing Plant
---------------------------------------------------

SELECT COUNT(*) AS Missing_Plant
FROM staging.Functional_Location_Stage
WHERE Plant IS NULL
OR LTRIM(RTRIM(Plant))='';

---------------------------------------------------
-- 5 Missing Building
---------------------------------------------------

SELECT COUNT(*) AS Missing_Building
FROM staging.Functional_Location_Stage
WHERE Building IS NULL
OR LTRIM(RTRIM(Building))='';

---------------------------------------------------
-- 6 Missing Area
---------------------------------------------------

SELECT COUNT(*) AS Missing_Area
FROM staging.Functional_Location_Stage
WHERE Area IS NULL
OR LTRIM(RTRIM(Area))='';

---------------------------------------------------
-- 7 Missing Location Name
---------------------------------------------------

SELECT COUNT(*) AS Missing_Location_Name
FROM staging.Functional_Location_Stage
WHERE Location_Name IS NULL
OR LTRIM(RTRIM(Location_Name))='';

---------------------------------------------------
-- 8 Missing Status
---------------------------------------------------

SELECT COUNT(*) AS Missing_Status
FROM staging.Functional_Location_Stage
WHERE Status IS NULL
OR LTRIM(RTRIM(Status))='';

---------------------------------------------------
-- 9 Invalid Commissioning Year
---------------------------------------------------

SELECT *
FROM staging.Functional_Location_Stage
WHERE TRY_CONVERT(SMALLINT,Commissioning_Year) IS NULL
AND Commissioning_Year IS NOT NULL
AND LTRIM(RTRIM(Commissioning_Year))<> '';

---------------------------------------------------
--10 Invalid Inspection Frequency
---------------------------------------------------

SELECT *
FROM staging.Functional_Location_Stage
WHERE TRY_CONVERT(INT,Inspection_Frequency_Days) IS NULL
AND Inspection_Frequency_Days IS NOT NULL
AND LTRIM(RTRIM(Inspection_Frequency_Days))<> '';