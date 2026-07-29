USE Chocolate_Manufacturing_DW;
GO

---------------------------------------------------
-- عدد السجلات
---------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM staging.Maintenance_Plans_Stage;
GO

---------------------------------------------------
-- القيم الفارغة فى المفتاح الرئيسى
---------------------------------------------------
SELECT *
FROM staging.Maintenance_Plans_Stage
WHERE Failure_Code_ID IS NULL
   OR LTRIM(RTRIM(Failure_Code_ID))='';
GO

---------------------------------------------------
-- القيم المكررة
---------------------------------------------------
SELECT Failure_Code_ID,
       COUNT(*) AS DuplicateCount
FROM staging.Maintenance_Plans_Stage
GROUP BY Failure_Code_ID
HAVING COUNT(*)>1;
GO

---------------------------------------------------
-- Probability غير صالح
---------------------------------------------------
SELECT *
FROM staging.Maintenance_Plans_Stage
WHERE TRY_CONVERT(SMALLINT,Probability) IS NULL
AND Probability IS NOT NULL
AND LTRIM(RTRIM(Probability))<>'';
GO

---------------------------------------------------
-- Risk Priority غير صالح
---------------------------------------------------
SELECT *
FROM staging.Maintenance_Plans_Stage
WHERE TRY_CONVERT(SMALLINT,Risk_Priority) IS NULL
AND Risk_Priority IS NOT NULL
AND LTRIM(RTRIM(Risk_Priority))<>'';
GO

---------------------------------------------------
-- Downtime غير صالح
---------------------------------------------------
SELECT *
FROM staging.Maintenance_Plans_Stage
WHERE TRY_CONVERT(DECIMAL(10,2),Estimated_Downtime_Hours) IS NULL
AND Estimated_Downtime_Hours IS NOT NULL
AND LTRIM(RTRIM(Estimated_Downtime_Hours))<>'';
GO

---------------------------------------------------
-- Repair Hours غير صالح
---------------------------------------------------
SELECT *
FROM staging.Maintenance_Plans_Stage
WHERE TRY_CONVERT(DECIMAL(10,2),Estimated_Repair_Hours) IS NULL
AND Estimated_Repair_Hours IS NOT NULL
AND LTRIM(RTRIM(Estimated_Repair_Hours))<>'';
GO

---------------------------------------------------
-- السنة غير صالحة
---------------------------------------------------
SELECT *
FROM staging.Maintenance_Plans_Stage
WHERE TRY_CONVERT(SMALLINT,Created_Year) IS NULL
AND Created_Year IS NOT NULL
AND LTRIM(RTRIM(Created_Year))<>'';
GO