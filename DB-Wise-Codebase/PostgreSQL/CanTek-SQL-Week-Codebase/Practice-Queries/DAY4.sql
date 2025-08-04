SELECT * FROM 
	ACTOR
NATURAL JOIN FILM_ACTOR;

SELECT * FROM 
	ACTOR
CROSS JOIN FILM_ACTOR;

SELECT * FROM 
	FILM
CROSS JOIN FILM_ACTOR 
ORDER BY TITLE;


-- Sub-Query as a Parameter
SELECT *,
	(SELECT COUNT(*) FROM rental WHERE rental.customer_id = customer.customer_id)
FROM Customer;


SELECT amount, customer_id, 
avg(amount) OVER (PARTITION BY EXTRACT(MONTH FROM payment_date)) as month_average, EXTRACT(month FROM payment_date) as month
FROM payment
ORDER BY month desc;


WITH revenue_vs_month AS (

SELECT DISTINCT avg(amount) OVER (PARTITION BY EXTRACT(MONTH FROM payment_date)) as month_average, EXTRACT(month FROM payment_date) as month
FROM payment	
)

SELECT corr(month_average, month)
FROM revenue_vs_month;



WITH film_rentals AS (
  SELECT inventory.film_id, COUNT(*) AS rental_count
  FROM rental
  JOIN inventory ON rental.inventory_id = inventory.inventory_id
  GROUP BY inventory.film_id
)


SELECT f.title, fr.rental_count
FROM film f
JOIN film_rentals fr ON f.film_id = fr.film_id
WHERE fr.rental_count > 1
ORDER by fr.rental_count DESC;

CREATE TYPE days AS ENUM ('Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun')

CREATE TABLE MonthNames( monthID int PRIMARY KEY, monthName varchar(20) );
INSERT INTO MonthNames VALUES ( 1, 'Jan' );
INSERT INTO MonthNames VALUES ( 2, 'Feb' );
INSERT INTO MonthNames VALUES ( 3, 'Mar' );
INSERT INTO MonthNames VALUES ( 4, 'Apr' );
INSERT INTO MonthNames VALUES ( 5, 'May' );
INSERT INTO MonthNames VALUES ( 6, 'Jun' );
INSERT INTO MonthNames VALUES ( 7, 'July' );
INSERT INTO MonthNames VALUES ( 8, 'Aug' );
INSERT INTO MonthNames VALUES ( 9, 'Sept' );
INSERT INTO MonthNames VALUES ( 10, 'Oct' );
INSERT INTO MonthNames VALUES ( 11, 'Nov' );
INSERT INTO MonthNames VALUES ( 12, 'Dec' );

SELECT * FROM MonthNames;


SELECT DISTINCT EXTRACT(MONTH FROM payment_date) as monthID FROM Payment

SELECT monthName from MonthNames where monthID IN (
	SELECT DISTINCT EXTRACT(MONTH FROM payment_date) as monthID FROM Payment
);


/*
Enter your query here.
*/

SELECT N,
    CASE 
        WHEN P IS NULL THEN 'ROOT',
        WHEN N IN (SELECT P FROM BST) THEN 'INNER',
        ELSE 'LEAF'
FROM BST 
ORDER BY N;


/*
THIS CREATES A PROBLEM BECAUSE THE INNER CONDITION GETS A NULL SO IT BY DEFAULT EVALUATES TO THE ELSE CONDITION
SELECT N,
    CASE 
        WHEN P IS NULL THEN 'ROOT',
        WHEN N NOT IN (SELECT P FROM BST) THEN 'LEAF',
        ELSE 'INNER'
FROM BST 
ORDER BY N;
*/

-- BUT WHEN WE SPECIFICALLY TELL IT THE ONES NOT NULL IT EVALUATES PROPERLY
SELECT N,
    CASE 
        WHEN P IS NULL THEN 'ROOT',
        WHEN N NOT IN (SELECT P FROM BST WHERE P IS NOT NULL) THEN 'LEAF',
        ELSE 'INNER'
FROM BST 
ORDER BY N;

-- THUS SQL ORDER OF EXECUTION IS REALLY IMPORTANT

