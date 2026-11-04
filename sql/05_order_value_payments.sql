-- 05_order_value_payments.sql

-- Question 5, average order value and payment methods
SELECT
    payment_type,
    COUNT(DISTINCT order_id)    AS total_orders,
    ROUND(AVG(payment_value), 2)  AS avg_payment_value,
    ROUND(100 * COUNT(DISTINCT order_id)
          / (SELECT COUNT(DISTINCT order_id) FROM order_payments), 2) AS pct_of_orders
FROM order_payments
GROUP BY payment_type
ORDER BY total_orders DESC;

-- credit_card is the most used with 7156 orders, payment_type with avg_payment_value at 162.31 and 76.98% of orders.
-- debit_card at last with 73 orders and avg_payment value at 95.66 and 0.78 of orders