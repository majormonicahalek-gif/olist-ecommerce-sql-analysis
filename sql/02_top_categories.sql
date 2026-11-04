-- 02_top_categories.sql

-- Question 2, which product categories earn the most revenue?
SELECT pc.product_category_name_english AS category,
       COUNT(*)  AS items_sold,
       ROUND(SUM(oi.price),2) AS revenue
FROM order_items oi    
JOIN products p   ON oi.product_id = p.product_id
JOIN product_category pc ON p.product_category_name = pc.product_category_name
GROUP BY pc.product_category_name_english
ORDER BY revenue DESC
LIMIT 10;

-- revenue is spread up with the bed_bath_table leading with 108102.44 followed by health_beauty and watches_gifts with 106,260.17 and 101821.11 respectively
-- auto hold the bottoum position with 52573.38 followed by garden_tools with revenue of 52,739.09