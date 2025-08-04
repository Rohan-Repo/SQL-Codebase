-- Top 3 and Bottom 3 Customer with Minimum and Maximum Collective Rental Amount 
-- First We get the Lowest 3 Customers & Union them with the Highest 3 Customers and then just sort them in Descending order to get the Top 3 at the Top and the Bottom 3 later
-- So in Short Record Number 1,2,3 are the Highest 3 Customers and 6,5,4 are the Lowest 3 Customers

SELECT custName, rentalAmt from (

(SELECT CONCAT(cust.first_name,' ', cust.last_name ) as custName, 
SUM(amount) as rentalAmt from 
payment pay,rental rent, customer cust 
WHERE 
pay.rental_id = rent.rental_id AND
rent.customer_id = cust.customer_id AND
return_date IS NOT NULL
group by custName order by sum(amount) ASC
LIMIT 3)
UNION
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
	ORDER BY rentalAmt DESC
) AS temp;