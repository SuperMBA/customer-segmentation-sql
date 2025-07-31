SELECT job_industry_category, 
       COUNT(customer_id) AS customer_count
FROM customers
GROUP BY job_industry_category
ORDER BY customer_count DESC;
SELECT TO_CHAR(t.transaction_date, 'YYYY-MM') AS transaction_month,
       c.job_industry_category,
       SUM(t.list_price) AS total_transaction_sum
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
GROUP BY transaction_month, c.job_industry_category
ORDER BY transaction_month, c.job_industry_category;
SELECT t.brand, 
       COUNT(t.transaction_id) AS count
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
WHERE t.online_order = TRUE
  AND t.order_status = 'Approved'
  AND c.job_industry_category = 'IT'
GROUP BY t.brand;
SELECT t.customer_id,
       SUM(t.list_price) AS total_spent,
       MAX(t.list_price) AS max_transaction,
       MIN(t.list_price) AS min_transaction,
       COUNT(t.transaction_id) AS transaction_count
FROM transactions t
GROUP BY t.customer_id
ORDER BY total_spent DESC, transaction_count DESC;
SELECT customer_id,
       total_spent,
       max_transaction,
       min_transaction,
       transaction_count
FROM (
    SELECT t.customer_id,
           SUM(t.list_price) OVER (PARTITION BY t.customer_id) AS total_spent,
           MAX(t.list_price) OVER (PARTITION BY t.customer_id) AS max_transaction,
           MIN(t.list_price) OVER (PARTITION BY t.customer_id) AS min_transaction,
           COUNT(t.transaction_id) OVER (PARTITION BY t.customer_id) AS transaction_count,
           ROW_NUMBER() OVER (PARTITION BY t.customer_id ORDER BY t.transaction_id) AS rn
    FROM transactions t
) ranked
WHERE rn = 1
ORDER BY total_spent DESC, transaction_count DESC;
SELECT c.first_name, c.last_name, 
       SUM(t.list_price) AS total_spent
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
GROUP BY c.first_name, c.last_name
ORDER BY total_spent ASC
LIMIT 1;
SELECT c.first_name, c.last_name, 
       SUM(t.list_price) AS total_spent
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
GROUP BY c.first_name, c.last_name
ORDER BY total_spent DESC
LIMIT 1;
SELECT customer_id, transaction_id, transaction_date, list_price
FROM (
    SELECT *, 
           ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY transaction_date) AS rn
    FROM transactions
) ranked
WHERE rn = 1;
SELECT c.first_name, c.last_name, c.job_title, max_interval
FROM (
    SELECT t.customer_id,
           MAX(t.transaction_date) - MIN(t.transaction_date) AS max_interval
    FROM transactions t
    GROUP BY t.customer_id
    ORDER BY max_interval DESC
    LIMIT 1
) max_trans
JOIN customers c ON max_trans.customer_id = c.customer_id;
SELECT c.first_name, c.last_name, c.job_title, max_interval
FROM (
    SELECT t.customer_id,
           MAX(t.transaction_date) - MIN(t.transaction_date) AS max_interval
    FROM transactions t
    GROUP BY t.customer_id
    ORDER BY max_interval DESC
    LIMIT 10
) max_trans
JOIN customers c ON max_trans.customer_id = c.customer_id;
