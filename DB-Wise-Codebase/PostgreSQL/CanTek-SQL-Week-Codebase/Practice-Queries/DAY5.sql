SELECT
	Name,
	Title
	CONCAT( first_name, ' ', last_name ) AS actorName
FROM
	film
INNER JOIN 
	film_category ON film_category.film_id = film.film_id
INNER JOIN 
	category ON category.category_id = film_category.category_id
INNER JOIN 
	film_actor ON film_actor.film_id = film.film_id
INNER JOIN 
	actor ON actor.actor_id = film_actor.actor_id
GROUP BY
	Name, Title;
	
	
SELECT
	DISTINCT actor.actor_id,
	Name,
	Title
FROM
	film
INNER JOIN 
	film_category ON film_category.film_id = film.film_id
INNER JOIN 
	category ON category.category_id = film_category.category_id
INNER JOIN 
	film_actor ON film_actor.film_id = film.film_id
INNER JOIN 
	actor ON actor.actor_id = film_actor.actor_id
GROUP BY 
	actor.actor_id, Name, Title
ORDER BY actor.actor_id;

SELECT
	actor.first_name,
	actor.last_name,
	Name,
	Title
FROM
	film
INNER JOIN 
	film_category ON film_category.film_id = film.film_id
INNER JOIN 
	category ON category.category_id = film_category.category_id
INNER JOIN 
	film_actor ON film_actor.film_id = film.film_id
INNER JOIN 
	actor ON actor.actor_id = film_actor.actor_id
GROUP BY 
	actor.actor_id, Name, Title
ORDER BY actor.actor_id;

WITH film_name_with_category AS (
	SELECT
		DISTINCT actor.actor_id,
		Name,
		Title
	FROM
		film
	INNER JOIN 
		film_category ON film_category.film_id = film.film_id
	INNER JOIN 
		category ON category.category_id = film_category.category_id
	INNER JOIN 
		film_actor ON film_actor.film_id = film.film_id
	INNER JOIN 
		actor ON actor.actor_id = film_actor.actor_id
	GROUP BY 
		actor.actor_id, Name, Title
	ORDER BY actor.actor_id
) 

SELECT 
	* from 
	film_name_with_category
GROUP BY
	actor.actor_id;


SELECT
	actor.first_name,
	actor.last_name,
	Name,
	Title
FROM
	film
INNER JOIN 
	film_category ON film_category.film_id = film.film_id
INNER JOIN 
	category ON category.category_id = film_category.category_id
INNER JOIN 
	film_actor ON film_actor.film_id = film.film_id
INNER JOIN 
	actor ON actor.actor_id = film_actor.actor_id
GROUP BY 
	actor.actor_id, Name, Title
ORDER BY actor.actor_id;

SELECT
	actor.first_name,
	actor.last_name,
	Name,
	Title
FROM
	film
INNER JOIN 
	film_category ON film_category.film_id = film.film_id
INNER JOIN 
	category ON category.category_id = film_category.category_id
INNER JOIN 
	film_actor ON film_actor.film_id = film.film_id
INNER JOIN 
	actor ON actor.actor_id = film_actor.actor_id
GROUP BY 
	actor.actor_id, Name, Title
ORDER BY actor.actor_id;


SELECT
	actor.first_name,
	actor.last_name,
	string_agg( Name || ' : ' || Title, ' , ' )
-- 	string_agg( Title, ',' )
FROM
	film
INNER JOIN 
	film_category USING(film_id)
INNER JOIN 
	category USING(category_id)
INNER JOIN 
	film_actor USING(film_id)
INNER JOIN 
	actor USING (actor_id)
GROUP BY 
	actor.actor_id
ORDER BY actor.actor_id;


WITH film_name_with_category AS (
	SELECT
		DISTINCT actor.actor_id,
		Name,
		Title
	FROM
		film
	INNER JOIN 
		film_category ON film_category.film_id = film.film_id
	INNER JOIN 
		category ON category.category_id = film_category.category_id
	INNER JOIN 
		film_actor ON film_actor.film_id = film.film_id
	INNER JOIN 
		actor ON actor.actor_id = film_actor.actor_id
	GROUP BY 
		actor.actor_id, Name, Title
	ORDER BY actor.actor_id
) 

SELECT 
	* from 
	film_name_with_category
GROUP BY
	actor.actor_id;


SELECT
	actor.first_name,
	actor.last_name,
	Name,
	Title
FROM
	film
INNER JOIN 
	film_category ON film_category.film_id = film.film_id
INNER JOIN 
	category ON category.category_id = film_category.category_id
INNER JOIN 
	film_actor ON film_actor.film_id = film.film_id
INNER JOIN 
	actor ON actor.actor_id = film_actor.actor_id
GROUP BY 
	actor.actor_id, Name, Title
ORDER BY actor.actor_id;

SELECT
	actor.first_name,
	actor.last_name,
	Name,
	Title
FROM
	film
INNER JOIN 
	film_category ON film_category.film_id = film.film_id
INNER JOIN 
	category ON category.category_id = film_category.category_id
INNER JOIN 
	film_actor ON film_actor.film_id = film.film_id
INNER JOIN 
	actor ON actor.actor_id = film_actor.actor_id
GROUP BY 
	actor.actor_id, Name, Title
ORDER BY 
	actor.actor_id;


SELECT
	actor.first_name,
	actor.last_name,
	Name,
	Title
FROM
	film
INNER JOIN 
	film_category ON film_category.film_id = film.film_id
INNER JOIN 
	category ON category.category_id = film_category.category_id
INNER JOIN 
	film_actor ON film_actor.film_id = film.film_id
INNER JOIN 
	actor ON actor.actor_id = film_actor.actor_id
GROUP BY 
	actor.actor_id, Name, Title
ORDER BY 
	actor.actor_id;
	

SELECT
	actor.first_name,
	actor.last_name,
	string_agg( Name || ' : ' || Title, ' , ' )
-- 	string_agg( Title, ',' )
FROM
	film
INNER JOIN 
	film_category USING(film_id)
INNER JOIN 
	category USING(category_id)
INNER JOIN 
	film_actor USING(film_id)
INNER JOIN 
	actor USING (actor_id)
GROUP BY 
	actor.actor_id
ORDER BY actor.actor_id;

SELECT
	actor.first_name,
	actor.last_name,
	STRING_AGG( 
				Name || ' : ' || Title, 
				' , ' 
				ORDER BY Name ASC
			  ) AS filName_by_category 
FROM
	film
INNER JOIN 
	film_category USING(film_id)
INNER JOIN 
	category USING(category_id)
INNER JOIN 
	film_actor USING(film_id)
INNER JOIN 
	actor USING (actor_id)
GROUP BY 
	actor.actor_id
ORDER BY 
	actor.actor_id;