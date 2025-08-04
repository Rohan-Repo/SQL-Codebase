-- The Rental Earnings generated most by a film:
-- The film: "Telegraph Voyage" earned the most amount of rental money.

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