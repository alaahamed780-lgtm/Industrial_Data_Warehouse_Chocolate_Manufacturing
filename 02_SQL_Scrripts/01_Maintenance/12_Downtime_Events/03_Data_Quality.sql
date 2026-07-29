USE Chocolate_Manufacturing_DW;
GO

/*==========================================================
1. Total Records
==========================================================*/

SELECT COUNT(*) AS TotalRows
FROM staging.Downtime_Events_Stage;
GO

/*==========================================================
2. Missing Primary Key
==========================================================*/

SELECT *
FROM staging.Downtime_Events_Stage
WHERE Downtime_Event_ID IS NULL
   OR LTRIM(RTRIM(Downtime_Event_ID)) = '';
GO

/*==========================================================
3. Duplicate Primary Key
==========================================================*/

SELECT
    Downtime_Event_ID,
    COUNT(*) AS DuplicateCount
FROM staging.Downtime_Events_Stage
GROUP BY Downtime_Event_ID
HAVING COUNT(*) > 1;
GO

/*==========================================================
4. Invalid Event Date
==========================================================*/

SELECT *
FROM staging.Downtime_Events_Stage
WHERE NULLIF(LTRIM(RTRIM(Event_Date)),'') IS NOT NULL
AND TRY_CONVERT(DATE, Event_Date) IS NULL;
GO

/*==========================================================
5. Invalid Start DateTime
==========================================================*/

SELECT *
FROM staging.Downtime_Events_Stage
WHERE NULLIF(LTRIM(RTRIM(Start_DateTime)),'') IS NOT NULL
AND TRY_CONVERT(DATETIME2, Start_DateTime) IS NULL;
GO

/*==========================================================
6. Invalid End DateTime
==========================================================*/

SELECT *
FROM staging.Downtime_Events_Stage
WHERE NULLIF(LTRIM(RTRIM(End_DateTime)),'') IS NOT NULL
AND TRY_CONVERT(DATETIME2, End_DateTime) IS NULL;
GO

/*==========================================================
7. Invalid Duration Minutes
==========================================================*/

SELECT *
FROM staging.Downtime_Events_Stage
WHERE NULLIF(LTRIM(RTRIM(Duration_Minutes)),'') IS NOT NULL
AND TRY_CONVERT(DECIMAL(10,2), Duration_Minutes) IS NULL;
GO

/*==========================================================
8. Invalid Lost Production
==========================================================*/

SELECT *
FROM staging.Downtime_Events_Stage
WHERE NULLIF(LTRIM(RTRIM(Lost_Production_kg)),'') IS NOT NULL
AND TRY_CONVERT(DECIMAL(18,2), Lost_Production_kg) IS NULL;
GO

/*==========================================================
9. Invalid OEE Loss Percent
==========================================================*/

SELECT *
FROM staging.Downtime_Events_Stage
WHERE NULLIF(LTRIM(RTRIM(OEE_Loss_Percent)),'') IS NOT NULL
AND TRY_CONVERT(DECIMAL(10,2), OEE_Loss_Percent) IS NULL;
GO
/*===========================================================
Verify Master Table Structure
===========================================================*/

SELECT
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'master'
  AND TABLE_NAME = 'Downtime_Events_Master'
ORDER BY ORDINAL_POSITION;
GO

/*===========================================================
Verify Row Count
===========================================================*/

SELECT
    COUNT(*) AS TotalRows
FROM master.Downtime_Events_Master;
GO

/*===========================================================
Verify Primary Key
===========================================================*/

SELECT
    COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'master'
  AND TABLE_NAME = 'Downtime_Events_Master';
GO

/*===========================================================
Verify Table Exists
===========================================================*/

SELECT
    TABLE_SCHEMA,
    TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'master'
  AND TABLE_NAME = 'Downtime_Events_Master';
GO

/*===========================================================
Verify Data Types
===========================================================*/

SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'master'
  AND TABLE_NAME = 'Downtime_Events_Master'
ORDER BY ORDINAL_POSITION;
GO

/*===========================================================
End of File
===========================================================*/