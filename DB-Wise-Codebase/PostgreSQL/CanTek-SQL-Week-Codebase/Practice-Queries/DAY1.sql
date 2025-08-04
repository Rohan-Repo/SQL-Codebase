SELECT * from pg_catalog.pg_tables 
WHERE schemaname != 'pg_catalog' and schemaname != 'information_schema';

SELECT rental_id,SUM(amount) from payment group by rental_id order by sum(amount) DESC;

SELECT customer_id,SUM(amount) from payment group by customer_id order by sum(amount) DESC;


SELECT f.title as filmTitle, pay.rental_id,SUM(amount) as rentalAmt from 
payment pay,rental rent,inventory inv,film f 
WHERE 
pay.rental_id = rent.rental_id AND
rent.inventory_id = inv.inventory_id AND
inv.film_id = f.film_id
group by pay.rental_id,f.title order by sum(amount) DESC;

SELECT count(*) from payment;
SELECT * from rental;
SELECT * from inventory;
SELECT * from film;
SELECT CONCAT(first_name,' ', last_name ) from customer;

SELECT CONCAT(cust.first_name,' ', cust.last_name ) as custName, pay.rental_id,SUM(amount) as rentalAmt from 
payment pay,rental rent, customer cust 
WHERE 
pay.rental_id = rent.rental_id AND
rent.customer_id = cust.customer_id
group by pay.rental_id,custName order by sum(amount) DESC;

-- Customer with Min and Max Collective Rental Amount 
(SELECT CONCAT(cust.first_name,' ', cust.last_name ) as custName, 
pay.rental_id,SUM(amount) as rentalAmt from 
payment pay,rental rent, customer cust 
WHERE 
pay.rental_id = rent.rental_id AND
rent.customer_id = cust.customer_id
group by pay.rental_id,custName order by sum(amount) DESC
LIMIT 1)	
UNION
(SELECT CONCAT(cust.first_name,' ', cust.last_name ) as custName, 
pay.rental_id,SUM(amount) as rentalAmt from 
payment pay,rental rent, customer cust 
WHERE 
pay.rental_id = rent.rental_id AND
rent.customer_id = cust.customer_id
group by pay.rental_id,custName order by sum(amount) ASC
LIMIT 1);