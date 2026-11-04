-- 04_top_sellers.sql

-- Question 10, who are the top 10 sellers?
SELECT
    s.seller_id,
    s.seller_state  AS state,
    COUNT(DISTINCT oi.order_id)   AS total_orders,
    ROUND(SUM(oi.price), 2)    AS revenue,
    ROUND(100 * SUM(oi.price) / (SELECT SUM(price) FROM order_items), 2) AS pct_of_revenue
FROM order_items oi
JOIN sellers s ON oi.seller_id = s.seller_id
GROUP BY s.seller_id, s.seller_state
ORDER BY revenue DESC
LIMIT 10;

-- The top 10 sellers make up 20% of revenue with the leading seller having 4% of the revenue and last 2 have a tire of 1%
