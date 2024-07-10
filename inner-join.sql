SELECT *
FROM customer_orders
ORDER BY customer_id;

# INNER JOIN just combine 2 tables. ex: it will combine 2 tables and show only rows where customer_id is the same on both table
SELECT *
FROM customers cTable
INNER JOIN customer_orders coTable
	ON cTable.customer_id = coTable.customer_id
ORDER BY cTable.customer_id;

SELECT product_name, SUM(order_total) as Total
FROM products p
JOIN customer_orders co
	ON p.product_id = co.product_id
GROUP BY product_name
ORDER BY 2;

SELECT *
FROM suppliers;

SELECT *
FROM ordered_items;

SELECT *
FROM suppliers s
INNER JOIN ordered_items oi
	ON s.supplier_id = oi.shipper_id
;

#JOIN multiples tables
SELECT *
FROM products p
JOIN customer_orders co
	ON p.product_id = co.product_id
JOIN customers c
	ON co.customer_id = c.customer_id
;

SELECT product_name, order_total, first_name
FROM products p
JOIN customer_orders co
	ON p.product_id = co.product_id
JOIN customers c
	ON co.customer_id = c.customer_id
;

SELECT p.product_id, product_name, SUM(order_total) AS total_orders
FROM products p
JOIN customer_orders co
	ON p.product_id = co.product_id
JOIN customers c
	ON co.customer_id = c.customer_id
GROUP BY p.product_id
;

#join with condition to elimanate bad data 
SELECT *
FROM customer_orders co
JOIN customer_orders_review cor
	on co.order_id = cor.order_id
    AND co.customer_id = cor.customer_id
    AND co.order_date = cor.order_date
;

# OUTER JOINS
SELECT c.customer_id, first_name, co.order_id
FROM customers c
LEFT OUTER JOIN customer_orders co
	ON c.customer_id = co.customer_id
ORDER BY c.customer_id, co.order_id;

# JOINS everthing of the right table even if items doesnt exist on the left table 
SELECT c.customer_id, first_name, co.order_id
FROM customers c
RIGHT OUTER JOIN customer_orders co
	ON c.customer_id = co.customer_id
ORDER BY c.customer_id, co.order_id;

# SELFT JOIN
SELECT c.customer_id, c.first_name, c.last_name, ss.customer_id, ss.first_name, ss.last_name
FROM customers c
JOIN customers ss
	ON c.customer_id + 1 = ss.customer_id
;
