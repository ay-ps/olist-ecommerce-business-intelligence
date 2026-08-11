# Olist E-Commerce Business Intelligence

![Python](https://img.shields.io/badge/Python-Data%20Analysis-blue)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Database-blue)
![SQL](https://img.shields.io/badge/SQL-Business%20Analysis-orange)
![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-yellow)
![GitHub](https://img.shields.io/badge/GitHub-Portfolio-black)

An end-to-end **Business Intelligence and Data Analytics project** analyzing the Olist Brazilian E-Commerce dataset using **Python, PostgreSQL, SQL, and Power BI**.

The project follows a structured analytics workflow, starting from data preparation and profiling, continuing through exploratory data analysis and SQL-based business analysis, and ending with an interactive Power BI dashboard and business recommendations.

---

## Table of Contents

- [Project Overview](#project-overview)
- [Business Context](#business-context)
- [Project Objectives](#project-objectives)
- [Business Questions](#business-questions)
- [Dataset](#dataset)
- [Data Model](#data-model)
- [Project Workflow](#project-workflow)
- [1. Data Cleaning](#1-data-cleaning)
- [2. Data Profiling](#2-data-profiling)
- [3. Exploratory Data Analysis](#3-exploratory-data-analysis)
- [4. PostgreSQL Database](#4-postgresql-database)
- [5. SQL Business Analysis](#5-sql-business-analysis)
- [6. Power BI Dashboard](#6-power-bi-dashboard)
- [7. Business Insights](#7-business-insights)
- [8. Business Recommendations](#8-business-recommendations)
- [Tools and Technologies](#tools-and-technologies)
- [Key Skills Demonstrated](#key-skills-demonstrated)
- [Project Outcome](#project-outcome)

---

## Project Overview

This project analyzes transactional data from **Olist**, a Brazilian e-commerce marketplace, to understand different aspects of business performance.

Rather than treating the dataset as a simple exploratory data analysis exercise, this project was designed as an **end-to-end Business Intelligence workflow**.

The analysis combines:
- Data cleaning
- Data profiling
- Exploratory data analysis
- Relational database management
- SQL business analysis
- Data visualization
- Business intelligence dashboard development
- Business insight generation
- Business recommendations

The final output is an interactive **Power BI dashboard** supported by Python-based data preparation and PostgreSQL/SQL analysis.

---

## Business Context

E-commerce businesses generate large volumes of transactional data covering customers, orders, products, payments, sellers, delivery, and customer reviews.

However, raw transactional data does not directly answer business questions. Business stakeholders need analytical information such as:
- How is sales performance changing?
- Which products or categories generate the most revenue?
- Where are customers located?
- How efficiently are orders being delivered?
- How satisfied are customers?
- Which areas of the business require attention?

This project uses the Olist dataset to transform transactional data into structured business information that can support decision-making.

---

## Project Objectives

The main objectives of this project are to:
1. Prepare and validate the Olist datasets for analysis.
2. Understand the structure and quality of the available data.
3. Explore customer, product, order, payment, delivery, and review patterns.
4. Build a relational database using PostgreSQL.
5. Perform business-oriented analysis using SQL.
6. Develop an interactive Power BI dashboard.
7. Identify meaningful business insights from the analysis.
8. Translate analytical findings into practical business recommendations.
9. Demonstrate an end-to-end Data Analyst / Business Intelligence workflow.

---

## Business Questions

The project focuses on the following business questions.

### Sales & Business Performance
1. How does sales performance change over time?
2. How does order volume change over time?
3. What is the overall relationship between orders, customers, and revenue?
4. What are the key business performance indicators?

### Product Performance
5. Which product categories contribute the most to sales?
6. Which product categories generate the highest order volume?
7. Are sales concentrated in a relatively small number of categories?

### Customer Analysis
8. Where are customers geographically concentrated?
9. Which states have the highest customer activity?
10. How is customer activity distributed across geographic areas?

### Delivery Performance
11. How long does it take for orders to reach customers?
12. How does actual delivery performance compare with estimated delivery dates?
13. How frequently do delivery delays occur?

### Customer Experience
14. What is the distribution of customer review scores?
15. How does customer satisfaction vary across the business?
16. What operational factors may be associated with customer experience?

### Payment Behavior
17. What payment methods are most frequently used?
18. How are payment values distributed across orders?
19. What payment patterns can be observed from the transaction data?

---

## Dataset

This project uses the **Olist Brazilian E-Commerce Public Dataset**. The main datasets used in this project include:

| Dataset | Description |
|---|---|
| `customers` | Customer information and geographic identifiers |
| `orders` | Order lifecycle and timestamps |
| `order_items` | Products, sellers, prices, and freight associated with orders |
| `products` | Product attributes and physical characteristics |
| `product_category_name` | Product category translation |
| `translations` | Portuguese-to-English product category names |
| `payments` | Payment methods, installments, and payment values |
| `reviews` | Customer review scores and comments |
| `sellers` | Seller information and location |
| `geolocation` | Geographic coordinates and location information |

> **Note:** The original Olist dataset is **not included in this repository** because the raw dataset is externally sourced and may contain large CSV files.

---

## Data Model

The project uses the relational relationships between the Olist datasets to connect different business entities. The simplified analytical structure is:

```text
                         ┌──────────────┐
                         │  Customers   │
                         └──────┬───────┘
                                │
                                │ customer_id
                                ↓
                         ┌──────────────┐
                         │    Orders    │
                         └──────┬───────┘
                                │
                    ┌───────────┼────────────┐
                    │           │            │
                    ↓           ↓            ↓
              ┌──────────┐ ┌──────────┐ ┌──────────┐
              │ Payments │ │ Reviews  │ │OrderItems│
              └──────────┘ └──────────┘ └────┬─────┘
                                             │
                              ┌──────────────┼──────────────┐
                              │              │              │
                              ↓              ↓              ↓
                         ┌─────────┐   ┌──────────┐   ┌─────────┐
                         │Products │   │ Sellers  │   │Category │
                         └─────────┘   └──────────┘   └─────────┘

*Additional geographic information is available through the geolocation dataset.*

---

## Project Workflow

The project follows an end-to-end analytics workflow:

```text
Raw Data → Python → Data Cleaning → Profiling → EDA → PostgreSQL → SQL Analysis → Power BI → Dashboard → Insights → Recommendations
```

---

## 1. Data Cleaning
The first stage focuses on preparing the raw datasets for analysis using Python and Pandas.
- Checked dataset dimensions, data types, and column names.
- Handled missing values and identified inconsistencies.
- Converted columns into appropriate data types.
- Prepared clean datasets for downstream analysis.

## 2. Data Profiling
Data profiling was performed to understand the characteristics and quality of the datasets.
- Analyzed numerical & categorical distributions.
- Checked unique values and duplicate records.
- Evaluated potential data quality issues before deeper analysis.

## 3. Exploratory Data Analysis
EDA was performed to identify patterns, trends, relationships, and potential business opportunities.
- **Sales Analysis:** Sales trends, order volume, and transaction patterns.
- **Customer Analysis:** Geographic distribution and customer activity by state.
- **Product Analysis:** Category performance, order volume, and revenue contribution.
- **Payment & Delivery Analysis:** Payment methods, delivery time, and delay patterns.
- **Review Analysis:** Customer satisfaction and review score distribution.

## 4. PostgreSQL Database
The prepared datasets were loaded into a PostgreSQL database to provide a structured relational environment for performing SQL-based business analysis. The database contains tables for customers, orders, products, payments, reviews, and geolocation.

## 5. SQL Business Analysis
SQL was used to answer business questions directly from the PostgreSQL database. The analysis includes areas such as:
- **Business Performance:** Total sales, total orders, and overall trends.
- **Time-Based Analysis:** Monthly sales and order volume over time.
- **Product & Customer Analysis:** Sales by category, category ranking, and customer geographic patterns.
- **Delivery & Experience:** Estimated versus actual delivery, late delivery analysis, and review performance.

## 6. Power BI Dashboard
The final business intelligence layer transforms the analytical results into an interactive reporting environment.

**Executive Overview**
Focuses on the most important business KPIs and overall performance trends.
![Executive Overview](images/dashboard_page_1.png)

**Customer Analysis**
Focuses on customer distribution and geographic behavior.
![Customer Analysis](images/dashboard_page_2.png)

**Product Performance**
Focuses on product and category-level performance.
![Product Performance](images/dashboard_page_3.png)

**Delivery & Customer Experience**
Combines operational delivery performance with customer experience indicators.
![Delivery & Customer Experience](images/dashboard_page_4.png)

---

## 7. Business Insights
The major analytical themes identified through the project include:
1. **Sales Performance:** Sales and order activity fluctuate over time; monitoring these periods helps track marketplace performance.
2. **Product Category Concentration:** A small number of categories contribute significantly to revenue and order volume.
3. **Geographic Customer Concentration:** Customer activity is highly concentrated in specific Brazilian states, offering opportunities for targeted marketing.
4. **Delivery Performance:** Tracking estimated vs. actual delivery highlights operational constraints.
5. **Customer Satisfaction:** Review scores provide direct insight into customer experience, especially when tied to delivery delays.

---

## 8. Business Recommendations
Based on the analytical framework, the following recommendations can be considered:
1. **Prioritize High-Performing Categories:** Allocate more resources to inventory planning and promotions for top categories.
2. **Develop Region-Specific Strategies:** Focus marketing, customer acquisition, and logistics on high-concentration states.
3. **Monitor Delivery Performance:** Continuously track late deliveries to improve operational efficiency.
4. **Connect Delivery and Customer Satisfaction:** Investigate operational issues that consistently result in lower review scores.
5. **Utilize BI Reporting:** Use the Power BI dashboard as a recurring monitoring tool for business KPIs rather than raw data.

---

## Tools and Technologies
- **Python:** Data cleaning, profiling, EDA (Pandas).
- **PostgreSQL:** Relational data storage, structured data management.
- **SQL:** Data aggregation, filtering, joins, KPI calculations, trend analysis.
- **Power BI:** Data modeling, visualization, interactive filtering, business dashboards.
- **GitHub:** Version control, project documentation, portfolio presentation.

---

## Key Skills Demonstrated
- **Data Analytics:** Data cleaning, EDA, data interpretation, business problem solving.
- **SQL:** `SELECT`, Filtering, Aggregation, `GROUP BY`, `ORDER BY`, `JOIN`, `CASE`, Date/time analysis.
- **Database:** Relational data modeling, multi-table analysis.
- **Business Intelligence:** Dashboard design, KPI tracking, business storytelling.

---

## Project Outcome
This project demonstrates how raw e-commerce transaction data can be transformed into actionable business intelligence through a structured analytical workflow, connecting data preparation with analytical reasoning and business strategies.

---
**Author:** Ayu Sinaga  
*Data Analytics / Business Intelligence Portfolio Project*  
*Tools used: Python | Pandas | PostgreSQL | SQL | Power BI | GitHub*

> **Disclaimer:** This project is intended for educational and portfolio purposes. The analysis is based on the publicly available Olist Brazilian E-Commerce dataset and does not represent the actual internal performance or strategic decisions of Olist.
