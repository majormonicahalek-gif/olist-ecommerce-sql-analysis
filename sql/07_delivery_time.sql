-- 07_delivery_time.sql

-- Question 7: what is the average delivery time, overall and by state?
SELECT ROUND(AVG(DATEDIFF(order_delivered_customer_date, order_purchase_timestamp)), 1) AS avg_delivery_days
FROM orders;
SELECT
    c.customer_state AS state,
    COUNT(*)         AS total_orders,
    ROUND(AVG(DATEDIFF(o.order_delivered_customer_date, o.order_purchase_timestamp)), 1) AS avg_delivery_days
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY avg_delivery_days DESC;

-- AL state, AP and AM state were the leading states with the avg_delivery_days at 25.6, 24.3 and 23.7 respectivly
-- SP state was last at 9.3 avg_delivery_days and MG state at second last with 12.2