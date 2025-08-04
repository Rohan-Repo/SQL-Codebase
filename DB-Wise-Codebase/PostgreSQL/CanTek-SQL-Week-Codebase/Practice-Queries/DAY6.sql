CREATE OR REPLACE VIEW Customers_Payment AS 
SELECT
	(c.first_name || ' ' || c.last_name) as custName, 
	c.email as custEmail,
	p.amount as custPayment,
	p.payment_date as custPaymentDate
 FROM 
 	Customer c
JOIN 
	payment p ON p.customer_id = c.customer_id;

SELECT * FROM Customers_Payment;

CREATE OR REPLACE VIEW Sum_Customers_Payment AS 
SELECT
	(c.first_name || ' ' || c.last_name) as custName, 	
	SUM(p.amount) as custPayment
 FROM 
 	Customer c
JOIN 
	payment p ON p.customer_id = c.customer_id
GROUP BY 
	custName 
ORDER BY 
	custPayment DESC;
	
SELECT * FROM Sum_Customers_Payment;

CREATE OR REPLACE VIEW Date_Customers_Payment AS 
SELECT
	SUM(p.amount) as custPayment,
	p.payment_date as custPaymentDate
 FROM 
 	Customer c
JOIN 
	payment p ON p.customer_id = c.customer_id
GROUP BY 
	custPaymentDate 
ORDER BY 
	custPayment DESC, custPaymentDate DESC;
	
SELECT * FROM Date_Customers_Payment;
 