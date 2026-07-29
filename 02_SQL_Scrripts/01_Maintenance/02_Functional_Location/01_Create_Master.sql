CREATE TABLE master.Functional_Location_Master
(
    Functional_Location_ID          NVARCHAR(30)      NOT NULL,
    Functional_Location_Code        NVARCHAR(50)      NOT NULL,
    Parent_Functional_Location      NVARCHAR(30)      NULL,
    [Level]                         NVARCHAR(30)      NOT NULL,

    Plant                           NVARCHAR(50)      NOT NULL,
    Building                        NVARCHAR(100)     NOT NULL,
    Area                            NVARCHAR(100)     NOT NULL,
    Production_Line                 NVARCHAR(100)     NULL,
    Zone                            NVARCHAR(100)     NULL,
    Section                         NVARCHAR(100)     NULL,

    Equipment_Group                 NVARCHAR(100)     NULL,
    Equipment_ID                    NVARCHAR(30)      NULL,

    Location_Name                   NVARCHAR(200)     NOT NULL,
    Location_Type                   NVARCHAR(100)     NULL,
    Process                         NVARCHAR(100)     NULL,

    Latitude_Zone                   DECIMAL(12,6)     NULL,
    Longitude_Zone                  DECIMAL(12,6)     NULL,

    Cost_Center                     NVARCHAR(30)      NULL,
    Department                      NVARCHAR(100)     NULL,
    Maintenance_Team                NVARCHAR(100)     NULL,

    Criticality                     NVARCHAR(30)      NULL,
    Safety_Class                    NVARCHAR(30)      NULL,
    Environment                     NVARCHAR(50)      NULL,

    Commissioning_Year              SMALLINT          NULL,

    Status                          NVARCHAR(30)      NULL,

    PLC_Area                        NVARCHAR(100)     NULL,
    DCS_Area                        NVARCHAR(100)     NULL,

    Power_Source                    NVARCHAR(50)      NULL,
    Utility_Type                    NVARCHAR(50)      NULL,

    Access_Level                    NVARCHAR(50)      NULL,

    Responsible_Manager             NVARCHAR(100)     NULL,

    Inspection_Frequency_Days       SMALLINT          NULL,

    Remarks                         NVARCHAR(MAX)     NULL,

    CONSTRAINT PK_Functional_Location
        PRIMARY KEY (Functional_Location_ID)
);
GO