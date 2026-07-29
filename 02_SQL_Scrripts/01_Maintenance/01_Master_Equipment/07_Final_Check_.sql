USE Chocolate_Manufacturing_DW;
GO

/*============================================================
 File Name : 09_Check_Equipment_Master.sql
 Purpose   : Verify Equipment_Master Data
=============================================================*/


/*============================================================
Check 01 : Total Rows
Expected Result : 100000
=============================================================*/

SELECT COUNT(*) AS Total_Rows
FROM master.Equipment_Master;
GO


/*============================================================
Check 02 : Preview First 10 Records
=============================================================*/

SELECT TOP (10) *
FROM master.Equipment_Master;
GO


/*============================================================
Check 03 : Check Data Types
=============================================================*/

SELECT
    SQL_VARIANT_PROPERTY(Power_kW,'BaseType')             AS Power_kW,
    SQL_VARIANT_PROPERTY(Purchase_Cost_USD,'BaseType')    AS Purchase_Cost,
    SQL_VARIANT_PROPERTY(Commissioning_Date,'BaseType')   AS Commissioning_Date,
    SQL_VARIANT_PROPERTY(MTTR_Hours,'BaseType')           AS MTTR
FROM master.Equipment_Master;
GO