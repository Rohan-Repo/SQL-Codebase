-- We find out that the Count of Rentals is directly proportional to the Replacement Cost when we group them by the Special Features

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