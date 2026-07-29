USE Chocolate_Manufacturing_DW;
GO

DROP TABLE IF EXISTS master.Spare_Parts_Master;
GO

CREATE TABLE master.Spare_Parts_Master
(
    Spare_Part_ID           NVARCHAR(30)      NOT NULL,
    Part_Number             NVARCHAR(100)     NOT NULL,
    Part_Name               NVARCHAR(200)     NOT NULL,
    Category                NVARCHAR(100)     NULL,

    Component_ID            NVARCHAR(30)      NULL,
    Equipment_ID            NVARCHAR(30)      NULL,

    Manufacturer            NVARCHAR(100)     NULL,
    Vendor_Code             NVARCHAR(50)      NULL,

    Unit                    NVARCHAR(30)      NULL,

    Critical_Spare          NVARCHAR(10)      NULL,
    ABC_Class               NVARCHAR(10)      NULL,

    Min_Stock               SMALLINT          NULL,
    Max_Stock               SMALLINT          NULL,
    Reorder_Point           SMALLINT          NULL,
    Current_Stock           SMALLINT          NULL,

    Lead_Time_Days          SMALLINT          NULL,

    Unit_Cost_USD           DECIMAL(18,2)     NULL,

    Warehouse               NVARCHAR(100)     NULL,
    Bin_Location            NVARCHAR(100)     NULL,

    Status                  NVARCHAR(30)      NULL,

    Plant                   NVARCHAR(50)      NULL,
    Area                    NVARCHAR(100)     NULL,

    Notes                   NVARCHAR(MAX)     NULL,

    CONSTRAINT PK_Spare_Parts_Master
        PRIMARY KEY (Spare_Part_ID)
);
GO