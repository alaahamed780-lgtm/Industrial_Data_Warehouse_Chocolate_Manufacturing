# Chocolate Manufacturing Data Warehouse

## Project Overview

This project demonstrates the design and implementation of an Industrial Data Warehouse for a Chocolate Manufacturing Factory using Microsoft SQL Server.

The solution integrates data from multiple factory departments into a centralized Data Warehouse following Star Schema architecture to support business intelligence, reporting, KPI monitoring, and future Machine Learning applications.

---

# Business Objectives

- Centralize factory data into a single source of truth.
- Improve maintenance decision-making.
- Monitor production performance.
- Analyze product quality.
- Track inventory movement.
- Support management reporting.
- Build a scalable foundation for Predictive Maintenance and Machine Learning.

---

# Project Scope

The Data Warehouse covers the following business departments:

- Maintenance
- Production
- Quality
- Warehouse
- Finance
- Health, Safety & Environment (HSE)

Project includes:

- 3 Database Schemas
- 50+ Master Tables
- 50+ Staging Tables
- 5 Fact Tables
- 4 Dimension Tables
- Star Schema Data Warehouse
- Complete ETL Process
- Documentation
- Power BI Dashboards (Next Phase)

---

# Technologies Used

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- T-SQL
- Data Warehouse
- Star Schema
- Microsoft Excel
- Power BI
- Python
- Git
- GitHub

---

# Data Warehouse Architecture

## Schemas

- staging
- master
- dw

---

## Dimension Tables

- Dim_Date
- Dim_Product
- Dim_Equipment
- Dim_Employee

---

## Fact Tables

- Fact_Work_Orders
- Fact_Production
- Fact_Inventory
- Fact_Quality
- Fact_NCR

---

# ETL Workflow

1. Load CSV files into Staging tables.
2. Validate and clean data.
3. Transform data.
4. Load Master tables.
5. Populate Dimension tables.
6. Populate Fact tables.
7. Create Relationships.
8. Validate final Data Warehouse.

---

# Expected Outputs

The project is designed to support:

- Executive Dashboards
- Maintenance KPIs
- Production KPIs
- Quality KPIs
- Inventory KPIs
- Operational Reporting
- Business Intelligence
- Predictive Analytics
- Machine Learning

---

# Project Repository Structure

```
Chocolate_Manufacturing_DW
│
├── 01_Datasets
├── 02_SQL_Scripts
├── 03_Database_Diagram
├── 04_Documentation
├── 05_PowerBI
├── 06_Screenshots
├── 07_GitHub
└── 08_Machine_Learning
```

---

# Author

**Alaa Hamed**

Industrial Data Analyst

Maintenance & Reliability Engineer

Chocolate Manufacturing Data Warehouse Portfolio Project

2026