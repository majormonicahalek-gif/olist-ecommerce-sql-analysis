-- 10_review_by_delay.sql

-- Question 10: how does the review score change as the delay gets longer?

WITH d AS(
    SELECT   
           DATEDIFF(o.order_delivered_customer_date, o.order_estimated_delivery_date) AS days_late,
           r.review_score
FROM orders o

JOIN order_reviews r    ON o.order_id = r.order_id
)
SELECT
   CASE WHEN days_late <= 0  THEN 'On time'
         WHEN days_late <= 3  THEN '1-3 days late'
         WHEN days_late <= 7  THEN '4-7 days late'
         WHEN days_late <= 14 THEN '8-14 days late'
         ELSE '15+ days late' END AS delay_group,
    COUNT(*) AS reviews,     
    ROUND(AVG(review_score), 2)  AS avg_review_score
FROM d
GROUP BY delay_group
ORDER BY MIN(days_late);    

-- The score falls from 3.42 (1 to 3 days late) to 1.67 (8 to 14 days late).