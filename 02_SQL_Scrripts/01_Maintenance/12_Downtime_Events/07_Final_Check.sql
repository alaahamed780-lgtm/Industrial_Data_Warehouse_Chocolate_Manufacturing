USE Chocolate_Manufacturing_DW;
GO

/*============================================================
07_Final_Check_Downtime_Events.sql
============================================================*/

------------------------------------------------------------
-- 1. Stage Count
------------------------------------------------------------
SELECT COUNT(*) AS Stage_Count
FROM staging.Downtime_Events_Stage;
GO

------------------------------------------------------------
-- 2. Master Count
------------------------------------------------------------
SELECT COUNT(*) AS Master_Count
FROM master.Downtime_Events_Master;
GO

------------------------------------------------------------
-- 3. Compare Counts
------------------------------------------------------------
SELECT
    (SELECT COUNT(*) FROM staging.Downtime_Events_Stage) AS Stage_Count,
    (SELECT COUNT(*) FROM master.Downtime_Events_Master) AS Master_Count,
    (SELECT COUNT(*) FROM staging.Downtime_Events_Stage)
    -
    (SELECT COUNT(*) FROM master.Downtime_Events_Master) AS Difference;
GO

------------------------------------------------------------
-- 4. Distinct Primary Keys
------------------------------------------------------------
SELECT
    COUNT(DISTINCT Downtime_Event_ID) AS Distinct_Downtime_Events
FROM master.Downtime_Events_Master;
GO

------------------------------------------------------------
-- 5. Duplicate Primary Keys
------------------------------------------------------------
SELECT
    Downtime_Event_ID,
    COUNT(*) AS DuplicateCount
FROM master.Downtime_Events_Master
GROUP BY Downtime_Event_ID
HAVING COUNT(*) > 1;
GO

------------------------------------------------------------
-- 6. Missing Foreign Keys
------------------------------------------------------------
SELECT
    SUM(CASE WHEN Equipment_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Equipment_ID,
    SUM(CASE WHEN Work_Order_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Work_Order_ID,
    SUM(CASE WHEN Failure_Code_ID IS NULL THEN 1 ELSE 0 END) AS Missing_Failure_Code_ID
FROM master.Downtime_Events_Master;
GO

------------------------------------------------------------
-- 7. Duration Summary
------------------------------------------------------------
SELECT
    MIN(Duration_Minutes) AS Min_Duration,
    MAX(Duration_Minutes) AS Max_Duration,
    AVG(Duration_Minutes) AS Avg_Duration
FROM master.Downtime_Events_Master;
GO

------------------------------------------------------------
-- 8. Cost Summary
------------------------------------------------------------
SELECT
    SUM(Cost_Impact_USD) AS Total_Cost,
    AVG(Cost_Impact_USD) AS Avg_Cost,
    MAX(Cost_Impact_USD) AS Max_Cost
FROM master.Downtime_Events_Master;
GO

------------------------------------------------------------
-- 9. Lost Production Summary
------------------------------------------------------------
SELECT
    SUM(Lost_Production_kg) AS Total_Lost_Production,
    AVG(Lost_Production_kg) AS Avg_Lost_Production
FROM master.Downtime_Events_Master;
GO

------------------------------------------------------------
-- 10. OEE Summary
------------------------------------------------------------
SELECT
    MIN(OEE_Loss_Percent) AS Min_OEE_Loss,
    MAX(OEE_Loss_Percent) AS Max_OEE_Loss,
    AVG(OEE_Loss_Percent) AS Avg_OEE_Loss
FROM master.Downtime_Events_Master;
GO

------------------------------------------------------------
-- 11. MTTR & MTBF Summary
------------------------------------------------------------
SELECT
    AVG(MTTR_Hours) AS Avg_MTTR,
    AVG(MTBF_Hours) AS Avg_MTBF
FROM master.Downtime_Events_Master;
GO

------------------------------------------------------------
-- End of File
------------------------------------------------------------