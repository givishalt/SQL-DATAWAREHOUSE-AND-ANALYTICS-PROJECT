# Data Warehouse & Analytics Project 🚀

A comprehensive data warehousing and analytics solution — from raw ingestion through transformation to business-ready insights — built on Medallion Architecture using SQL Server.

![SQL Server](https://img.shields.io/badge/SQL%20Server-CC2927?style=flat&logo=microsoftsqlserver&logoColor=white)
![ETL](https://img.shields.io/badge/ETL%20Pipeline-0078D4?style=flat)
![Star Schema](https://img.shields.io/badge/Star%20Schema-FFD166?style=flat)
![Medallion](https://img.shields.io/badge/Medallion%20Architecture-7B61FF?style=flat)

---

## 🏗️ Data Architecture

The project follows a **Medallion Architecture** with three progressive layers:

| Layer | Name | Description |
|-------|------|-------------|
| 🥉 | **Bronze** | Stores raw data as-is from source systems. Data is ingested from CSV files into SQL Server with no transformations applied. |
| 🥈 | **Silver** | Applies data cleansing, standardization, and normalization to prepare reliable data for analysis. |
| 🥇 | **Gold** | Houses business-ready data modeled into a star schema, optimized for reporting and analytical queries. |

---

## 📖 Project Overview

This project involves four core areas of modern data warehouse development:

1. **Data Architecture** — Designing a Modern Data Warehouse using Medallion Architecture (Bronze, Silver, Gold layers).
2. **ETL Pipelines** — Extracting, transforming, and loading data from source systems into the warehouse.
3. **Data Modeling** — Developing fact and dimension tables optimized for analytical queries.
4. **Analytics & Reporting** — Creating SQL-based reports and dashboards for actionable insights.

---

## 📋 Project Requirements

### 🔧 Data Engineering — Building the Data Warehouse

**Objective:** Develop a modern data warehouse using SQL Server to consolidate sales data, enabling analytical reporting and informed decision-making.

**Specifications:**

| # | Requirement | Details |
|---|-------------|---------|
| 1 | **Data Sources** | Import data from two source systems (ERP and CRM) provided as CSV files. |
| 2 | **Data Quality** | Cleanse and resolve data quality issues prior to analysis. |
| 3 | **Integration** | Combine both sources into a single, user-friendly data model designed for analytical queries. |
| 4 | **Scope** | Focus on the latest dataset only — historization of data is not required. |
| 5 | **Documentation** | Provide clear documentation of the data model for both business stakeholders and analytics teams. |

---

### 📊 BI: Analytics & Reporting — Data Analysis

**Objective:** Develop SQL-based analytics to deliver detailed insights into:

- 👥 **Customer Behavior** — Purchasing patterns, segmentation, retention, and lifetime value.
- 📦 **Product Performance** — Revenue contribution, top-selling SKUs, and category-level profitability.
- 📈 **Sales Trends** — Period-over-period growth, seasonal patterns, and regional performance.

These insights empower stakeholders with key business metrics, enabling strategic decision-making.

> For more details, refer to [`docs/requirements.md`](docs/requirements.md).

---

## 📂 Repository Structure

```
data-warehouse-project/
│
├── datasets/                           # Raw datasets used for the project (ERP and CRM data)
│
├── docs/                               # Project documentation and architecture details
│   ├── etl.drawio                      # Draw.io file showing ETL techniques and methods
│   ├── data_architecture.drawio        # Draw.io file showing the project's architecture
│   ├── data_catalog.md                 # Catalog of datasets, including field descriptions and metadata
│   ├── data_flow.drawio                # Draw.io file for the data flow diagram
│   ├── data_models.drawio              # Draw.io file for data models (star schema)
│   └── naming-conventions.md          # Consistent naming guidelines for tables, columns, and files
│
├── scripts/                            # SQL scripts for ETL and transformations
│   ├── bronze/                         # Scripts for extracting and loading raw data
│   ├── silver/                         # Scripts for cleaning and transforming data
│   └── gold/                           # Scripts for creating analytical models
│
├── tests/                              # Test scripts and quality check files
│
└── README.md
```

---

## 🎯 Skills Demonstrated

This repository is an excellent resource for professionals and students looking to showcase expertise in:

- 🛠️ **SQL Development**
- 🏛️ **Data Architecture**
- ⚙️ **Data Engineering**
- 🔄 **ETL Pipeline Development**
- 🗂️ **Data Modeling**
- 📊 **Data Analytics**
