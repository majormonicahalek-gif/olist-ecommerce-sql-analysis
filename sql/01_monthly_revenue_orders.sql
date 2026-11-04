-- 01_monthly_revenue_orders.sql
-- Question 1, monthly revenue, orders, and growth
WITH monthly AS (
    SELECT
        DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS order_month,
        COUNT(DISTINCT o.order_id)   AS total_orders,
        ROUND(SUM(oi.price), 2)        AS revenue
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m')
)
SELECT
    order_month,
    total_orders,
    revenue,
    ROUND(100 * (revenue - LAG(revenue) OVER (ORDER BY order_month))
              / LAG(revenue) OVER (ORDER BY order_month), 1) AS growth_pct
FROM monthly
ORDER BY order_month;

-- Revenue grew from 18983.01 in January to 2111201.77 in November, then fell 26.7%s in December. November was the peak (1,552 orders).
