/*
	Select Active Customers from Each Country with the Total Amount they Spent, Grouped Countrywise
	Here Active = 1 indicates that they are the active Customers
*/

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