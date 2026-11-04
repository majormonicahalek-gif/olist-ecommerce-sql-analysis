-- 03_revenue_by_state.sql

-- Question 3, which states earn the most revenue
SELECT c.customer_state, 
        COUNT(DISTINCT o.order_id) AS orders, 
        ROUND(SUM(oi.price),2) AS revenue,
        ROUND(100 * SUM(oi.price) / (SELECT SUM( price) FROM order_items),2) AS pct_of_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id   
JOIN order_items oi ON o.order_id = oi.order_id  
GROUP BY c.customer_state
ORDER BY revenue DESC;

-- SP earns 36%, followed by RJ at 15%, and MG at third position with 12%, so the top 3 states make up 63%.