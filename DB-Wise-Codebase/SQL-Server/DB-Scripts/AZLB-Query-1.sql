-- Names Starting from J
SELECT * FROM AzureLibDB.sqlS2.Customer WHERE custName LIKE 'J%';
-- Names Starting from JAN
SELECT * FROM AzureLibDB.sqlS2.Customer WHERE custName LIKE 'JAN%';

-- Users above 30
SELECT * FROM 
	AzureLibDB.sqlS2.Customer 
WHERE 
	custAge > 30;

-- Users BETWEEN 20 and 33
SELECT * FROM 
	AzureLibDB.sqlS2.Customer 
WHERE 
	custAge BETWEEN 20 AND 33;

SELECT custName, productName, quantity FROM 
	sqlS2.Customer c
INNER JOIN
	sqlS2.Orders o
ON 
	c.custID = o.custID
INNER JOIN
	sqlS2.Product p
ON
	p.productID = o.productID
ORDER BY 
	custName;

SELECT 
	custName, 
	ISNULL(productName,'N/A'),
	ISNULL(CAST(quantity AS varchar),'N/A')
FROM 
	sqlS2.Customer c
LEFT JOIN
	sqlS2.Orders o
ON 
	c.custID = o.custID
LEFT JOIN
	sqlS2.Product p
ON
	p.productID = o.productID
ORDER BY 
	custName;

SELECT CAST(price AS money), GETDATE()+price FROM sqlS2.Inventory;

-- Practical Use of Cross Join
CREATE TABLE 
	sqlS2.Clothes
	( 
		clothID INT IDENTITY(1,1) PRIMARY KEY,
		clothType varchar(20)
	);

CREATE TABLE 
	sqlS2.Size
	( 
		sizeID INT IDENTITY(1,1) PRIMARY KEY,
		sizeType char(2)
	);

INSERT INTO sqlS2.Clothes( clothType ) VALUES ('Jeans');
INSERT INTO sqlS2.Clothes( clothType ) VALUES ('Shirt');
INSERT INTO sqlS2.Clothes( clothType ) VALUES ('Pant');
INSERT INTO sqlS2.Clothes( clothType ) VALUES ('Shorts');

INSERT INTO sqlS2.Size( sizeType ) VALUES ('XS');
INSERT INTO sqlS2.Size( sizeType ) VALUES ('S');
INSERT INTO sqlS2.Size( sizeType ) VALUES ('M');
INSERT INTO sqlS2.Size( sizeType ) VALUES ('L');
INSERT INTO sqlS2.Size( sizeType ) VALUES ('XL');

SELECT * from sqlS2.Clothes;
SELECT * from sqlS2.Size;

SELECT 
	clothType, 
	sizeType 
FROM
	sqlS2.Clothes
CROSS JOIN
	sqlS2.Size;
