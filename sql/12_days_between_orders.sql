-- 12_days_between_orders.sql

-- Question 12: how many days pass between a customer’s first and second order?

WITH ranked AS (
    SELECT
        c.customer_unique_id,
        o.order_purchase_timestamp AS purchase_ts,
        ROW_NUMBER() OVER (PARTITION BY c.customer_unique_id
                           ORDER BY o.order_purchase_timestamp) AS rn
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
),
gaps AS (
    SELECT a.customer_unique_id,
           DATEDIFF(b.purchase_ts, a.purchase_ts) AS days_between
    FROM ranked a
    JOIN ranked b ON a.customer_unique_id = b.customer_unique_id
                 AND a.rn = 1 AND b.rn = 2
)
SELECT
    COUNT(*)  AS repeat_customers,
    ROUND(AVG(days_between), 1)  AS avg_days_between,
    MIN(days_between)  AS min_days,
    MAX(days_between)  AS max_days
FROM gaps;

-- the avg_days between  repeat customer is 46.2 days and max_days is 312 and zero for min_days