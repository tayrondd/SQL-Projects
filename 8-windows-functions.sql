#wwindow functions

SELECT c.customer_id,
first_name,
order_total,
MAX(order_total) OVER(PARTITION BY customer_id) AS max_order_total
FROM customers c
JOIN customer_orders co
	ON c.customer_id = co.customer_id
;

# we usa a subquery to be able to use WHERE in this case
SELECT *
FROM (
SELECT c.customer_id,
first_name,
order_total,
ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_total DESC) AS row_num
FROM customers c
JOIN customer_orders co
	ON c.customer_id = co.customer_id
) AS row_table
WHERE row_num < 3
;

# RANK
SELECT *,
RANK() OVER(PARTITION BY department ORDER BY salary DESC)
FROM employees
;

SELECT *
FROM (
SELECT *,
RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS ranked_row
FROM employees 
) AS ranked
WHERE ranked_row < 3
;

# dense rank wont skip a rank value ex on row 3 and 5
SELECT *,
RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS rank_,
DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS dense_
FROM employees
;

SELECT *,
SUM(score) OVER(PARTITION BY artist_id) AS Total_Score,
RANK() OVER(PARTITION BY Total_Score ORDER BY score DESC)
FROM rankings
;