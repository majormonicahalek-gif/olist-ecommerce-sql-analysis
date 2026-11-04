-- 13_repeat_by_state_category.sql	

-- Question 13: which states and categories have the highest repeat purchase rates?

-- By State:
WITH n AS (
    SELECT c.customer_unique_id,
           MIN(c.customer_state) AS state,
           COUNT(o.order_id)     AS orders
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_unique_id
)
SELECT
    state,
    COUNT(*) AS customers,
    ROUND(100 * SUM(CASE WHEN orders > 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS pct_repeat
FROM n
GROUP BY state
HAVING COUNT(*) >= 100
ORDER BY pct_repeat DESC;

-- By category (the share of customers who bought in that category and also ordered at least twice overall):
WITH n AS (
    SELECT c.customer_unique_id, COUNT(o.order_id) AS orders
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_unique_id
),
cat AS (
    SELECT DISTINCT
        c.customer_unique_id,
        pc.product_category_name_english AS category
    FROM customers c
    JOIN orders o            ON c.customer_id = o.customer_id
    JOIN order_items oi      ON o.order_id = oi.order_id
    JOIN products p          ON oi.product_id = p.product_id
    JOIN product_category pc ON p.product_category_name = pc.product_category_name
)
SELECT
    cat.category,
    COUNT(*) AS customers,
    ROUND(100 * SUM(CASE WHEN n.orders > 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS pct_repeat
FROM cat
JOIN n ON cat.customer_unique_id = n.customer_unique_id
GROUP BY cat.category
HAVING COUNT(*) >= 100
ORDER BY pct_repeat DESC
LIMIT 10;

-- By state, the rates are close (RJ 3.8%, BA 3.7%, SP 3.1%). By category, furniture_decor is highest at 8.1%, followed by pet_shop at 7.4%.