SELECT * FROM ACTOR
WHERE first_name = 'Susan';

SELECT 
	CONCAT( first_name, ' ', last_name) AS actorName,
	COUNT(*) AS cntActor
FROM 
	ACTOR
JOIN FILM_ACTOR ON ACTOR.actor_id = FILM_ACTOR.actor_id
GROUP BY actorName, ACTOR.actor_id
ORDER BY cntActor DESC;

SELECT 
	TITLE,
	COUNT(*) AS cntFilms
FROM 
	ACTOR
JOIN FILM_ACTOR ON ACTOR.actor_id = FILM_ACTOR.actor_id
JOIN FILM ON FILM_ACTOR.film_id = FILM.film_id
GROUP BY title
ORDER BY cntFilms DESC;


SELECT 
	CONCAT( first_name, ' ', last_name) AS actorName,
	COUNT(*) AS cntActor,
	title,
	COUNT(*) AS cntFilms
FROM 
	ACTOR
JOIN FILM_ACTOR ON ACTOR.actor_id = FILM_ACTOR.actor_id
JOIN FILM ON FILM_ACTOR.film_id = FILM.film_id
GROUP BY actorName, title
ORDER BY cntActor DESC, cntFilms DESC;


SELECT 
	ACTOR.actor_id,
	CONCAT( first_name, ' ', last_name) AS actorName,
	COUNT(*) AS cntActor
FROM 
	ACTOR
JOIN FILM_ACTOR ON ACTOR.actor_id = FILM_ACTOR.actor_id
AND first_name = 'Susan'
GROUP BY actorName, ACTOR.actor_id
ORDER BY cntActor DESC;

SELECT 
	CONCAT( first_name, ' ', last_name) AS ActorName,
	COUNT(*) AS cntActor
FROM 
	ACTOR
JOIN FILM_ACTOR ON ACTOR.actor_id = FILM_ACTOR.actor_id
GROUP BY actorName, ACTOR.actor_id
ORDER BY cntActor DESC;


SELECT * from FILM_ACTOR WHERE actor_id = 107;


SELECT film_id FROM Film 
WHERE 
	description like '%Database%' 
OR 
	description like '%SQL%'
OR 
	description like '%Tech%'
OR
	description like '%Robot%'
OR
	description like '%Scientist%';
	
SELECT title,
SUM(amount) as sumA,
COUNT(rental_duration) as renD
FROM film
JOIN inventory ON FILM.film_id = inventory.film_id
JOIN rental ON inventory.inventory_id = rental.inventory_id
JOIN payment ON rental.rental_id = payment.rental_id
WHERE FILM.film_id IN (
	SELECT film_id FROM Film 
WHERE 
	description like '%Database%' 
OR 
	description like '%SQL%'
OR 
	description like '%Tech%'
OR
	description like '%Robot%'
OR
	description like '%Scientist%'
)
GROUP BY FILM.film_id
ORDER BY sumA DESC, renD DESC;


WITH total_revenue AS (
	SELECT 
	f.title AS filmTitle, 
	SUM(amount) AS sumRentalAmt
FROM 
	payment pay,rental rent,inventory inv,film f 
WHERE 
	pay.rental_id = rent.rental_id AND
	rent.inventory_id = inv.inventory_id AND
	inv.film_id = f.film_id
GROUP BY 
	filmTitle
ORDER BY 
	sumRentalAmt DESC
)

SELECT SUM(sumRentalAmt) from total_revenue;

with tech_revenue AS (
	SELECT title,
SUM(amount) as sumA,
COUNT(rental_duration) as renD
FROM film
JOIN inventory ON FILM.film_id = inventory.film_id
JOIN rental ON inventory.inventory_id = rental.inventory_id
JOIN payment ON rental.rental_id = payment.rental_id
WHERE FILM.film_id IN (
	SELECT film_id FROM Film 
WHERE 
	description like '%Database%' 
OR 
	description like '%SQL%'
OR 
	description like '%Tech%'
OR
	description like '%Robot%'
OR
	description like '%Scientist%'
)
GROUP BY FILM.film_id
ORDER BY sumA DESC, renD DESC
)

