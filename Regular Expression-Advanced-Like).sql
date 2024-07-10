#  Regular Expression

# Search for string that have 0 to 1 numbers
SELECT *
FROM customers
WHERE total_money_spent REGEXP '[0-1]'
;

# it search for characters except for nulls
SELECT *
FROM customers
WHERE phone REGEXP '.'
;

# it search for characters that starts with 6 end then any characters
SELECT *
FROM customers
WHERE phone REGEXP '6.'
;

# it search for characters that starts with K
SELECT *
FROM customers
WHERE first_name REGEXP '^k'
;

# it search for characters that ends with n
SELECT *
FROM customers
WHERE first_name REGEXP 'n$'
;

# it search for characters that starts with k and have 3 char and ends with n
SELECT *
FROM customers
WHERE first_name REGEXP 'k.{3}n'
;

# it search for 2 words at the same time or 2 parametrs
SELECT *
FROM customers
WHERE first_name REGEXP 'kev|fro'
;