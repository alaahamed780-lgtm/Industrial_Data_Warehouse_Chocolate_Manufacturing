USE Chocolate_Manufacturing_DW;
GO

DROP TABLE IF EXISTS master.Components_Master;
GO

CREATE TABLE master.Components_Master
(
    Component_ID                    NVARCHAR(30)      NOT NULL,
    Equipment_ID                    NVARCHAR(30)      NOT NULL,
    Parent_Component_ID             NVARCHAR(30)      NULL,

    Assembly_Code                   NVARCHAR(50)      NULL,
    Subsystem                       NVARCHAR(100)     NULL,

    Component_Name                  NVARCHAR(200)     NOT NULL,
    Component_Type                  NVARCHAR(100)     NULL,
    Category                        NVARCHAR(100)     NULL,

    Manufacturer                    NVARCHAR(100)     NULL,
    Model                           NVARCHAR(100)     NULL,

    Part_Number                     NVARCHAR(100)     NULL,
    Serial_Number                   NVARCHAR(100)     NULL,

    Material                        NVARCHAR(100)     NULL,
    Dimensions                      NVARCHAR(100)     NULL,

    Weight_kg                       DECIMAL(10,2)     NULL,

    Qty_Per_Equipment               SMALLINT          NULL,

    Unit                            NVARCHAR(30)      NULL,

    Criticality                     NVARCHAR(30)      NULL,
    Risk_Class                      NVARCHAR(30)      NULL,

    Failure_Mode                    NVARCHAR(200)     NULL,
    Failure_Cause                   NVARCHAR(200)     NULL,

    Maintenance_Strategy            NVARCHAR(100)     NULL,

    Inspection_Frequency_Days       SMALLINT          NULL,

    Lubrication_Required            NVARCHAR(10)      NULL,
    Calibration_Required            NVARCHAR(10)      NULL,

    Installation_Date               DATE              NULL,

    Expected_Life_Years             SMALLINT          NULL,
    Current_Age_Years               SMALLINT          NULL,

    Replacement_Cost_USD            DECIMAL(18,2)     NULL,

    Lead_Time_Days                  SMALLINT          NULL,

    Vendor_Code                     NVARCHAR(50)      NULL,

    Spare_Part_Code                 NVARCHAR(50)      NULL,

    Warehouse_Location              NVARCHAR(100)     NULL,
    Bin_Location                    NVARCHAR(100)     NULL,

    Drawing_Number                  NVARCHAR(100)     NULL,
    Revision                        NVARCHAR(50)      NULL,

    Status                          NVARCHAR(30)      NULL,
    Condition                       NVARCHAR(50)      NULL,

    PLC_Tag                         NVARCHAR(100)     NULL,
    Sensor_Tag                      NVARCHAR(100)     NULL,

    Asset_Group                     NVARCHAR(100)     NULL,

    Cost_Center                     NVARCHAR(50)      NULL,

    Maintenance_Team                NVARCHAR(100)     NULL,

    Plant                           NVARCHAR(50)      NULL,
    Area                            NVARCHAR(100)     NULL,
    Production_Line                 NVARCHAR(100)     NULL,

    Functional_Location             NVARCHAR(50)      NULL,

    Notes                           NVARCHAR(MAX)     NULL,

    CONSTRAINT PK_Components_Master
        PRIMARY KEY(Component_ID)
);
GO