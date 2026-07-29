USE Chocolate_Manufacturing_DW;
GO

---------------------------------------------------
-- 1 Total Rows
---------------------------------------------------

SELECT COUNT(*) AS TotalRows
FROM staging.Components_Stage;

---------------------------------------------------
-- 2 Missing Component ID
---------------------------------------------------

SELECT COUNT(*) AS Missing_Component_ID
FROM staging.Components_Stage
WHERE Component_ID IS NULL
OR LTRIM(RTRIM(Component_ID))='';

---------------------------------------------------
-- 3 Duplicate Component ID
---------------------------------------------------

SELECT
Component_ID,
COUNT(*) AS DuplicateCount
FROM staging.Components_Stage
GROUP BY Component_ID
HAVING COUNT(*)>1;

---------------------------------------------------
-- 4 Missing Equipment ID
---------------------------------------------------

SELECT COUNT(*) AS Missing_Equipment_ID
FROM staging.Components_Stage
WHERE Equipment_ID IS NULL
OR LTRIM(RTRIM(Equipment_ID))='';

---------------------------------------------------
-- 5 Missing Component Name
---------------------------------------------------

SELECT COUNT(*) AS Missing_Component_Name
FROM staging.Components_Stage
WHERE Component_Name IS NULL
OR LTRIM(RTRIM(Component_Name))='';

---------------------------------------------------
-- 6 Missing Plant
---------------------------------------------------

SELECT COUNT(*) AS Missing_Plant
FROM staging.Components_Stage
WHERE Plant IS NULL
OR LTRIM(RTRIM(Plant))='';

---------------------------------------------------
-- 7 Missing Functional Location
---------------------------------------------------

SELECT COUNT(*) AS Missing_Functional_Location
FROM staging.Components_Stage
WHERE Functional_Location IS NULL
OR LTRIM(RTRIM(Functional_Location))='';

---------------------------------------------------
-- 8 Invalid Weight
---------------------------------------------------

SELECT *
FROM staging.Components_Stage
WHERE TRY_CONVERT(DECIMAL(10,2),Weight_kg) IS NULL
AND Weight_kg IS NOT NULL
AND LTRIM(RTRIM(Weight_kg))<>'';

---------------------------------------------------
-- 9 Invalid Quantity
---------------------------------------------------

SELECT *
FROM staging.Components_Stage
WHERE TRY_CONVERT(INT,Qty_Per_Equipment) IS NULL
AND Qty_Per_Equipment IS NOT NULL
AND LTRIM(RTRIM(Qty_Per_Equipment))<>'';

---------------------------------------------------
--10 Invalid Inspection Frequency
---------------------------------------------------

SELECT *
FROM staging.Components_Stage
WHERE TRY_CONVERT(INT,Inspection_Frequency_Days) IS NULL
AND Inspection_Frequency_Days IS NOT NULL
AND LTRIM(RTRIM(Inspection_Frequency_Days))<>'';

---------------------------------------------------
--11 Invalid Installation Date
---------------------------------------------------

SELECT *
FROM staging.Components_Stage
WHERE TRY_CONVERT(DATE,Installation_Date) IS NULL
AND Installation_Date IS NOT NULL
AND LTRIM(RTRIM(Installation_Date))<>'';

---------------------------------------------------
--12 Invalid Replacement Cost
---------------------------------------------------

SELECT *
FROM staging.Components_Stage
WHERE TRY_CONVERT(DECIMAL(18,2),Replacement_Cost_USD) IS NULL
AND Replacement_Cost_USD IS NOT NULL
AND LTRIM(RTRIM(Replacement_Cost_USD))<>'';

---------------------------------------------------
--13 Invalid Lead Time
---------------------------------------------------

SELECT *
FROM staging.Components_Stage
WHERE TRY_CONVERT(INT,Lead_Time_Days) IS NULL
AND Lead_Time_Days IS NOT NULL
AND LTRIM(RTRIM(Lead_Time_Days))<>'';
GO