SELECT SUM(sumA) from tech_revenue;


-- SELECT SUM(sumRentalAmt) - SUM(sumA) as sumF from total_revenue, tech_revenue;

SELECT film_id,title,replacement_cost,rental_duration,rental_rate from film order by replacement_cost DESC;

SELECT * from pg_catalog.pg_tables 
WHERE schemaname != 'pg_catalog' and schemaname != 'information_schema';


SELECT * FROM Customer where active = 0;

SELECT DISTINCT active from Customer;

SELECT 
	country,
	COUNT (DISTINCT Customer.customer_id) as cntCountryCustomers,
	SUM(amount) as sumCountryAmount
FROM 
	Customer
JOIN Address 
	ON Address.address_id = Customer.address_id
JOIN City 
	ON City.city_id = Address.city_id
JOIN Country 
	ON Country.country_id = City.country_id
JOIN Payment 
	ON Payment.customer_id = Customer.customer_id
AND 
	active = 1
GROUP BY 
	country
ORDER BY 
	cntCountryCustomers DESC;
	
	
SELECT rating, SUM(replacement_cost) FROM Film
GROUP BY rating
ORDER BY SUM(replacement_cost) DESC;

SELECT rating, AVG(replacement_cost), SUM(rental_rate), COUNT(rental_duration) FROM Film
GROUP BY rating;	

SELECT rating, SUM(rental_rate), COUNT(rental_duration) FROM Film
GROUP BY rating
ORDER BY COUNT(rental_duration) DESC;	



SELECT CATEGORY_ID,COUNT(*) FROM FILM_CATEGORY GROUP BY CATEGORY_ID ORDER BY COUNT(*) DESC;


SELECT NAME,CATEGORY.CATEGORY_ID,COUNT(inventory.inventory_id), SUM(FILM.replacement_cost) FROM
CATEGORY JOIN film_category ON film_category.category_id = CATEGORY.category_id
JOIN film ON film.film_id = film_category.film_id
JOIN inventory ON inventory.film_id = film.film_id
GROUP BY CATEGORY.CATEGORY_ID ORDER BY COUNT(inventory.inventory_id) DESC;


SELECT 
	Name,
	COUNT(rental_duration) AS cntRentDuration,
	SUM(replacement_cost) AS sumReplacementCost,
	ROUND( AVG(length), 2 ) AS avgFilmLength
FROM 
	FILM
JOIN 
	FILM_CATEGORY ON FILM_CATEGORY.film_id = FILM.film_id
JOIN 
	CATEGORY ON CATEGORY.category_id = FILM_CATEGORY.category_id
GROUP BY 
	Name
ORDER BY 
	sumReplacementCost DESC;

SELECT 
	Name,
	COUNT(rental_duration) AS cntRentDuration,
	SUM(replacement_cost) AS sumReplacementCost
FROM 
	FILM
JOIN 
	FILM_CATEGORY ON FILM_CATEGORY.film_id = FILM.film_id
JOIN 
	CATEGORY ON CATEGORY.category_id = FILM_CATEGORY.category_id
GROUP BY 
	Name
ORDER BY 
	sumReplacementCost DESC;


SELECT 
	special_features,
	SUM(replacement_cost) AS sumReplacementCost,
	COUNT(rental_duration) AS cntRentDuration
FROM 
	FILM
GROUP BY 
	special_features
ORDER BY 
	cntRentDuration DESC, sumReplacementCost DESC;
	
SELECT * FROM STAFF;
SELECT * FROM Store;
SELECT * FROM ADDRESS WHERE ADDRESS_ID IN (1,2)

SELECT * FROM CITY WHERE CITY_ID IN (300,576)

SELECT * FROM COUNTRY WHERE COUNTRY_ID IN (20,8)

SELECT 
	First_Name, 
	Last_Name, 
	Email, 
	Phone,
	Address, 
	City, 
	District, 
	Country
FROM Staff
INNER JOIN 
	Address 
	ON Address.address_id = Staff.address_id
INNER JOIN 
	City 
	ON City.city_id = Address.city_id
INNER JOIN 
	Country 
	ON Country.country_id = City.country_id;