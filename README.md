# 📊 Customer Behavior Analysis with SQL

## 📌 Overview
This project analyzes customer behavior using a PostgreSQL database. It identifies the most active customers based on the number of transactions and visualizes the results.

---

## 🗃️ Data Structure

Key tables used in the analysis:
- `customers_2` — customer details
- `transactions_2` — purchase history
- `products` — product catalog

_The data was provided in an educational environment (PostgreSQL, accessed via DBeaver). Due to confidentiality, the raw data is not published._

---

## 🛠 Tools Used
- PostgreSQL  
- SQL  
- DBeaver  
- matplotlib (for visualization)
---

## 📂 SQL File

📄 [Full SQL-файл with analytics](sql/full_case_study.sql)

---

## 🧠 SQL Logic

```sql
SELECT
    c.customer_id,
    c.first_name || ' ' || c.last_name AS full_name,
    COUNT(t.transaction_id) AS transaction_count
FROM
    customers_2 c
JOIN
    transactions_2 t ON c.customer_id = t.customer_id
GROUP BY
    c.customer_id, full_name
ORDER BY
    transaction_count DESC
LIMIT 10;
