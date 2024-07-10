
SELECT *
FROM customers
WHERE customer_id IN
	(
    SELECT customer_id
    FROM customer_orders
    )
;

# subquery only allowns to select 1 columns at a type but you can mention 
SELECT *
FROM customers
WHERE customer_id IN
	(
    SELECT customer_id
    FROM customer_orders
    WHERE tip > 1
    )
;

SELECT *
FROM orders
WHERE MAX(number_of_orders) = (
  SELECT number_of_orders
  FROM orders
)
;

SELECT product_id,
quantity,
(
	SELECT AVG(quantity)
	FROM ordered_items
) AS avg_quantity
FROM ordered_items
;