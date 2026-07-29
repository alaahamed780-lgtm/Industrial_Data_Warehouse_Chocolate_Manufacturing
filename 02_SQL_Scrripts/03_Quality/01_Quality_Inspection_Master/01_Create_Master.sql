USE Chocolate_Manufacturing_DW;
GO

/*============================================================
04_Create_Quality_Inspection_Master.sql
============================================================*/

IF OBJECT_ID('master.Quality_Inspection_Master','U') IS NOT NULL
    DROP TABLE master.Quality_Inspection_Master;
GO

CREATE TABLE master.Quality_Inspection_Master
(
    Quality_Inspection_ID       NVARCHAR(50) NOT NULL,
    Inspection_No               NVARCHAR(50),

    Calendar_Date_Key           INT,

    Inspection_Date             DATE,
    Inspection_DateTime         DATETIME2,

    Inspection_Type             NVARCHAR(50),

    Production_Order_ID         NVARCHAR(50),
    Production_Transaction_ID   NVARCHAR(50),

    Product_ID                  NVARCHAR(50),

    Batch_No                    NVARCHAR(50),
    Lot_No                      NVARCHAR(50),

    Material_ID                 NVARCHAR(50),

    Equipment_ID                NVARCHAR(50),

    Inspector_ID                NVARCHAR(50),

    Sampling_Plan               NVARCHAR(100),

    Sample_Size                 INT,

    Parameter                   NVARCHAR(100),

    Target_Value                DECIMAL(18,4),

    Measured_Value              DECIMAL(18,4),

    Lower_Limit                 DECIMAL(18,4),

    Upper_Limit                 DECIMAL(18,4),

    Result                      NVARCHAR(30),

    Defect_Category             NVARCHAR(100),

    Defect_Code                 NVARCHAR(50),

    Corrective_Action           NVARCHAR(255),

    Disposition                 NVARCHAR(100),

    Quality_Status              NVARCHAR(50),

    Warehouse                   NVARCHAR(50),

    Plant                       NVARCHAR(50),

    Area                        NVARCHAR(100),

    Production_Line             NVARCHAR(100),

    Notes                       NVARCHAR(500),

    Load_Date                   DATETIME2
        CONSTRAINT DF_QI_LoadDate
        DEFAULT(GETDATE()),

    CONSTRAINT PK_Quality_Inspection_Master
        PRIMARY KEY (Quality_Inspection_ID)
);
GO

/*============================================================
Verify Table
============================================================*/

SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='master'
AND TABLE_NAME='Quality_Inspection_Master'
ORDER BY ORDINAL_POSITION;
GO