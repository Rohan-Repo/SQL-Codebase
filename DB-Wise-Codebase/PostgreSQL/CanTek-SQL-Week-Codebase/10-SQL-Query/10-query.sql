 -- Refactored Query to Use STRING_AGG() and STRING_TO_ARRAY() functions to mimic a JSON like Structure
 /*
	Get List of Categories and Movies played by Actors Grouped By ActorID
	Here we initially joined all the necessary Tables.
	Then Since String Aggregate function, STRING_AGG() takes first argument as value, second as Separator and third as order by, 
	We had to Concatenate Name and Title with [ str1 || seperator || str2 ] Syntax and then Seperate using ',' and Order by CategoryName
*/


SELECT
	actor.first_name,
	actor.last_name,
	STRING_TO_ARRAY
	(
		STRING_AGG	(
						Name || ' : ' || Title,
						' , '
						ORDER BY Name ASC
					),
		' , '		
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