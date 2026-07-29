USE Chocolate_Manufacturing_DW;
GO

/*============================================================
01_Create_CAPA_Stage.sql
Project : Chocolate Manufacturing Data Warehouse
Module  : Quality
============================================================*/

IF OBJECT_ID('staging.CAPA_Corrective_Preventive_Actions_Stage','U') IS NOT NULL
DROP TABLE staging.CAPA_Corrective_Preventive_Actions_Stage;
GO

CREATE TABLE staging.CAPA_Corrective_Preventive_Actions_Stage
(
    CAPA_ID                      NVARCHAR(255),
    CAPA_Number                  NVARCHAR(255),
    NCR_ID                       NVARCHAR(255),
    Quality_Inspection_ID        NVARCHAR(255),

    Calendar_Date_Key            NVARCHAR(255),

    Initiation_Date              NVARCHAR(255),

    CAPA_Type                    NVARCHAR(255),

    Source                       NVARCHAR(255),

    Root_Cause                   NVARCHAR(255),

    Risk_Level                   NVARCHAR(255),

    Corrective_Action            NVARCHAR(255),

    Preventive_Action            NVARCHAR(255),

    Action_Owner_ID              NVARCHAR(255),

    Department                   NVARCHAR(255),

    Target_Completion_Date       NVARCHAR(255),

    Actual_Completion_Date       NVARCHAR(255),

    Effectiveness_Check_Date     NVARCHAR(255),

    Verification_Method          NVARCHAR(255),

    Verification_Result          NVARCHAR(255),

    Status                       NVARCHAR(255),

    Priority                     NVARCHAR(255),

    Related_Product_ID           NVARCHAR(255),

    Related_Equipment_ID         NVARCHAR(255),

    Production_Order_ID          NVARCHAR(255),

    Estimated_Cost_USD           NVARCHAR(255),

    Actual_Cost_USD              NVARCHAR(255),

    Lessons_Learned              NVARCHAR(255),

    Approved_By                  NVARCHAR(255),

    Closed_By                    NVARCHAR(255),

    Plant                        NVARCHAR(255),

    Area                         NVARCHAR(255),

    Notes                        NVARCHAR(255)
);
GO

/*============================================================
Verify Table
============================================================*/

SELECT
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='staging'
AND TABLE_NAME='CAPA_Corrective_Preventive_Actions_Stage'
ORDER BY ORDINAL_POSITION;
GO