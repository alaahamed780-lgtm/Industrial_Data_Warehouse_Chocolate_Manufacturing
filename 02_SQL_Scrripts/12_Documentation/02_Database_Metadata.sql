USE Chocolate_Manufacturing_DW;
GO

PRINT '==============================================';
PRINT 'DATABASE METADATA REPORT';
PRINT '==============================================';
PRINT '';

--------------------------------------------------
-- Database Information
--------------------------------------------------

SELECT
    DB_NAME() AS Database_Name,
    @@SERVERNAME AS Server_Name,
    @@VERSION AS SQL_Server_Version,
    GETDATE() AS Report_Date;

    --------------------------------------------------
-- Database Statistics
--------------------------------------------------

SELECT
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES
     WHERE TABLE_SCHEMA='dw') AS Total_Tables,

    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES
     WHERE TABLE_SCHEMA='dw'
     AND TABLE_NAME LIKE 'Dim_%') AS Dimension_Tables,

    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES
     WHERE TABLE_SCHEMA='dw'
     AND TABLE_NAME LIKE 'Fact_%') AS Fact_Tables,

    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.VIEWS
     WHERE TABLE_SCHEMA='dw') AS Total_Views,

    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
     WHERE TABLE_SCHEMA='dw') AS Total_Columns;
GO
--------------------------------------------------
-- Primary Keys & Foreign Keys Statistics
--------------------------------------------------

SELECT
    (SELECT COUNT(*)
     FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
     WHERE CONSTRAINT_TYPE = 'PRIMARY KEY'
       AND TABLE_SCHEMA = 'dw') AS Primary_Keys,

    (SELECT COUNT(*)
     FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
     WHERE CONSTRAINT_TYPE = 'FOREIGN KEY'
       AND TABLE_SCHEMA = 'dw') AS Foreign_Keys;
GO
--------------------------------------------------
-- Table Row Counts
--------------------------------------------------

SELECT
    t.name AS Table_Name,
    SUM(p.rows) AS Row_Count
FROM sys.tables t
JOIN sys.partitions p
    ON t.object_id = p.object_id
WHERE
    p.index_id IN (0,1)
    AND SCHEMA_NAME(t.schema_id)='dw'
GROUP BY t.name
ORDER BY t.name;
GO
--------------------------------------------------
-- Database Objects Summary
--------------------------------------------------

SELECT
    'Tables' AS Object_Type,
    COUNT(*) AS Total
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA='dw'

UNION ALL

SELECT
    'Views',
    COUNT(*)
FROM INFORMATION_SCHEMA.VIEWS
WHERE TABLE_SCHEMA='dw'

UNION ALL

SELECT
    'Stored Procedures',
    COUNT(*)
FROM INFORMATION_SCHEMA.ROUTINES
WHERE ROUTINE_TYPE='PROCEDURE'

UNION ALL

SELECT
    'Functions',
    COUNT(*)
FROM INFORMATION_SCHEMA.ROUTINES
WHERE ROUTINE_TYPE='FUNCTION';
GO
PRINT '=============================================';
PRINT 'DATABASE DOCUMENTATION GENERATED SUCCESSFULLY';
PRINT '=============================================';
GO