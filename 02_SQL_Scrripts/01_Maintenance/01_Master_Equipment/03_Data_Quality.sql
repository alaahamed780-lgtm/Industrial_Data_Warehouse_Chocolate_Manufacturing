USE Chocolate_Manufacturing_DW;
GO

/*============================================================
  File Name : 07_Data_Quality_Check_Equipment.sql
  Purpose   : Data Quality Checks for Equipment Stage Table
  Table     : staging.Equipment_Master_Stage
=============================================================*/


/*============================================================
Check 01 : Total Rows
Expected Result : 100000
=============================================================*/

SELECT COUNT(*) AS Total_Rows
FROM staging.Equipment_Master_Stage;
GO


/*============================================================
Check 02 : Empty Equipment_ID
Expected Result : 0
=============================================================*/

SELECT COUNT(*) AS Empty_Equipment_ID
FROM staging.Equipment_Master_Stage
WHERE Equipment_ID IS NULL
   OR LTRIM(RTRIM(Equipment_ID)) = '';
GO


/*============================================================
Check 03 : Duplicate Equipment_ID
Expected Result : No Rows
=============================================================*/

SELECT
    Equipment_ID,
    COUNT(*) AS Duplicate_Count
FROM staging.Equipment_Master_Stage
GROUP BY Equipment_ID
HAVING COUNT(*) > 1;
GO


/*============================================================
Check 04 : Empty Equipment_Name
Expected Result : 0
=============================================================*/

SELECT COUNT(*) AS Empty_Equipment_Name
FROM staging.Equipment_Master_Stage
WHERE Equipment_Name IS NULL
   OR LTRIM(RTRIM(Equipment_Name)) = '';
GO


/*============================================================
Check 05 : Empty Functional_Location
Expected Result : 0
=============================================================*/

SELECT COUNT(*) AS Empty_Functional_Location
FROM staging.Equipment_Master_Stage
WHERE Functional_Location IS NULL
   OR LTRIM(RTRIM(Functional_Location)) = '';
GO


/*============================================================
Check 06 : Empty Manufacturer
Expected Result : 0
=============================================================*/

SELECT COUNT(*) AS Empty_Manufacturer
FROM staging.Equipment_Master_Stage
WHERE Manufacturer IS NULL
   OR LTRIM(RTRIM(Manufacturer)) = '';
GO


/*============================================================
Check 07 : Empty Model
Expected Result : 0
=============================================================*/

SELECT COUNT(*) AS Empty_Model
FROM staging.Equipment_Master_Stage
WHERE Model IS NULL
   OR LTRIM(RTRIM(Model)) = '';
GO


/*============================================================
Check 08 : Invalid Commissioning_Date
Expected Result : 0
=============================================================*/

SELECT COUNT(*) AS Invalid_Commissioning_Date
FROM staging.Equipment_Master_Stage
WHERE TRY_CONVERT(DATE, Commissioning_Date) IS NULL
      AND Commissioning_Date IS NOT NULL
      AND LTRIM(RTRIM(Commissioning_Date)) <> '';
GO


/*============================================================
Check 09 : Invalid Purchase Cost
Expected Result : 0
=============================================================*/

SELECT COUNT(*) AS Invalid_Purchase_Cost
FROM staging.Equipment_Master_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Purchase_Cost_USD) IS NULL
      AND Purchase_Cost_USD IS NOT NULL
      AND LTRIM(RTRIM(Purchase_Cost_USD)) <> '';
GO


/*============================================================
Check 10 : Invalid Replacement Cost
Expected Result : 0
=============================================================*/

SELECT COUNT(*) AS Invalid_Replacement_Cost
FROM staging.Equipment_Master_Stage
WHERE TRY_CONVERT(DECIMAL(18,2), Replacement_Cost_USD) IS NULL
      AND Replacement_Cost_USD IS NOT NULL
      AND LTRIM(RTRIM(Replacement_Cost_USD)) <> '';
GO


/*============================================================
Check 11 : Invalid MTBF
Expected Result : 0
=============================================================*/

SELECT COUNT(*) AS Invalid_MTBF
FROM staging.Equipment_Master_Stage
WHERE TRY_CONVERT(INT, MTBF_Hours) IS NULL
      AND MTBF_Hours IS NOT NULL
      AND LTRIM(RTRIM(MTBF_Hours)) <> '';
GO


/*============================================================
Check 12 : Invalid MTTR
Expected Result : 0
=============================================================*/

SELECT COUNT(*) AS Invalid_MTTR
FROM staging.Equipment_Master_Stage
WHERE TRY_CONVERT(DECIMAL(6,2), MTTR_Hours) IS NULL
      AND MTTR_Hours IS NOT NULL
      AND LTRIM(RTRIM(MTTR_Hours)) <> '';
GO


/*============================================================
Check 13 : Empty Criticality
Expected Result : 0
=============================================================*/

SELECT COUNT(*) AS Empty_Criticality
FROM staging.Equipment_Master_Stage
WHERE Criticality IS NULL
   OR LTRIM(RTRIM(Criticality)) = '';
GO


/*============================================================
Check 14 : Empty Risk_Class
Expected Result : 0
=============================================================*/

SELECT COUNT(*) AS Empty_Risk_Class
FROM staging.Equipment_Master_Stage
WHERE Risk_Class IS NULL
   OR LTRIM(RTRIM(Risk_Class)) = '';
GO


/*============================================================
Check 15 : Empty Status
Expected Result : 0
=============================================================*/

SELECT COUNT(*) AS Empty_Status
FROM staging.Equipment_Master_Stage
WHERE Status IS NULL
   OR LTRIM(RTRIM(Status)) = '';
GO