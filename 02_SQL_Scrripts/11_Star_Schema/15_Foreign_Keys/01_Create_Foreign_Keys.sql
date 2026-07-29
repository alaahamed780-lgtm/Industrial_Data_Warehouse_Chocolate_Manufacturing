USE Chocolate_Manufacturing_DW;
GO

PRINT '=========================================';
PRINT 'Creating Foreign Keys';
PRINT '=========================================';
GO

/*==========================================================
  Fact_Work_Orders
==========================================================*/

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_FactWorkOrders_DimDate')
ALTER TABLE dw.Fact_Work_Orders
ADD CONSTRAINT FK_FactWorkOrders_DimDate
FOREIGN KEY (Date_Key)
REFERENCES dw.Dim_Date(Date_Key);
GO

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_FactWorkOrders_DimEquipment')
ALTER TABLE dw.Fact_Work_Orders
ADD CONSTRAINT FK_FactWorkOrders_DimEquipment
FOREIGN KEY (Equipment_Key)
REFERENCES dw.Dim_Equipment(Equipment_Key);
GO

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_FactWorkOrders_DimEmployee')
ALTER TABLE dw.Fact_Work_Orders
ADD CONSTRAINT FK_FactWorkOrders_DimEmployee
FOREIGN KEY (Employee_Key)
REFERENCES dw.Dim_Employee(Employee_Key);
GO

/*==========================================================
  Fact_Production
==========================================================*/

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_FactProduction_DimDate')
ALTER TABLE dw.Fact_Production
ADD CONSTRAINT FK_FactProduction_DimDate
FOREIGN KEY (Date_Key)
REFERENCES dw.Dim_Date(Date_Key);
GO

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_FactProduction_DimProduct')
ALTER TABLE dw.Fact_Production
ADD CONSTRAINT FK_FactProduction_DimProduct
FOREIGN KEY (Product_Key)
REFERENCES dw.Dim_Product(Product_Key);
GO

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_FactProduction_DimEquipment')
ALTER TABLE dw.Fact_Production
ADD CONSTRAINT FK_FactProduction_DimEquipment
FOREIGN KEY (Equipment_Key)
REFERENCES dw.Dim_Equipment(Equipment_Key);
GO

/*==========================================================
  Fact_Inventory
==========================================================*/

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_FactInventory_DimDate')
ALTER TABLE dw.Fact_Inventory
ADD CONSTRAINT FK_FactInventory_DimDate
FOREIGN KEY (Date_Key)
REFERENCES dw.Dim_Date(Date_Key);
GO

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_FactInventory_DimProduct')
ALTER TABLE dw.Fact_Inventory
ADD CONSTRAINT FK_FactInventory_DimProduct
FOREIGN KEY (Product_Key)
REFERENCES dw.Dim_Product(Product_Key);
GO

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_FactInventory_DimEmployee')
ALTER TABLE dw.Fact_Inventory
ADD CONSTRAINT FK_FactInventory_DimEmployee
FOREIGN KEY (Employee_Key)
REFERENCES dw.Dim_Employee(Employee_Key);
GO

/*==========================================================
  Fact_Quality
==========================================================*/

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_FactQuality_DimDate')
ALTER TABLE dw.Fact_Quality
ADD CONSTRAINT FK_FactQuality_DimDate
FOREIGN KEY (Date_Key)
REFERENCES dw.Dim_Date(Date_Key);
GO

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_FactQuality_DimProduct')
ALTER TABLE dw.Fact_Quality
ADD CONSTRAINT FK_FactQuality_DimProduct
FOREIGN KEY (Product_Key)
REFERENCES dw.Dim_Product(Product_Key);
GO

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_FactQuality_DimEquipment')
ALTER TABLE dw.Fact_Quality
ADD CONSTRAINT FK_FactQuality_DimEquipment
FOREIGN KEY (Equipment_Key)
REFERENCES dw.Dim_Equipment(Equipment_Key);
GO

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_FactQuality_DimEmployee')
ALTER TABLE dw.Fact_Quality
ADD CONSTRAINT FK_FactQuality_DimEmployee
FOREIGN KEY (Employee_Key)
REFERENCES dw.Dim_Employee(Employee_Key);
GO

/*==========================================================
  Fact_NCR
==========================================================*/

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_FactNCR_DimDate')
ALTER TABLE dw.Fact_NCR
ADD CONSTRAINT FK_FactNCR_DimDate
FOREIGN KEY (Date_Key)
REFERENCES dw.Dim_Date(Date_Key);
GO

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_FactNCR_DimProduct')
ALTER TABLE dw.Fact_NCR
ADD CONSTRAINT FK_FactNCR_DimProduct
FOREIGN KEY (Product_Key)
REFERENCES dw.Dim_Product(Product_Key);
GO

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_FactNCR_DimEquipment')
ALTER TABLE dw.Fact_NCR
ADD CONSTRAINT FK_FactNCR_DimEquipment
FOREIGN KEY (Equipment_Key)
REFERENCES dw.Dim_Equipment(Equipment_Key);
GO

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_FactNCR_DimEmployee')
ALTER TABLE dw.Fact_NCR
ADD CONSTRAINT FK_FactNCR_DimEmployee
FOREIGN KEY (Employee_Key)
REFERENCES dw.Dim_Employee(Employee_Key);
GO

PRINT '=========================================';
PRINT 'All Foreign Keys Created Successfully';
PRINT '=========================================';
GO