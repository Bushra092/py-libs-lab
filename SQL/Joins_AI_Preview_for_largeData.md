Data set is in Sql_pract_ai

⚙ Business Questions and Joins

1. Show each customer and their region

LEFT JOIN (include customers with missing region)

SELECT c.customer_name, r.region_name
FROM customers c
LEFT JOIN regions r ON c.region_id = r.region_id;

2. Show all orders with customer names

INNER JOIN

SELECT o.order_id, c.customer_name, o.order_date
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;

3. Show each order with product details

INNER JOIN (orders → order_items → products)

SELECT o.order_id, p.product_name, oi.quantity, p.price
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;

4. Show total amount per order (computed)

Multiple Joins

SELECT o.order_id,
SUM(oi.quantity \* p.price) AS total_value
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY o.order_id;

5. Show all customers and their payment status (even if no orders)

LEFT JOIN chain

SELECT c.customer_name, p.payment_status
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN payments p ON o.order_id = p.order_id;

6. Show total revenue by region

LEFT JOIN + GROUP BY

SELECT r.region_name, SUM(p.amount) AS total_revenue
FROM regions r
LEFT JOIN customers c ON r.region_id = c.region_id
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN payments p ON o.order_id = p.order_id
WHERE p.payment_status = 'Completed'
GROUP BY r.region_name;

7. Show pending or failed payments with customer and region

INNER + LEFT JOIN

SELECT c.customer_name, r.region_name, p.payment_status, p.amount
FROM payments p
JOIN orders o ON p.order_id = o.order_id
JOIN customers c ON o.customer_id = c.customer_id
LEFT JOIN regions r ON c.region_id = r.region_id
WHERE p.payment_status IN ('Pending', 'Failed');

🧠 Key Learning

This structure mimics real enterprise databases.

You chain joins step-by-step depending on:

Main table (focus of report)

Supporting tables (to enrich data)

Business question
