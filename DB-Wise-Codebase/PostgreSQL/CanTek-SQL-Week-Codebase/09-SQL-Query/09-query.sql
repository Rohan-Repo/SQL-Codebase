-- Get Company-Wide Staff Information - Refactored

SELECT 
	First_Name, 
	Last_Name, 
	Email, 
	Phone,
	Address, 
	City, 
	(
	CASE
		WHEN
			District = 'QLD' THEN 'Queensland'
		ELSE
			District
	END) AS Province_State,
	Country
FROM Staff
INNER JOIN 
	Address 
	ON Address.address_id = Staff.address_id
INNER JOIN 
	City 
	ON City.city_id = Address.city_id
INNER JOIN 
	Country 
	ON Country.country_id = City.country_id;
