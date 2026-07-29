USE Chocolate_Manufacturing_DW;
GO

---------------------------------------------------
-- 1. عدد السجلات
---------------------------------------------------
SELECT COUNT(*) AS TotalRows
FROM staging.Maintenance_Plans_Stage;
GO

---------------------------------------------------
-- 2. عرض أول 20 سجل
---------------------------------------------------
SELECT TOP (20) *
FROM staging.Maintenance_Plans_Stage;
GO

---------------------------------------------------
-- 3. آخر 20 سجل
---------------------------------------------------
SELECT TOP (20) *
FROM staging.Maintenance_Plans_Stage
ORDER BY Failure_Code_ID DESC;
GO