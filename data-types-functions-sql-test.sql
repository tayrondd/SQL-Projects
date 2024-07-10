SELECT *
FROM bakery.customers
WHERE state IN ('PA', 'TX', 'FL'); 

SELECT *
FROM customers
WHERE first_name LIKE '%n%'; # containt the letter n inside first_name rows like = to find a word or character

SELECT *,
CASE #acts like if Else statement when we have to use multiple if to return a value on one column 
	WHEN units_in_stock < 20 THEN 'ORDER NOW!'
    WHEN units_in_stock BETWEEN 21 AND 50 THEN 'Check in 3 days'
    ELSE 'In Stock'
END AS 'Order Status'
FROM products; 

SELECT order_id,
order_date,
CASE
	WHEN YEAR(order_date) = YEAR(NOW()) - 1 THEN 'Active'
    WHEN YEAR(order_date) = YEAR(NOW()) - 2 THEN 'Last Year'
    Else 'Archived'
    END AS 'Years_status'
FROM customer_orders
ORDER BY Years_status;

SELECT oi.order_id, sds.name, oi.status, oi.shipped_date, s.name
FROM ordered_items oi
JOIN supplier_delivery_status sds
	ON oi.status = sds.order_status_id
JOIN suppliers s
	ON oi.shipper_id = s.supplier_id
WHERE sds.name <> 'Delivered'
AND year(shipped_date) < '2022'
;