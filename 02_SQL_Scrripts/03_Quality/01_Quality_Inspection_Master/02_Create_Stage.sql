USE Chocolate_Manufacturing_DW;
GO

/******************************************************************************
 Project : Chocolate Manufacturing Data Warehouse
 Module  : Quality
 Table   : Quality_Inspection_Stage
 Purpose : Create Stage Table
******************************************************************************/

--===========================================================
-- Create Stage Schema
--===========================================================

IF NOT EXISTS (
    SELECT *
    FROM sys.schemas
    WHERE name = 'staging'
)
BEGIN
    EXEC('CREATE SCHEMA staging');
END;
GO

--===========================================================
-- Drop Table If Exists
--===========================================================

IF OBJECT_ID('staging.Quality_Inspection_Stage','U') IS NOT NULL
DROP TABLE staging.Quality_Inspection_Stage;
GO

--===========================================================
-- Create Stage Table
--===========================================================

CREATE TABLE staging.Quality_Inspection_Stage
(
    Quality_Inspection_ID        NVARCHAR(255),
    Inspection_No               NVARCHAR(255),
    Calendar_Date_Key           NVARCHAR(255),
    Inspection_Date             NVARCHAR(255),
    Inspection_DateTime         NVARCHAR(255),
    Inspection_Type             NVARCHAR(255),
    Production_Order_ID         NVARCHAR(255),
    Production_Transaction_ID   NVARCHAR(255),
    Product_ID                  NVARCHAR(255),
    Batch_No                    NVARCHAR(255),
    Lot_No                      NVARCHAR(255),
    Material_ID                 NVARCHAR(255),
    Equipment_ID                NVARCHAR(255),
    Inspector_ID                NVARCHAR(255),
    Sampling_Plan               NVARCHAR(255),
    Sample_Size                 NVARCHAR(255),
    Parameter                   NVARCHAR(255),
    Target_Value                NVARCHAR(255),
    Measured_Value              NVARCHAR(255),
    Lower_Limit                 NVARCHAR(255),
    Upper_Limit                 NVARCHAR(255),
    Result                      NVARCHAR(255),
    Defect_Category             NVARCHAR(255),
    Defect_Code                 NVARCHAR(255),
    Corrective_Action           NVARCHAR(255),
    Disposition                 NVARCHAR(255),
    Quality_Status              NVARCHAR(255),
    Warehouse                   NVARCHAR(255),
    Plant                       NVARCHAR(255),
    Area                        NVARCHAR(255),
    Production_Line             NVARCHAR(255),
    Notes                       NVARCHAR(255)
);
GO

--===========================================================
-- Verify Stage Table
--===========================================================

SELECT
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='staging'
AND TABLE_NAME='Quality_Inspection_Stage'
ORDER BY ORDINAL_POSITION;
GO