-- 08_late_rate_by_state.sql

-- Question 8: which states have the highest late delivery rates?

SELECT customer_state, 
       COUNT(*) AS total_orders,
       ROUND(100 * SUM(CASE WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date THEN 1 ELSE 0 END)
			/ COUNT(*),2) AS pct_late
FROM orders o
       JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_state

HAVING COUNT(*) >= 50

ORDER BY pct_late DESC;

-- BA state has the highest late delivery rate with 14.5% and MS state with the least percentage of 2.3%
-- SP has 4.7% late orders. BA has 14.5%, PE 12.9%, MA 12.1%, and RJ 11.1%.