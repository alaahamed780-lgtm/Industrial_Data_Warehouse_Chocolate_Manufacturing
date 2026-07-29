# ETL Process

## Overview

The ETL (Extract, Transform, Load) process is responsible for moving data from raw CSV files into the SQL Server Data Warehouse.

The process ensures data quality, consistency, and readiness for reporting and analytics.

---

# ETL Workflow

CSV Files

↓

Staging Tables

↓

Data Validation

↓

Data Cleaning

↓

Master Tables

↓

Dimension Tables

↓

Fact Tables

↓

Power BI

↓

Machine Learning

---

# Step 1 — Extract

Source files are received in CSV format from different factory departments.

Examples:

- Equipment Master
- Employees Master
- Products Master
- Production Orders
- Inventory Transactions
- Work Orders
- Quality Inspections
- NCR Reports

---

# Step 2 — Load to Staging

CSV files are imported into the staging schema using BULK INSERT.

Purpose:

- Temporary storage
- Raw data
- Fast loading
- Error isolation

---

# Step 3 — Data Validation

Validation includes:

- Required fields
- NULL checks
- Duplicate detection
- Data type validation
- Invalid values

---

# Step 4 — Data Cleaning

Cleaning activities include:

- Remove duplicates
- Trim spaces
- Standardize formats
- Correct invalid records
- Handle missing values

---

# Step 5 — Load Master Tables

Validated data is loaded into Master tables.

Master tables provide a clean operational data source for the Data Warehouse.

---

# Step 6 — Build Dimension Tables

Dimension tables are created from Master tables.

Dimensions:

- Dim_Date
- Dim_Product
- Dim_Equipment
- Dim_Employee

---

# Step 7 — Build Fact Tables

Fact tables store measurable business transactions.

Facts:

- Fact_Work_Orders
- Fact_Production
- Fact_Inventory
- Fact_Quality
- Fact_NCR

---

# Step 8 — Data Validation

Final validation checks include:

- Row Counts
- Primary Keys
- Foreign Keys
- NULL Checks
- Duplicate Checks
- Referential Integrity

---

# Final Output

The ETL process produces a clean, reliable, and reporting-ready SQL Server Data Warehouse optimized for:

- Power BI
- Business Intelligence
- KPI Reporting
- Predictive Maintenance
- Machine Learning