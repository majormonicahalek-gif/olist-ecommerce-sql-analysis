-- 00_create_tables.sql
USE olist_ecommerce;

SELECT * FROM customers;
SELECT * FROM order_items;
SELECT * FROM order_payments;
SELECT * FROM order_reviews;
SELECT * FROM orders;
SELECT * FROM product_category;
SELECT * FROM products;

-- Question 1, total customers
SELECT COUNT(customer_id)
FROM customers;

-- Question 2, total sellers
SELECT COUNT(seller_id)
FROM sellers; 

-- Question 3, 10 most expensive items in order_items (highest price first).
SELECT *
FROM order_items
ORDER BY price DESC
LIMIT 10;

-- Question 4, How many customers live in the state
SELECT COUNT(customer_id)number_of_customers, customer_state
FROM customers
GROUP BY customer_state
ORDER BY number_of_customers DESC;

-- Question 5, orders payment_type
SELECT COUNT(payment_value)total_payment,payment_type
FROM order_payments
GROUP BY payment_type;

-- Question 6, ordered item that cost more than 100
SELECT payment_value, payment_type,payment_installments,payment_sequential
FROM order_payments
WHERE payment_value >=100
ORDER BY payment_value DESC;






        




