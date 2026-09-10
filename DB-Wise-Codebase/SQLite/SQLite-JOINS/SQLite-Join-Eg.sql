CREATE TABLE Products 
( 
	productID INTEGER PRIMARY KEY AUTOINCREMENT, 
	productName TEXT, 
	productType TEXT, 
	productPrice REAL 
);

-- Insert Product Values
-- productID 4 (Nespresso) and 7 (Apple Watch Ultra) have NO orders so these will appear as NULL rows in a LEFT JOIN
INSERT INTO Products ( productName, productPrice, productType ) VALUES ( 'Apple iPhone 15',    1234, 'SmartPhone'     );  -- productID = 1
INSERT INTO Products ( productName, productPrice, productType ) VALUES ( 'HP Spectre x360',    2222, 'Laptop'         );  -- productID = 2
INSERT INTO Products ( productName, productPrice, productType ) VALUES ( 'Garmin Fenix 7',      555, 'Smartwatch'     );  -- productID = 3
INSERT INTO Products ( productName, productPrice, productType ) VALUES ( 'Nespresso Vertuo',    333, 'Coffee Machine'  );  -- productID = 4 ← NO ORDER
INSERT INTO Products ( productName, productPrice, productType ) VALUES ( 'Samsung Galaxy S24',  999, 'SmartPhone'     );  -- productID = 5
INSERT INTO Products ( productName, productPrice, productType ) VALUES ( 'Dell XPS 15',        1899, 'Laptop'         );  -- productID = 6
INSERT INTO Products ( productName, productPrice, productType ) VALUES ( 'Apple Watch Ultra',   799, 'Smartwatch'     );  -- productID = 7 ← NO ORDER
INSERT INTO Products ( productName, productPrice, productType ) VALUES ( 'Sony WH-1000XM5',     349, 'Headphones'     );  -- productID = 8
 
-- Orders Table
CREATE TABLE Orders 
( 
	orderID INTEGER PRIMARY KEY AUTOINCREMENT, 
	orderQuantity INTEGER, 
	productID INTEGER, 
	FOREIGN KEY (productID) REFERENCES Products(productID) 
);

-- Insert Order Values
INSERT INTO Orders ( productID, orderQuantity ) VALUES ( 1,  5  );  -- Apple iPhone 15
INSERT INTO Orders ( productID, orderQuantity ) VALUES ( 2,  2  );  -- HP Spectre x360
INSERT INTO Orders ( productID, orderQuantity ) VALUES ( 3,  10 );  -- Garmin Fenix 7
INSERT INTO Orders ( productID, orderQuantity ) VALUES ( 5,  3  );  -- Samsung Galaxy S24
INSERT INTO Orders ( productID, orderQuantity ) VALUES ( 6,  1  );  -- Dell XPS 15
INSERT INTO Orders ( productID, orderQuantity ) VALUES ( 8,  7  );  -- Sony WH-1000XM5
INSERT INTO Orders ( productID, orderQuantity ) VALUES ( 1,  2  );  -- Apple iPhone 15 (second order)
INSERT INTO Orders ( productID, orderQuantity ) VALUES ( 2,  4  );  -- HP Spectre x360 (second order)
INSERT INTO Orders ( productID, orderQuantity ) VALUES ( 5,  6  );  -- Samsung Galaxy S24 (second order)


-- AS for Column Alias or Renaming our Output 

-- INNER JOIN - Display Only Common Values - Intersection
-- Inner Join or Join – This is similar to Intersection of two sets 
-- Here, we get just the matching rows from both tables and eliminate others

SELECT 
	productName, 
	productType, 
	productPrice, 
	orderQuantity, 
	productPrice * orderQuantity AS totalAmount 
FROM 
	Products 
INNER JOIN 
	Orders 
ON 
	Products.productID = Orders.productID; 


-- LEFT JOIN - All Values from Left Table and only Matching Values from the Right Table
-- Left Join or Left Outer Join – This is similar to Set Difference. 
-- Here we will get the matching rows in addition to the non-matching rows from the Left table
-- Get the matching rows + non-matching rows from the Left table

SELECT 
	productName, 
	productType, 
	productPrice, 
	orderQuantity, 
	productPrice * orderQuantity AS totalAmount 
FROM 
	Products 
LEFT JOIN 
	Orders 
ON 
	Products.productID = Orders.productID; 

-- RIGHT JOIN - All Values from Right Table and only Matching Values from the Left Table
-- Right Join or Right Outer Join – This is similar to Set Difference.
-- Here we get the matching rows in addition to the non-matching rows from the Right table.
-- Get the matching rows + non-matching rows from the Right table 

SELECT 
	productName, 
	productType, 
	productPrice, 
	orderQuantity, 
	productPrice * orderQuantity AS totalAmount 
FROM 
	Products 
RIGHT JOIN 
	Orders 
ON 
	Products.productID = Orders.productID;

-- FULL JOIN - All Values from Both Tables
-- Full Join or Full Outer Join – This combines the results of a Left Join and a Right Join.
-- Here we get the matching rows + non-matching rows from both tables.
-- Matching rows are combined; non-matching rows from either table contain NULL.
-- Get the matching rows + non-matching rows from the Left table and Right table

SELECT 
    productName, 
    productType, 
    productPrice, 
    orderQuantity, 
    productPrice * orderQuantity AS totalAmount 
FROM 
    Products 
FULL JOIN 
    Orders 
ON 
    Products.productID = Orders.productID;

-- Cross Join – Here we get the cartesian product
-- Cartesian Product = number of rows of table1 * number of rows of table2
-- Since Cross Joins give us the Cartesian Product, we don’t need to specify a condition

SELECT * FROM Products CROSS JOIN Orders;

-- To see Autoincremented Values
SELECT * FROM sqlite_sequence;