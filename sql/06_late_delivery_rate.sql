-- 06_late_delivery_rate.sql

-- Question 6: what percentage of orders arrive late?
SELECT
    COUNT(*) AS total_orders,
    SUM(CASE WHEN order_delivered_customer_date > order_estimated_delivery_date THEN 1 ELSE 0 END) AS late_orders,
    ROUND(100 * SUM(CASE WHEN order_delivered_customer_date > order_estimated_delivery_date THEN 1 ELSE 0 END)
          / COUNT(*), 2) AS pct_late
FROM orders;

-- 6.5% of orders (602 of 9,300) arrive after the estimated date.
