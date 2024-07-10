#  Group By

SELECT customer_id, SUM(tip)
FROM customer_orders
GROUP BY customer_id;

#we can only select the columns that we can group by 
SELECT product_id, AVG(order_total) 
FROM customer_orders
GROUP BY product_id
ORDER BY AVG(order_total) DESC;

SELECT customer_id, MAX(tip) AS biggest_tips
FROM customer_orders
GROUP BY customer_id
ORDER BY biggest_tips;

SELECT *
FROM customer_orders;

SELECT customer_id, MAX(tip) AS biggest_tips
FROM customer_orders
GROUP BY customer_id
ORDER BY biggest_tips;

 # HAVING IS A SUSTITUTED OF WHERE and we use HAVING when creating new columns cause WHERE wont work due it runs before SELECT
 # HAVING work for aggregate columns and WHERE just regular columns or the define ones
SELECT customer_id, SUM(order_total) AS total
FROM customer_orders
GROUP BY customer_id
HAVING total > 40 # filter total greater than 40 
ORDER BY total;

# WITH ROLLUP basically sum all the the values of the aggregate column, ROLLUP wont work properly with HAVING
SELECT customer_id, SUM(order_total) AS total
FROM customer_orders
GROUP BY customer_id WITH ROLLUP
ORDER BY total;