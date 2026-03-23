# 🏗️ Data Warehouse & Analytics Engineering Project

![SQL Server](https://img.shields.io/badge/SQL%20Server-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white)
![ETL](https://img.shields.io/badge/ETL%20Pipeline-0078D4?style=for-the-badge&logo=microsoft&logoColor=white)
![Medallion Architecture](https://img.shields.io/badge/Medallion%20Architecture-F4B942?style=for-the-badge&logo=databricks&logoColor=white)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=for-the-badge)

---

## 📌 Project Overview

This project demonstrates the end-to-end design and implementation of a **modern Data Warehouse** using **Microsoft SQL Server** and the **Medallion Architecture (Bronze → Silver → Gold)**. It consolidates data from two enterprise source systems — **CRM** and **ERP** — performs data cleansing, standardization, and transformation, and delivers business-ready analytical datasets for reporting and machine learning consumption.

> **This project showcases skills in:** Data Engineering, ETL Pipeline Development, SQL Server, Stored Procedures, Data Modelling (Star Schema), and Business Intelligence.

---

## 🎯 Objectives

- Build a **scalable, layered data warehouse** from raw source files to business-ready data
- Implement **ETL pipelines** using Stored Procedures with Bulk Insert
- Apply **data quality** improvements — cleansing, standardization, normalization
- Design a **Star Schema** dimensional model for analytical reporting
- Enable consumption via **Power BI**, **Ad-Hoc SQL Queries**, and **Machine Learning**

---

## 🏛️ Architecture

The project follows the **Medallion Architecture** — a three-layer design pattern that progressively refines raw data into trusted, business-ready datasets.

```
┌──────────────┐     ┌─────────────────────────────────────────────┐     ┌─────────────────┐
│   SOURCES    │     │              DATA WAREHOUSE                  │     │    CONSUME       │
│              │     │                                              │     │                  │
│  ┌────────┐  │     │  ┌──────────┐  ┌──────────┐  ┌──────────┐  │     │  BI & Reporting  │
│  │  CRM   │  │────▶│  │  BRONZE  │─▶│  SILVER  │─▶│   GOLD   │  │────▶│  Ad-Hoc SQL      │
│  └────────┘  │     │  │ Raw Data │  │ Cleaned  │  │ Business │  │     │  Machine Learning│
│  ┌────────┐  │     │  └──────────┘  └──────────┘  │  Ready   │  │     │                  │
│  │  ERP   │  │     │                              └──────────┘  │     │                  │
│  └────────┘  │     └─────────────────────────────────────────────┘     └─────────────────┘
└──────────────┘
```

---

## 📁 Project Structure

```
data-warehouse-project/
│
├── 📂 datasets/
│   ├── 📂 crm/
│   │   ├── cust_info.csv          # Customer information from CRM system
│   │   ├── prd_info.csv           # Product information from CRM system
│   │   └── sales_details.csv      # Sales transaction data from CRM system
│   │
│   └── 📂 erp/
│       ├── CUST_AZ12.csv          # Customer master data from ERP system
│       ├── LOC_A101.csv           # Location and geography data from ERP system
│       └── PX_CAT_G1V2.csv        # Product category mapping from ERP system
│
├── 📂 scripts/
│   ├── 📂 bronze/
│   │   ├── create_bronze_tables.sql      # DDL for raw tables
│   │   └── load_bronze.sql               # Stored procedure: Bulk Insert from CSV
│   │
│   ├── 📂 silver/
│   │   ├── create_silver_tables.sql      # DDL for cleaned tables
│   │   └── load_silver.sql               # Stored procedure: Transform & load
│   │
│   └── 📂 gold/
│       ├── create_gold_views.sql         # DDL for business views
│       └── load_gold.sql                 # Stored procedure: Integrate & aggregate
│
├── 📂 docs/
│   ├── data_architecture.png             # High-level architecture diagram
│   ├── data_catalogue.md                 # Column-level data documentation
│   └── data_flow_diagram.png             # ETL flow diagram
│
└── README.md
```

---

## 🗂️ Data Sources

### Source 1 — CRM System

| File | Description | Key Columns |
|---|---|---|
| `cust_info.csv` | Customer demographic and contact data | Customer ID, Name, Email, Phone, Segment |
| `prd_info.csv` | Product master with pricing and category | Product ID, Name, Category, Price, Launch Date |
| `sales_details.csv` | Weekly/daily transaction records | Sale ID, Customer ID, Product ID, Date, Quantity, Revenue |

### Source 2 — ERP System

| File | Description | Key Columns |
|---|---|---|
| `CUST_AZ12.csv` | Customer master data with account details | Customer Key, Account No, Region, Status |
| `LOC_A101.csv` | Location and geography reference data | Location ID, City, State, Country, Zone |
| `PX_CAT_G1V2.csv` | Product category hierarchy mapping | Category ID, Category Name, Sub-category, Department |

---

## 🔄 ETL Pipeline

### Layer 1 — Bronze (Raw Data)

> **Purpose**: Land raw source data exactly as-is into SQL Server tables

| Property | Detail |
|---|---|
| **Object Type** | Tables |
| **Load Strategy** | Full Load — Truncate & Insert |
| **Processing** | Batch Processing via Bulk Insert |
| **Transformations** | None — data stored as-is |
| **Data Model** | None (as-is) |
| **Stored Procedure** | `bronze.load_bronze` |

```sql
-- Example: Load CRM customer data into Bronze
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
    TRUNCATE TABLE bronze.crm_cust_info;
    BULK INSERT bronze.crm_cust_info
    FROM 'C:\datasets\crm\cust_info.csv'
    WITH (FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n');
END;
```

---

### Layer 2 — Silver (Cleaned & Standardized Data)

> **Purpose**: Apply data quality rules and standardize formats for reliable analytics

| Property | Detail |
|---|---|
| **Object Type** | Tables |
| **Load Strategy** | Full Load — Truncate & Insert |
| **Processing** | Batch Processing via Stored Procedures |
| **Transformations** | Data Cleansing, Standardization, Normalization, Derived Columns, Data Enrichment |
| **Data Model** | None (as-is after cleansing) |
| **Stored Procedure** | `silver.load_silver` |

**Key Transformations Applied:**

```sql
-- Data Cleansing      → Remove nulls, duplicates, invalid records
-- Data Standardization → Consistent date formats, case normalization, currency
-- Data Normalization  → Consistent units, code mappings, reference lookups
-- Derived Columns     → Age from DOB, Full Name from First+Last, Revenue = Qty × Price
-- Data Enrichment     → Join CRM + ERP customer records, location enrichment
```

---

### Layer 3 — Gold (Business-Ready Data)

> **Purpose**: Deliver trusted, analytics-ready datasets modelled for business consumption

| Property | Detail |
|---|---|
| **Object Type** | Views |
| **Load Strategy** | No Load — Views computed on-the-fly |
| **Transformations** | Data Integrations, Aggregations, Business Logic |
| **Data Model** | Star Schema, Flat Table, Aggregated Table |
| **Stored Procedure** | `gold.load_gold` |

**Dimensional Model (Star Schema):**

```
                    ┌──────────────────┐
                    │  dim_customers   │
                    │  (CRM + ERP)     │
                    └────────┬─────────┘
                             │
┌──────────────┐    ┌────────▼─────────┐    ┌──────────────────┐
│ dim_products │────│   fact_sales     │────│  dim_locations   │
│ (CRM + ERP)  │    │  (transactions)  │    │  (ERP LOC_A101)  │
└──────────────┘    └────────┬─────────┘    └──────────────────┘
                             │
                    ┌────────▼─────────┐
                    │    dim_date      │
                    │  (date spine)    │
                    └──────────────────┘
```

---

## 🗃️ Database Schema

```sql
-- Three schemas in SQL Server
CREATE SCHEMA bronze;   -- Raw data layer
CREATE SCHEMA silver;   -- Cleaned data layer
CREATE SCHEMA gold;     -- Business-ready layer
```

### Bronze Tables

| Table | Source File | Rows (approx) |
|---|---|---|
| `bronze.crm_cust_info` | crm/cust_info.csv | ~50k |
| `bronze.crm_prd_info` | crm/prd_info.csv | ~5k |
| `bronze.crm_sales_details` | crm/sales_details.csv | ~100k |
| `bronze.erp_cust_az12` | erp/CUST_AZ12.csv | ~50k |
| `bronze.erp_loc_a101` | erp/LOC_A101.csv | ~1k |
| `bronze.erp_px_cat_g1v2` | erp/PX_CAT_G1V2.csv | ~200 |

### Gold Views

| View | Description |
|---|---|
| `gold.dim_customers` | Unified customer dimension (CRM + ERP merged) |
| `gold.dim_products` | Product dimension with full category hierarchy |
| `gold.dim_locations` | Location dimension with region and country |
| `gold.dim_date` | Date spine for time intelligence |
| `gold.fact_sales` | Central fact table with all sales transactions |

---

## ⚙️ How to Run

### Prerequisites

- Microsoft SQL Server 2019+
- SQL Server Management Studio (SSMS)
- Source CSV files in `datasets/` folder

### Step 1 — Create Database & Schemas

```sql
CREATE DATABASE DataWarehouse;
GO
USE DataWarehouse;
GO
CREATE SCHEMA bronze;
CREATE SCHEMA silver;
CREATE SCHEMA gold;
```

### Step 2 — Create Tables

```sql
-- Run in order
EXEC scripts/bronze/create_bronze_tables.sql
EXEC scripts/silver/create_silver_tables.sql
EXEC scripts/gold/create_gold_views.sql
```

### Step 3 — Load Data

```sql
-- Load Bronze (raw data from CSV files)
EXEC bronze.load_bronze;

-- Load Silver (cleanse and transform)
EXEC silver.load_silver;

-- Load Gold (build business views)
EXEC gold.load_gold;
```

### Step 4 — Verify Data

```sql
-- Check row counts across all layers
SELECT 'bronze.crm_cust_info'   AS table_name, COUNT(*) AS row_count FROM bronze.crm_cust_info   UNION ALL
SELECT 'bronze.crm_prd_info'    AS table_name, COUNT(*) AS row_count FROM bronze.crm_prd_info    UNION ALL
SELECT 'bronze.crm_sales_details',              COUNT(*)               FROM bronze.crm_sales_details UNION ALL
SELECT 'gold.fact_sales'        AS table_name, COUNT(*) AS row_count FROM gold.fact_sales;
```

---

## 📊 Key Technical Skills Demonstrated

| Skill | Implementation |
|---|---|
| **SQL Server** | Database creation, schema design, table DDL |
| **ETL Pipelines** | Stored Procedures with Bulk Insert for automated loading |
| **Medallion Architecture** | Bronze → Silver → Gold three-layer design pattern |
| **Data Cleansing** | Null handling, duplicate removal, invalid record filtering |
| **Data Standardization** | Date formats, case normalization, currency, code mapping |
| **Data Integration** | Joining CRM and ERP datasets into unified dimensions |
| **Dimensional Modelling** | Star Schema — Fact + Dimension tables |
| **SQL Aggregations** | Window functions, CTEs, subqueries for business KPIs |
| **Views** | Virtual Gold layer with no physical load overhead |
| **Power BI Ready** | Gold layer structured for direct BI consumption |

---

## 📈 Consume Layer

The Gold layer is designed for three consumption patterns:

### 1. BI & Reporting (Power BI)
Connect Power BI directly to Gold views for interactive dashboards:
- Sales performance by region, product, time period
- Customer segmentation and lifetime value
- Product category analysis and trends

### 2. Ad-Hoc SQL Queries
```sql
-- Example: Top 10 customers by revenue
SELECT TOP 10
    c.customer_name,
    c.segment,
    SUM(f.revenue) AS total_revenue
FROM gold.fact_sales f
JOIN gold.dim_customers c ON f.customer_key = c.customer_key
GROUP BY c.customer_name, c.segment
ORDER BY total_revenue DESC;
```

### 3. Machine Learning
Gold layer flat tables and aggregated tables are ready for ML model training — customer churn prediction, sales forecasting, product recommendation.

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| **Microsoft SQL Server 2019+** | Database engine and ETL execution |
| **SQL Server Management Studio (SSMS)** | Development and query execution |
| **T-SQL** | Stored procedures, DDL, DML, window functions, CTEs |
| **Power BI** | Business intelligence and dashboard reporting |
| **CSV / Flat Files** | Source data format from CRM and ERP systems |

---

## 👤 Author

**Vishal**
- 📧 vishal9681032@gmail.com
- 🔗 [LinkedIn](https://linkedin.com/in/vishal-793170396)
- 🐙 [GitHub](https://github.com/givishalt)

---

## 📄 License

This project is licensed under the MIT License — feel free to use it as a reference or template for your own data engineering projects.

---

*⭐ If you found this project helpful, please give it a star on GitHub!*
