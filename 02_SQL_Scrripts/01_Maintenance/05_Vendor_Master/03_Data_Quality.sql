USE Chocolate_Manufacturing_DW;
GO

--==========================================================
-- 1 Total Rows
--==========================================================
SELECT COUNT(*) AS TotalRows
FROM staging.Vendor_Stage;
GO

--==========================================================
-- 2 Missing Vendor_ID
--==========================================================
SELECT COUNT(*) AS Missing_Vendor_ID
FROM staging.Vendor_Stage
WHERE Vendor_ID IS NULL
OR LTRIM(RTRIM(Vendor_ID))='';
GO

--==========================================================
-- 3 Duplicate Vendor_ID
--==========================================================
SELECT Vendor_ID,COUNT(*) DuplicateCount
FROM staging.Vendor_Stage
GROUP BY Vendor_ID
HAVING COUNT(*)>1;
GO

--==========================================================
-- 4 Missing Vendor Name
--==========================================================
SELECT COUNT(*) Missing_Vendor_Name
FROM staging.Vendor_Stage
WHERE Vendor_Name IS NULL
OR LTRIM(RTRIM(Vendor_Name))='';
GO

--==========================================================
-- 5 Missing Country
--==========================================================
SELECT COUNT(*) Missing_Country
FROM staging.Vendor_Stage
WHERE Country IS NULL
OR LTRIM(RTRIM(Country))='';
GO

--==========================================================
-- 6 Missing City
--==========================================================
SELECT COUNT(*) Missing_City
FROM staging.Vendor_Stage
WHERE City IS NULL
OR LTRIM(RTRIM(City))='';
GO

--==========================================================
-- 7 Missing Status
--==========================================================
SELECT COUNT(*) Missing_Status
FROM staging.Vendor_Stage
WHERE Status IS NULL
OR LTRIM(RTRIM(Status))='';
GO

--==========================================================
-- 8 Invalid Lead Time
--==========================================================
SELECT *
FROM staging.Vendor_Stage
WHERE TRY_CONVERT(SMALLINT,Lead_Time_Days) IS NULL
AND Lead_Time_Days IS NOT NULL
AND LTRIM(RTRIM(Lead_Time_Days))<>'';
GO

--==========================================================
-- 9 Invalid On Time Delivery
--==========================================================
SELECT *
FROM staging.Vendor_Stage
WHERE TRY_CONVERT(DECIMAL(5,2),On_Time_Delivery_Percent) IS NULL
AND On_Time_Delivery_Percent IS NOT NULL
AND LTRIM(RTRIM(On_Time_Delivery_Percent))<>'';
GO

--==========================================================
--10 Invalid Quality Rating
--==========================================================
SELECT *
FROM staging.Vendor_Stage
WHERE TRY_CONVERT(DECIMAL(5,2),Quality_Rating) IS NULL
AND Quality_Rating IS NOT NULL
AND LTRIM(RTRIM(Quality_Rating))<>'';
GO

--==========================================================
--11 Invalid Vendor Rating
--==========================================================
SELECT *
FROM staging.Vendor_Stage
WHERE TRY_CONVERT(DECIMAL(5,2),Vendor_Rating) IS NULL
AND Vendor_Rating IS NOT NULL
AND LTRIM(RTRIM(Vendor_Rating))<>'';
GO

--==========================================================
--12 Invalid Approved Date
--==========================================================
SELECT *
FROM staging.Vendor_Stage
WHERE TRY_CONVERT(DATE,Approved_Date) IS NULL
AND Approved_Date IS NOT NULL
AND LTRIM(RTRIM(Approved_Date))<>'';
GO

--==========================================================
--13 Invalid Contract End Year
--==========================================================
SELECT *
FROM staging.Vendor_Stage
WHERE TRY_CONVERT(SMALLINT,Contract_End_Year) IS NULL
AND Contract_End_Year IS NOT NULL
AND LTRIM(RTRIM(Contract_End_Year))<>'';
GO

--==========================================================
--14 Invalid MOQ
--==========================================================
SELECT *
FROM staging.Vendor_Stage
WHERE TRY_CONVERT(SMALLINT,MOQ) IS NULL
AND MOQ IS NOT NULL
AND LTRIM(RTRIM(MOQ))<>'';
GO

--==========================================================
--15 Invalid Annual Spend
--==========================================================
SELECT *
FROM staging.Vendor_Stage
WHERE TRY_CONVERT(DECIMAL(18,2),Annual_Spend_USD) IS NULL
AND Annual_Spend_USD IS NOT NULL
AND LTRIM(RTRIM(Annual_Spend_USD))<>'';
GO