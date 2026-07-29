USE Chocolate_Manufacturing_DW;
GO

/*============================================================
06_Check_Downtime_Events.sql
============================================================*/

------------------------------------------------------------
-- 1. Total Records
------------------------------------------------------------
SELECT
    COUNT(*) AS TotalRows
FROM master.Downtime_Events_Master;
GO

------------------------------------------------------------
-- 2. Preview Data
------------------------------------------------------------
SELECT TOP (20) *
FROM master.Downtime_Events_Master
ORDER BY Downtime_Event_ID;
GO

------------------------------------------------------------
-- 3. Missing Primary Key
------------------------------------------------------------
SELECT
    COUNT(*) AS Missing_Downtime_Event_ID
FROM master.Downtime_Events_Master
WHERE Downtime_Event_ID IS NULL;
GO

------------------------------------------------------------
-- 4. Duplicate Primary Key
------------------------------------------------------------
SELECT
    Downtime_Event_ID,
    COUNT(*) AS DuplicateCount
FROM master.Downtime_Events_Master
GROUP BY Downtime_Event_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 5. Missing Foreign Keys
------------------------------------------------------------
SELECT
    SUM(CASE WHEN Equipment_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Equipment_ID,
    SUM(CASE WHEN Work_Order_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Work_Order_ID,
    SUM(CASE WHEN Failure_Code_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Failure_Code_ID
FROM master.Downtime_Events_Master;
GO

------------------------------------------------------------
-- 6. Date Validation
------------------------------------------------------------
SELECT
    COUNT(*) AS Invalid_Dates
FROM master.Downtime_Events_Master
WHERE End_DateTime < Start_DateTime;
GO

------------------------------------------------------------
-- 7. Duration Validation
------------------------------------------------------------
SELECT
    COUNT(*) AS Invalid_Duration
FROM master.Downtime_Events_Master
WHERE Duration_Minutes < 0;
GO

------------------------------------------------------------
-- 8. Cost Validation
------------------------------------------------------------
SELECT
    COUNT(*) AS Negative_Cost
FROM master.Downtime_Events_Master
WHERE Cost_Impact_USD < 0;
GO

------------------------------------------------------------
-- 9. Lost Production Validation
------------------------------------------------------------
SELECT
    COUNT(*) AS Negative_Lost_Production
FROM master.Downtime_Events_Master
WHERE Lost_Production_kg < 0;
GO

------------------------------------------------------------
-- 10. OEE Validation
------------------------------------------------------------
SELECT
    COUNT(*) AS Invalid_OEE
FROM master.Downtime_Events_Master
WHERE OEE_Loss_Percent < 0
   OR OEE_Loss_Percent > 100;
GO

------------------------------------------------------------
-- 11. MTTR Validation
------------------------------------------------------------
SELECT
    COUNT(*) AS Invalid_MTTR
FROM master.Downtime_Events_Master
WHERE MTTR_Hours < 0;
GO

------------------------------------------------------------
-- 12. MTBF Validation
------------------------------------------------------------
SELECT
    COUNT(*) AS Invalid_MTBF
FROM master.Downtime_Events_Master
WHERE MTBF_Hours < 0;
GO

------------------------------------------------------------
-- End of File
------------------------------------------------------------