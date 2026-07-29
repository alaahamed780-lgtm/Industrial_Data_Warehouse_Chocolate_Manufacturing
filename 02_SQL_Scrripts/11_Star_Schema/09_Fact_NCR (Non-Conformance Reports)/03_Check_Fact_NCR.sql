USE Chocolate_Manufacturing_DW;
GO

-- ==========================================
-- Total Rows
-- ==========================================
SELECT COUNT(*) AS TotalRows
FROM dw.Fact_NCR;
GO

-- ==========================================
-- Duplicate NCR_ID
-- ==========================================
SELECT
    NCR_ID,
    COUNT(*) AS DuplicateCount
FROM dw.Fact_NCR
GROUP BY NCR_ID
HAVING COUNT(*) > 1;
GO

-- ==========================================
-- Missing Date Key
-- ==========================================
SELECT COUNT(*) AS Missing_Date_Key
FROM dw.Fact_NCR
WHERE Date_Key = -1;
GO

-- ==========================================
-- Missing Product Key
-- ==========================================
SELECT COUNT(*) AS Missing_Product_Key
FROM dw.Fact_NCR
WHERE Product_Key = -1;
GO

-- ==========================================
-- Missing Equipment Key
-- ==========================================
SELECT COUNT(*) AS Missing_Equipment_Key
FROM dw.Fact_NCR
WHERE Equipment_Key = -1;
GO

-- ==========================================
-- Missing Employee Key
-- ==========================================
SELECT COUNT(*) AS Missing_Employee_Key
FROM dw.Fact_NCR
WHERE Employee_Key = -1;
GO

-- ==========================================
-- Summary Statistics
-- ==========================================
SELECT
    COUNT(*) AS Total_NCRs,
    SUM(Estimated_Cost_USD) AS Total_Estimated_Cost,
    AVG(Estimated_Cost_USD) AS Avg_Estimated_Cost
FROM dw.Fact_NCR;
GO

PRINT 'Fact_NCR Check Completed Successfully';
GO