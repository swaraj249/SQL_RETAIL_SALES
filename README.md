
# 🧾 Sales Data Analysis Using SQL

This project focuses on performing comprehensive data analysis on sales data using SQL (SQL Server). The primary objective is to extract actionable insights such as sales trends, customer behavior, and product category performance.

---

## 📂 Project Description

This project uses real-world-like transactional sales data imported from Excel into a SQL Server database. The analysis is performed through SQL queries utilizing functions like `GROUP BY`, window functions, and Common Table Expressions (CTEs).

---

## 🗂️ Dataset Overview

- Table Name: `SALES_OVER_VIEW`
- Source: Imported directly from an Excel file
- Key Columns:
  - `transaction_id`
  - `sale_date`
  - `sale_time`
  - `customer_id`
  - `gender`
  - `age`
  - `category`
  - `quantity`
  - `price_per_unit`
  - `cogs`
  - `total_sale`

---

## 🧠 Objectives

- Analyze **total and average sales** by category
- Identify **top-performing customers**
- Determine **sales trends across months**
- Segment data by **gender and shift**
- Use **CTEs and window functions** like `ROW_NUMBER`, `RANK`, and `DENSE_RANK` to derive advanced insights

---

## 🔍 Key SQL Concepts Used

- `GROUP BY` & `ORDER BY`
- `JOIN` operations (if applicable)
- Window functions: `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`
- `CTE` (Common Table Expressions)
- Conditional logic using `CASE`
- Aggregate functions: `SUM()`, `AVG()`, `COUNT()`, etc.

---

## 📊 Example Analysis Performed

1. **Total Sales & Orders per Category**
2. **Average Age of Customers by Category**
3. **Top 5 Customers Based on Sales**
4. **Monthly Sales and Best-Selling Month per Year**
5. **Number of Unique Customers per Category**
6. **Order Shifts** (Morning, Afternoon, Evening) based on `sale_time`

---

## 🛠️ Tools & Technologies

- SQL Server 
- Microsoft Excel (Data Import)
- SSMS (SQL Server Management Studio)

---

## 📌 Getting Started

1. Import your dataset from Excel into SQL Server as `SALES_OVER_VIEW`.
2. Use the provided queries or write your own SQL logic to perform analysis.
3. You can run the SQL queries using SSMS or any other SQL IDE of your choice.

---

## 📁 Folder Structure (If you upload to GitHub)

```
📦SQL-Sales-Analysis
 ┣ 📜 README.md
 ┣ 📂 SQL Queries
 ┃ ┗ 📜 sales_queries.sql
 ┗ 📂 Dataset
   ┗ 📄 sales_data.xlsx
```

---

## 🚀 Future Enhancements

- Create a Power BI or Tableau dashboard using SQL output
- Automate reporting using SQL Server Agent
- Integrate Python for predictive analysis

---

## 📝 License

This project is open for educational and portfolio use.
