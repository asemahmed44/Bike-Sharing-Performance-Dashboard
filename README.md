# 🚴‍♂️ Bike Sharing Performance & Revenue Dashboard  
### SQL Server → Power BI

This project analyzes bike sharing usage, revenue, and profitability by combining SQL data cleaning with advanced Power BI modeling.  
It demonstrates skills across SQL transformations, DAX measures, time-series analysis, and interactive report design.

---

## 📦 Project Files Included
- **Bike_Sharing_Dashboard.pbix** – Final Power BI Dashboard  
- **SQL_Queries.sql** – All SQL queries used for exploration and analysis  
- **Data_Cleaning.sql** – Full cleaning script (data types fixes, conversions, validations)  
- **/Screenshots** – Dashboard previews  
- **README.md** – Project documentation

---

## 🔧 Data Preparation & Cleaning (SQL Server)
The raw data consisted of two years of bike-sharing logs plus a cost table.

Key issues encountered:
1. **All numeric fields were stored as NVARCHAR** (temp, hum, hr, riders…).  
2. **Date field (dteday) was text**, causing sorting and filtering problems.  
3. **Year 0 and Year 1 tables had mismatched data types**, preventing UNION operations.  
4. **Revenue and cost metrics were not directly stored in the dataset**.

### ✔ Solutions implemented
- Converted all numeric fields to **INT** or **FLOAT** using `ALTER TABLE`.
- Cleaned and standardized dates using `TRY_CONVERT()` and `UPDATE`.
- Unified both tables using `UNION ALL` after fixing types.
- Joined cost_table via a shared key (year) to calculate revenue & profit.

---

## 📊 Power BI Modeling & DAX
After loading data into Power BI:

### 🔑 Key DAX Measures
- **Total Riders**
- **Average Riders**
- **Casual Riders**
- **Registered Riders**
- **Revenue** (rides × year-based price)
- **Total Cost** (rides × COGS)
- **Profit**

A unified table was also created using DAX `UNION()` for better modeling.

---

## 📈 Dashboard Insights
The dashboard contains multiple perspectives to understand rider behavior and business performance:

### ⭐ KPIs
- **Total Riders**
- **Revenue**
- **Profit**
- **Casual vs Registered Riders**

### ⭐ Visuals
- **Monthly Riders Trend** – seasonality analysis  
- **Hourly Riders Trend** – peak hour detection  
- **Revenue by Month** – financial trend  
- **Revenue by Type (Pie)** – customer segmentation  
- **Revenue by Hour & Weekday (Matrix)** – operational optimization  
- **Weather Impact Analysis** – effect of weather on demand  

Each visual supports decisions around:
- operational planning  
- resource allocation  
- pricing strategy  
- customer behavior  

---

## 🎯 Purpose of the Dashboard
This dashboard helps identify:
- when riders are most active  
- which rider type generates more revenue  
- how weather impacts usage  
- which months are most profitable  
- overall business performance (Revenue & Profit)

Ultimately, it provides a **data-driven view of bike-sharing operations** for better financial and operational decisions.

---

## 🛠 Technologies Used
- **SQL Server** (data cleaning & modeling)
- **Power Query**
- **DAX**
- **Power BI Desktop**
- **GitHub**

---
Asem Ahmed 

