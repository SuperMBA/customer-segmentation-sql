-- 1. Top 10 customers by number of transactions
SELECT customer_id, COUNT(*) AS transaction_count
FROM transactions_2
GROUP BY customer_id
ORDER BY transaction_count DESC
LIMIT 10;

-- 2. Online vs offline order distribution
SELECT online_order, COUNT(*) AS total_orders
FROM transactions_2
GROUP BY online_order;

-- 3. Customers by gender
SELECT gender, COUNT(*) AS customer_count
FROM customers_2
GROUP BY gender;

-- 4. Average age by gender
SELECT gender,
       ROUND(AVG(EXTRACT(YEAR FROM AGE(dob)))) AS avg_age
FROM customers_2
GROUP BY gender;

-- 5. Customer segmentation by job category
SELECT jc.job_category, COUNT(*) AS customer_count
FROM customers_2 c
JOIN job_categories jc ON c.job_category_id = jc.job_category_id
GROUP BY jc.job_category;

-- 6. Transaction volume by location
SELECT l.state, COUNT(t.transaction_id) AS total_transactions
FROM transactions_2 t
JOIN customers_2 c ON t.customer_id = c.customer_id
JOIN locations l ON c.location_id = l.location_id
GROUP BY l.state
ORDER BY total_transactions DESC;

-- 7. Average order value by customer
SELECT t.customer_id,
       ROUND(AVG(p.list_price)) AS avg_order_value
FROM transactions_2 t
JOIN products p ON t.product_id = p.product_id
GROUP BY t.customer_id
ORDER BY avg_order_value DESC
LIMIT 10;

-- 8. Order status breakdown
SELECT os.order_status, COUNT(*) AS status_count
FROM transactions_2 t
JOIN order_statuses os ON t.order_status_id = os.order_status_id
GROUP BY os.order_status;

-- 9. Top 10 most purchased products
SELECT p.product_name, COUNT(*) AS purchase_count
FROM transactions_2 t
JOIN products p ON t.product_id = p.product_id
GROUP BY p.product_name
ORDER BY purchase_count DESC
LIMIT 10;

-- 10. Monthly order trends
SELECT DATE_TRUNC('month', transaction_date) AS month,
       COUNT(*) AS total_orders
FROM transactions_2
GROUP BY month
ORDER BY month;

-- 11. Percentage of online orders
SELECT
    ROUND(100.0 * COUNT(*) FILTER (WHERE online_order = 't') / COUNT(*), 2) AS online_percentage,
    ROUND(100.0 * COUNT(*) FILTER (WHERE online_order = 'f') / COUNT(*), 2) AS offline_percentage
FROM transactions_2;

-- 12. Failed transactions by region
SELECT l.state, COUNT(*) AS failed_orders
FROM transactions_2 t
JOIN customers_2 c ON t.customer_id = c.customer_id
JOIN locations l ON c.location_id = l.location_id
WHERE t.order_status_id = 5  -- assuming 5 = failed
GROUP BY l.state
ORDER BY failed_orders DESC;
