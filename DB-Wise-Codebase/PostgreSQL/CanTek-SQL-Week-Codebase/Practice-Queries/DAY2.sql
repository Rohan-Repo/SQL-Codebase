SELECT * FROM PAYMENT;

SELECT * FROM FILM;

SELECT * FROM ACTOR where first_name = 'Jennifer';

SELECT * FROM City where country_id = 23;

SELECT country_id, count(*) AS cnt from City group by country_id order by cnt DESC;

SELECT DISTINCT first_name, last_name FROM Actor WHERE 
LENGTH(last_name) < 4
ORDER BY first_name;

SELECT customer_id, amount FROM payment WHERE amount < 1 ORDER BY customer_id;

SELECT customer_id, amount FROM payment WHERE amount = 0 ORDER BY customer_id;

SELECT DISTINCT customer_id, amount FROM payment WHERE amount < 1 ORDER BY customer_id;

SELECT DISTINCT customer_id, amount FROM payment WHERE amount = 0 ORDER BY customer_id;

SELECT DISTINCT first_name, last_name, payment.customer_id, amount FROM payment,customer WHERE amount < 1 
and payment.customer_id = customer.customer_id
ORDER BY payment.customer_id;


SELECT DISTINCT payment.customer_id, sum(amount) FROM payment,customer WHERE amount < 1 
and payment.customer_id = customer.customer_id
GROUP BY payment.customer_id
ORDER BY sum(amount) DESC;


SELECT DISTINCT * from film;

SELECT * FROM film
WHERE 
rental_rate > 2.99 AND rental_duration > 1 and replacement_cost > 20;

SELECT * FROM rental WHERE return_date IS NULL;
-- People who havent returned a Movie DVD
SELECT * FROM customer WHERE customer_id IN 
( SELECT customer_id from rental WHERE return_date IS NULL );

SELECT * FROM customer WHERE customer_id IN 
( 
	SELECT customer_id from rental 
	WHERE return_date IS NULL 
	AND staff_id IN (1,2) 
);


SELECT * FROM Actor 
WHERE LENGTH(first_name) <
ALL(
	SELECT LENGTH(last_name) from Actor
);

SELECT * FROM Actor 
WHERE LENGTH(first_name) <
SOME(
	SELECT LENGTH(last_name) from Actor
)

-- FIND CUSTOMERS WHICH HAVE SAME NAME AS ACTORS
-- SELECT * FROM customer WHERE customer.first_name = 
-- ANY ( select first_name from Actor )

SELECT customer.first_name, customer.last_name FROM Customer
WHERE 
	first_name IN (SELECT first_name FROM Actor) 
AND
	last_name IN (SELECT last_name FROM Actor);
	
SELECT customer.first_name, customer.last_name FROM Customer
WHERE 
	first_name IN (SELECT first_name FROM Actor) 
OR
	last_name IN (SELECT last_name FROM Actor);
	
SELECT CONCAT(first_name,' ',last_name) AS cName FROM Customer
WHERE CONCAT(first_name,' ',last_name) IN ( SELECT CONCAT(first_name,' ',last_name) FROM Actor)

-- WILDCARD 
SELECT * FROM City where city like 'P%';

SELECT * FROM CUSTOMER WHERE 
first_name LIKE '%p%';

SELECT * FROM CUSTOMER WHERE 
first_name ILIKE '%p%'

SELECT * FROM CUSTOMER WHERE 
first_name LIKE 'P%';

SELECT * FROM CUSTOMER WHERE 
first_name ILIKE 'P%';

SELECT * FROM FILM WHERE description ILIKE '% Drama %';

SELECT * FROM FILM WHERE description ILIKE '%SQL%';

-- >, <, BETWEEN

SELECT * FROM FILM WHERE LENGTH(description) > 50 ;

SELECT MAX(LENGTH(DESCRIPTION)) FROM FILM;

SELECT * FROM FILM WHERE LENGTH(description) > 100 AND LENGTH(description) < 120 ;

SELECT * FROM FILM WHERE LENGTH(description) BETWEEN 100 AND 120;