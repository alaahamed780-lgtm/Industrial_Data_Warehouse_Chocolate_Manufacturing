USE Chocolate_Manufacturing_DW;
GO

/*============================================================
04_Create_CAPA_Master.sql
============================================================*/

IF OBJECT_ID('master.CAPA_Corrective_Preventive_Actions_Master','U') IS NOT NULL
    DROP TABLE master.CAPA_Corrective_Preventive_Actions_Master;
GO

CREATE TABLE master.CAPA_Corrective_Preventive_Actions_Master
(
    CAPA_ID                    NVARCHAR(30) NOT NULL,
    CAPA_Number                NVARCHAR(30),

    NCR_ID                     NVARCHAR(30),
    Quality_Inspection_ID      NVARCHAR(30),

    Calendar_Date_Key          INT,

    Initiation_Date            DATE,

    CAPA_Type                  NVARCHAR(50),

    Source                     NVARCHAR(100),

    Root_Cause                 NVARCHAR(500),

    Risk_Level                 NVARCHAR(30),

    Corrective_Action          NVARCHAR(500),

    Preventive_Action          NVARCHAR(500),

    Action_Owner_ID            NVARCHAR(30),

    Department                 NVARCHAR(100),

    Target_Completion_Date     DATE,

    Actual_Completion_Date     DATE,

    Effectiveness_Check_Date   DATE,

    Verification_Method        NVARCHAR(100),

    Verification_Result        NVARCHAR(100),

    Status                     NVARCHAR(50),

    Priority                   NVARCHAR(30),

    Related_Product_ID         NVARCHAR(30),

    Related_Equipment_ID       NVARCHAR(30),

    Production_Order_ID        NVARCHAR(30),

    Estimated_Cost_USD         DECIMAL(18,2),

    Actual_Cost_USD            DECIMAL(18,2),

    Lessons_Learned            NVARCHAR(1000),

    Approved_By                NVARCHAR(30),

    Closed_By                  NVARCHAR(30),

    Plant                      NVARCHAR(50),

    Area                       NVARCHAR(100),

    Notes                      NVARCHAR(500),

    Load_Date                  DATETIME2
        CONSTRAINT DF_CAPA_LoadDate DEFAULT(GETDATE()),

    CONSTRAINT PK_CAPA_Master
        PRIMARY KEY (CAPA_ID)
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
AND TABLE_NAME='CAPA_Corrective_Preventive_Actions_Master'
ORDER BY ORDINAL_POSITION;
GO