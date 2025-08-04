/*
	Name of the Actors in Descending Order of their appearances Count in films
	The Actress "Gina Degeneres" comes out of Top with 42 Movies.
	The reason I have added the ACTOR.actor_id in the GROUP BY Clause is because there are two Actresses with the same name "Susan Davis"
*/

SELECT 
	CONCAT( first_name, ' ', last_name) AS actorName,
	COUNT(*) AS cntActor
FROM 
	ACTOR
JOIN FILM_ACTOR ON ACTOR.actor_id = FILM_ACTOR.actor_id
GROUP BY actorName, ACTOR.actor_id
ORDER BY cntActor DESC;
