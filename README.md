# Olist E-Commerce Growth & Operational Performance (SQL Analytics)

## Introduction

Olist is a Brazilian online marketplace that connects small sellers with customers across the country. Order volume has grown quickly, and leadership wants to know whether that growth is healthy. This project uses SQL (MySQL) to analyse the marketplace across three areas: revenue concentration, delivery and customer satisfaction, and customer retention.

## Problem Statement and Objectives

**Business problems**

1. **Revenue concentration:** Where does revenue come from, and does it depend too heavily on a few categories, states or sellers?
2. **Delivery and satisfaction:** Are late deliveries hurting review scores, and which regions perform worst?
3. **Customer retention:** Are customers coming back, or is growth driven only by new buyers?

**Objectives**

- Measure monthly revenue and order growth.
- Identify top categories, states and sellers, and how concentrated revenue is.
- Quantify late deliveries and their effect on review scores.
- Measure the repeat purchase rate and the time between a customer's first and second order.
- Recommend where to focus to grow revenue, improve delivery and keep customers.

## Dataset Description

The analysis uses 9 CSV files from the Olist e-commerce dataset:

| Table | Contents |
|---|---|
| `customers` | Customer IDs and location |
| `geolocation` | Zip code coordinates |
| `orders` | Order status and purchase, approval, delivery and estimated delivery dates |
| `order_items` | Items per order, price, freight, seller |
| `order_payments` | Payment type, installments, payment value |
| `order_reviews` | Review scores |
| `products` | Product attributes and category |
| `product_category` | Category name translation |
| `sellers` | Seller IDs and location |

**Scope:** [WRITE YOUR SCOPE HERE, e.g. 9,300 delivered orders from January to December 2017]

## Key Stages of the Analysis

1. **Data setup:** created the database, defined the tables and imported the CSVs.
2. **Data checks:** checked row counts, nulls and duplicates, and filtered to the orders used in the analysis.
3. **Problem 1, revenue concentration:** monthly revenue, categories, states, sellers, payment methods.
4. **Problem 2, delivery and satisfaction:** late rate, delivery days by state, review scores by delay band.
5. **Problem 3, retention:** repeat purchase rate, days between first and second order, repeat rate by state and category.

## Example Queries and Outputs

### Monthly revenue and order count

Output:<img width="930" height="482" alt="Screenshot 2026-11-04 104941" src="https://github.com/user-attachments/assets/361040b0-1c70-41da-98b2-18ffc53a0ad4" />

### revenue by state
Output:<img width="824" height="282" alt="Screenshot 2026-11-04 104827" src="https://github.com/user-attachments/assets/6ec22de8-d9d9-4218-8ebd-e39e1c926eec" />

### review ontime vs late
Output:<img width="930" height="482" alt="Screenshot 2026-11-04 104941" src="https://github.com/user-attachments/assets/c4a480f4-bbb9-4df7-8e49-a8d944061465" />


## Key Findings

**Revenue concentration**

- Monthly revenue grew from about 18k in January to 211k in November (about 11.7x), when it peaked at 1,552 orders. December then fell 26.7%.
- Bed Bath Table (108,102), Health Beauty (106,260) and Watches Gifts (101,821) lead on revenue. Auto (52,573) and Garden Tools (52,739) are at the bottom.
- São Paulo earns 36% of revenue, Rio de Janeiro 15% and Minas Gerais 12%, so the top 3 states make up 63%.
- The top 10 sellers account for about 20% of revenue, and the largest seller for about 4%.
- Credit card is the dominant payment method (7,156 orders, 76.98% of orders, average payment 162.31). Debit card is the lowest (73 orders, 0.78%, average payment 95.66).

**Delivery and satisfaction**

- 6.5% of orders (602 of 9,300) arrived after the estimated date.
- Average delivery time is slowest in AL (25.6 days), AP (24.3) and AM (23.7), and fastest in SP (9.3) and MG (12.2).
- Bahia has the highest late rate (14.5%), followed by PE (12.9%), MA (12.1%) and RJ (11.1%). SP is at 4.7%.
- Late orders average a review score of 2.65, against 4.30 for on-time orders.
- Scores fall as delays grow: 3.42 (1 to 3 days late), 2.20 (4 to 7 days), 1.67 (8 to 14 days) and 1.20 (15+ days).

**Customer retention**

- Only 269 of 9,000 customers (3.0%) ordered more than once.
- The average gap between a first and second order is 46.2 days (range 0 to 312 days).
- Repeat rates are similar across states (RJ 3.8%, BA 3.7%, SP 3.1%) but differ by category: furniture_decor 8.1% and pet_shop 7.4%.

## Recommendations

1. **Regionalise logistics:** set up fulfilment capacity in Bahia and the northeastern states to cut long transit times and the review penalty that comes with late deliveries.
2. **Re-engage by category:** target categories with higher repeat potential (pet shop, furniture decor) with follow-up campaigns around day 30 to 45 after purchase.
3. **Diversify geographically:** reduce dependence on SP, RJ and MG (63% of revenue) by supporting growth in secondary markets, for example with localised shipping offers.

## Tools

MySQL, SQL (joins, CTEs, window functions, aggregations).

## Author

[Monicah Alek] | [YOUR LINKEDIN LINK]


