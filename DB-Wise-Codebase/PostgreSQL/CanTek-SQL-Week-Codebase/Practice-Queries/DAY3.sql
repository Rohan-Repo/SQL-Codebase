SELECT MIN(length) AS minLen, MAX(length) AS maxLen, avg(length) AS avgLen, stddev(length) AS stdDevLen FROM film;

SELECT 
	MIN(length) AS minLen, MAX(length) AS maxLen, 
	ROUND( AVG(length), 2 ) AS avgLen, ROUND( STDDEV(length), 2 ) AS stdDevLen,
	ROUND( VARIANCE(length), 2 ) AS varianceLen
FROM film;

SELECT 
	MIN( LENGTH(description) ) AS minLenDescp, MAX( LENGTH(description) ) AS maxLenDescp, 
	ROUND( AVG( LENGTH(description) ), 2 ) AS avgLenDescp, 
	ROUND( STDDEV(LENGTH(description)), 2 ) AS stdDevLenDescp,
	ROUND( VARIANCE(LENGTH(description)), 2 ) AS varianceLenDescp 
FROM film;

SELECT DISTINCT special_features FROM film;

SELECT rating, AVG(replacement_cost) FROM Film
GROUP BY rating
ORDER BY AVG(replacement_cost) DESC;

SELECT special_features, COUNT(rental_duration) AS rentDuration FROM Film
GROUP BY special_features
ORDER BY rentDuration DESC;

SELECT special_features, SUM(rental_rate) AS sumRentalRate FROM Film
GROUP BY special_features
ORDER BY sumRentalRate DESC;

SELECT 
	special_features, 
	COUNT(rental_duration) AS cntRentDuration,
	SUM(rental_rate) AS sumRentalRate
FROM Film
GROUP BY 
	special_features
ORDER BY 
	cntRentDuration DESC, sumRentalRate DESC;
	
SELECT * FROM Language;

SELECT * FROM Film 
	WHERE 
description like '%Database%' OR description like '%SQL%';

SELECT * FROM Film WHERE description like '%Database%' 
	EXCEPT
SELECT * FROM Film WHERE description like '%SQL%';

SELECT * FROM Film;

SELECT * FROM Film WHERE description like '%India%';


SELECT * FROM Film 
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
	
SELECT 
	f.title AS filmTitle, 
	SUM(amount) AS sumRentalAmt, 
	COUNT(*) as cntRental
FROM 
	payment pay,rental rent,inventory inv,film f 
WHERE 
	pay.rental_id = rent.rental_id AND
	rent.inventory_id = inv.inventory_id AND
	inv.film_id = f.film_id
GROUP BY 
	filmTitle
ORDER BY 
	cntRental DESC, sumRentalAmt DESC;

SELECT * from payment where customer_id = 372;
SELECT * from rental WHERE inventory_id = 767;
SELECT * from inventory;
SELECT * from inventory WHERE film_id = 767;

SELECT customer_id,SUM(amount) from payment group by customer_id order by SUM(amount) DESC;

SELECT staff_id,SUM(amount) from payment group by staff_id order by SUM(amount) DESC;

SELECT * from customer WHERE first_name = 'Steve';

SELECT * from film where title = 'Scalawag Duck';

SELECT 
	f.title as filmTitle,
	CONCAT(cust.first_name,' ', cust.last_name ) as custName,
	pay.rental_id,
	SUM(amount) as rentalAmt
FROM 
	payment pay,rental rent, customer cust, inventory inv,film f  
WHERE 
	pay.rental_id = rent.rental_id AND
	rent.customer_id = cust.customer_id AND
	rent.inventory_id = inv.inventory_id AND
	inv.film_id = f.film_id
GROUP BY 
	pay.rental_id, custName, filmTitle 
ORDER BY
	SUM(amount) DESC;
	


	
SELECT 
	f.title AS filmTitle,
	COUNT(*) as cntRental
FROM 
	payment pay,rental rent,inventory inv,film f 
WHERE 
	pay.rental_id = rent.rental_id AND
	rent.inventory_id = inv.inventory_id AND
	inv.film_id = f.film_id
GROUP BY 
	filmTitle
ORDER BY 
	cntRental DESC;
	
	
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

	
SELECT * from actor where first_name = 'Bob' AND last_name = 'Pfeiffer';
SELECT * from actor where last_name = 'Cruz';
SELECT * from customer where first_name = 'Bob' AND last_name = 'Pfeiffer';

SELECT 
	special_features, 
	COUNT(rental_duration) AS cntRentDuration,
	SUM(rental_rate) AS sumRentalRate
