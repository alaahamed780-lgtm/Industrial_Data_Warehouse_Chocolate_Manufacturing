USE Chocolate_Manufacturing_DW;
GO

--------------------------------------------------
-- Total Rows
--------------------------------------------------

SELECT COUNT(*) AS TotalRows
FROM staging.Spare_Parts_Stage;
GO

--------------------------------------------------
-- Missing Spare_Part_ID
--------------------------------------------------

SELECT COUNT(*) AS Missing_Spare_Part_ID
FROM staging.Spare_Parts_Stage
WHERE Spare_Part_ID IS NULL
OR LTRIM(RTRIM(Spare_Part_ID))='';
GO

--------------------------------------------------
-- Duplicate Spare_Part_ID
--------------------------------------------------

SELECT Spare_Part_ID,
COUNT(*) DuplicateCount
FROM staging.Spare_Parts_Stage
GROUP BY Spare_Part_ID
HAVING COUNT(*)>1;
GO

--------------------------------------------------
-- Missing Part Name
--------------------------------------------------

SELECT COUNT(*) AS Missing_Part_Name
FROM staging.Spare_Parts_Stage
WHERE Part_Name IS NULL
OR LTRIM(RTRIM(Part_Name))='';
GO

--------------------------------------------------
-- Missing Equipment
--------------------------------------------------

SELECT COUNT(*) AS Missing_Equipment
FROM staging.Spare_Parts_Stage
WHERE Equipment_ID IS NULL
OR LTRIM(RTRIM(Equipment_ID))='';
GO

--------------------------------------------------
-- Missing Component
--------------------------------------------------

SELECT COUNT(*) AS Missing_Component
FROM staging.Spare_Parts_Stage
WHERE Component_ID IS NULL
OR LTRIM(RTRIM(Component_ID))='';
GO

--------------------------------------------------
-- Invalid Min Stock
--------------------------------------------------

SELECT *
FROM staging.Spare_Parts_Stage
WHERE TRY_CONVERT(SMALLINT,Min_Stock) IS NULL
AND Min_Stock IS NOT NULL
AND LTRIM(RTRIM(Min_Stock))<>'';
GO

--------------------------------------------------
-- Invalid Max Stock
--------------------------------------------------

SELECT *
FROM staging.Spare_Parts_Stage
WHERE TRY_CONVERT(SMALLINT,Max_Stock) IS NULL
AND Max_Stock IS NOT NULL
AND LTRIM(RTRIM(Max_Stock))<>'';
GO

--------------------------------------------------
-- Invalid Reorder Point
--------------------------------------------------

SELECT *
FROM staging.Spare_Parts_Stage
WHERE TRY_CONVERT(SMALLINT,Reorder_Point) IS NULL
AND Reorder_Point IS NOT NULL
AND LTRIM(RTRIM(Reorder_Point))<>'';
GO

--------------------------------------------------
-- Invalid Current Stock
--------------------------------------------------

SELECT *
FROM staging.Spare_Parts_Stage
WHERE TRY_CONVERT(SMALLINT,Current_Stock) IS NULL
AND Current_Stock IS NOT NULL
AND LTRIM(RTRIM(Current_Stock))<>'';
GO

--------------------------------------------------
-- Invalid Lead Time
--------------------------------------------------

SELECT *
FROM staging.Spare_Parts_Stage
WHERE TRY_CONVERT(SMALLINT,Lead_Time_Days) IS NULL
AND Lead_Time_Days IS NOT NULL
AND LTRIM(RTRIM(Lead_Time_Days))<>'';
GO

--------------------------------------------------
-- Invalid Unit Cost
--------------------------------------------------

SELECT *
FROM staging.Spare_Parts_Stage
WHERE TRY_CONVERT(DECIMAL(18,2),Unit_Cost_USD) IS NULL
AND Unit_Cost_USD IS NOT NULL
AND LTRIM(RTRIM(Unit_Cost_USD))<>'';
GO