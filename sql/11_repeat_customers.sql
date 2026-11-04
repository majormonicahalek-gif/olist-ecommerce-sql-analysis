-- 11_repeat_customers.sql

-- Problem 3: Customer retention

-- Question 11: how many unique customers are there, and what percentage ordered more than once?

WITH n AS (
    SELECT c.customer_unique_id, COUNT(o.order_id) AS orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_unique_id
)
SELECT
    COUNT(*) AS unique_customers,
    SUM(CASE WHEN orders > 1 THEN 1 ELSE 0 END) AS repeat_customers,
    ROUND(100 * SUM(CASE WHEN orders > 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS pct_repeat
FROM n;

-- Only 269 of 9,000 customers (3.0%) ordered more than once.