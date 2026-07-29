USE Chocolate_Manufacturing_DW;
GO

/*============================================================
Create Master Table : Inventory_Transactions_Master
============================================================*/

IF OBJECT_ID('master.Inventory_Transactions_Master','U') IS NOT NULL
DROP TABLE master.Inventory_Transactions_Master;
GO

CREATE TABLE master.Inventory_Transactions_Master
(
    Inventory_Transaction_ID NVARCHAR(20) NOT NULL,
    Transaction_No           NVARCHAR(30),
    Transaction_Type         NVARCHAR(50),
    Movement_Type            INT,
    Calendar_Date_Key        INT,
    Transaction_Date         DATE,
    Transaction_DateTime     DATETIME2,

    Spare_Part_ID            NVARCHAR(20),
    Material_ID              NVARCHAR(20),
    Product_ID               NVARCHAR(20),

    Warehouse               NVARCHAR(20),
    Bin_Location            NVARCHAR(30),
    Batch_No                NVARCHAR(30),
    Lot_No                  NVARCHAR(30),

    Reference_Document      NVARCHAR(50),
    Reference_Type          NVARCHAR(30),
    Work_Order_ID           NVARCHAR(20),
    Production_Order_ID     NVARCHAR(20),
    Vendor_ID               NVARCHAR(20),

    Quantity                DECIMAL(18,2),
    UOM                     NVARCHAR(10),

    Unit_Cost_USD           DECIMAL(18,2),
    Extended_Cost_USD       DECIMAL(18,2),

    Stock_Before            DECIMAL(18,2),
    Stock_After             DECIMAL(18,2),

    Employee_ID             NVARCHAR(20),
    Approval_Status         NVARCHAR(30),
    Reason_Code             NVARCHAR(30),

    Plant                   NVARCHAR(20),
    Area                    NVARCHAR(50),
    Status                  NVARCHAR(30),
    Notes                   NVARCHAR(255),

    Load_Date               DATETIME2 DEFAULT GETDATE(),

    CONSTRAINT PK_Inventory_Transactions_Master
    PRIMARY KEY (Inventory_Transaction_ID)
);
GO