FROM Film
GROUP BY 
	special_features
ORDER BY 
	cntRentDuration DESC, sumRentalRate DESC;
	
SELECT * from film;

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
	sumRentalAmt DESC;
	
SELECT 
	f.title AS filmTitle,
	COUNT(*) as cntRental
FROM 
	payment pay,rental rent,inventory inv,film f 
WHERE 
	pay.rental_id = rent.rental_id AND
	rent.inventory_id = inv.inventory_id AND
	inv.film_id = f.film_id
GROUP BY 
	filmTitle
ORDER BY 
	cntRental DESC;
	
SELECT AVG(amount) from payment WHERE amount > 1;

SELECT SUM(amount) as low from payment WHERE amount < 1
UNION 
SELECT SUM(amount) as up from payment WHERE amount >= 1;


SELECT DISTINCT amount from payment order by amount asc;


SELECT * FROM Film 
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
	
SELECT name as categoryName, COUNT(*) as cntFilm from film 
JOIN film_category on film.film_id = film_category.film_id
JOIN Category on film_category.category_id = Category.category_id
group by categoryName
order by cntFilm DESC;

SELECT * from category where name = 'Sports';
SELECT * from film_category where category_id = 15;
;

SELECT rating, AVG(replacement_cost), SUM(rental_rate), COUNT(rental_duration) FROM Film
GROUP BY rating;	

(SELECT CONCAT(cust.first_name,' ', cust.last_name ) as custName, 
SUM(amount) as rentalAmt from 
payment pay,rental rent, customer cust 
WHERE 
pay.rental_id = rent.rental_id AND
rent.customer_id = cust.customer_id AND
return_date IS NOT NULL
group by custName order by sum(amount) DESC
LIMIT 1
)
UNION
(SELECT CONCAT(cust.first_name,' ', cust.last_name ) as custName, 
SUM(amount) as rentalAmt from 
payment pay,rental rent, customer cust 
WHERE 
pay.rental_id = rent.rental_id AND
rent.customer_id = cust.customer_id AND
return_date IS NOT NULL
group by custName order by sum(amount) ASC
LIMIT 1)

(SELECT CONCAT(cust.first_name,' ', cust.last_name ) as custName, 
SUM(amount) as rentalAmt from 
payment pay,rental rent, customer cust 
WHERE 
pay.rental_id = rent.rental_id AND
rent.customer_id = cust.customer_id AND
return_date IS NOT NULL
group by custName order by sum(amount) DESC
LIMIT 1
)
UNION
(SELECT CONCAT(cust.first_name,' ', cust.last_name ) as custName, 
SUM(amount) as rentalAmt from 
payment pay,rental rent, customer cust 
WHERE 
pay.rental_id = rent.rental_id AND
rent.customer_id = cust.customer_id AND
return_date IS NOT NULL
group by custName order by sum(amount) ASC
LIMIT 1)

(SELECT CONCAT(cust.first_name,' ', cust.last_name ) as custName, 
pay.rental_id,SUM(amount) as rentalAmt from 
payment pay,rental rent, customer cust 
WHERE 
pay.rental_id = rent.rental_id AND
rent.customer_id = cust.customer_id AND
return_date IS NOT NULL
group by pay.rental_id,custName order by sum(amount) DESC
LIMIT 1)	
UNION
(SELECT CONCAT(cust.first_name,' ', cust.last_name ) as custName, 
pay.rental_id,SUM(amount) as rentalAmt from 
payment pay,rental rent, customer cust 
WHERE 
pay.rental_id = rent.rental_id AND
rent.customer_id = cust.customer_id AND
return_date IS NOT NULL
group by pay.rental_id,custName order by sum(amount) ASC
LIMIT 1);

(SELECT CONCAT(cust.first_name,' ', cust.last_name ) as custName, 
SUM(amount) as rentalAmt from 
payment pay,rental rent, customer cust 
WHERE 
pay.rental_id = rent.rental_id AND
rent.customer_id = cust.customer_id AND
return_date IS NOT NULL
group by custName order by sum(amount) DESC
LIMIT 3
)
UNION
(SELECT CONCAT(cust.first_name,' ', cust.last_name ) as custName, 
SUM(amount) as rentalAmt from 
payment pay,rental rent, customer cust 
WHERE 
pay.rental_id = rent.rental_id AND
rent.customer_id = cust.customer_id AND
return_date IS NOT NULL
group by custName order by sum(amount) ASC
LIMIT 3)

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