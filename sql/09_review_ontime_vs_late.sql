-- 09_review_ontime_vs_late.sql

-- Question 9: how do review scores compare for on-time and late orders?
SELECT
    CASE WHEN o.order_delivered_customer_date >order_estimated_delivery_date
     THEN 'Late' ELSE 'On time' END AS delivery_status,
    COUNT(*)  AS reviews,
    ROUND(AVG(r.review_score), 2) AS avg_review_score

FROM orders o  

JOIN order_reviews r ON o.order_id = r.order_id  

GROUP BY delivery_status;

-- Late orders average 2.65, compared with 4.30 for on-time orders.