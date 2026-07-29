# Database Architecture

## Overview

The Chocolate Manufacturing Data Warehouse is designed using a layered architecture that separates raw operational data from business-ready analytical data.

This architecture improves scalability, maintainability, and reporting performance.

---

# Database Schemas

The database contains three schemas:

## 1. staging

Purpose:

Temporary storage for raw CSV files before validation and transformation.

Characteristics:

- Raw imported data
- No business rules
- Supports ETL process
- One table for each source file

---

## 2. master

Purpose:

Stores validated and cleaned operational master data.

Characteristics:

- Clean business data
- Source for ETL transformations
- Supports historical consistency
- One master table for each business entity

---

## 3. dw

Purpose:

Analytical Data Warehouse following Star Schema architecture.

Characteristics:

- Optimized for reporting
- Fact and Dimension tables
- Power BI ready
- Business Intelligence layer

---

# Database Layers

CSV Files

↓

Staging Tables

↓

Master Tables

↓

Dimension Tables

↓

Fact Tables

↓

Power BI Dashboards

↓

Machine Learning

---

# Star Schema

Dimension Tables

- Dim_Date
- Dim_Product
- Dim_Equipment
- Dim_Employee

Fact Tables

- Fact_Work_Orders
- Fact_Production
- Fact_Inventory
- Fact_Quality
- Fact_NCR

---

# Relationships

The Fact tables are connected to Dimension tables using Foreign Keys.

This design provides:

- High query performance
- Easy reporting
- Scalable architecture
- Simple Power BI model

---

# Database Summary

Schemas : 3

Dimension Tables : 4

Fact Tables : 5

Master Tables : 50+

Staging Tables : 50+

Architecture : Star Schema

Database Platform : Microsoft SQL Server