-- Which special features makes the Films most likely to be rented?
-- This shows that Trailers, Commentary by Actors/Celebrities and BTS has more importance over other special features.

SELECT 
	special_features, 
	COUNT(rental_duration) AS cntRentDuration,
	SUM(rental_rate) AS sumRentalRate
FROM 
	Film
GROUP BY 
	special_features
ORDER BY 
	cntRentDuration DESC, sumRentalRate DESC;