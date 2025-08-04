-- The Movie which was rented the maximum Number of times:
-- The films: "Scalawag Duck", "Juggler Hardly" and "Shock Cabin" were rented the most number of times

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