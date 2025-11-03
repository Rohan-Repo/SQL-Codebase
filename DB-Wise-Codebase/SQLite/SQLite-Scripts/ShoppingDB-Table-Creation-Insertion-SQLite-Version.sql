-- Create Data from Scratch

-- DROP DATABASE IF EXISTS ShoppingDB;

-- CREATE DATABASE ShoppingDB;

-- USE ShoppingDB;

DROP TABLE IF EXISTS Stores;
DROP TABLE IF EXISTS ProductTypes;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Orders;

CREATE TABLE Stores (
	storeId INTEGER PRIMARY KEY AUTOINCREMENT,
	storeAddress TEXT NOT NULL,
	storeCity TEXT NOT NULL,
	storeCountry TEXT NOT NULL
);

INSERT INTO Stores ( storeAddress, storeCity, storeCountry  ) VALUES ( '123 Main Street', 'New York', 'USA' );
INSERT INTO Stores ( storeAddress, storeCity, storeCountry ) VALUES ( '987 Union Center', 'Toronto', 'Canada' );

-- Stores Table Data
SELECT * FROM Stores;

CREATE TABLE ProductTypes (
	productTypeId INTEGER PRIMARY KEY AUTOINCREMENT,
	productType TEXT NOT NULL
);

INSERT INTO ProductTypes ( productType ) VALUES ( 'SmartPhones' );
INSERT INTO ProductTypes ( productType ) VALUES ( 'Laptops' );
INSERT INTO ProductTypes ( productType ) VALUES ( 'SmartWatches' );
INSERT INTO ProductTypes ( productType ) VALUES ( 'Tablets' );
INSERT INTO ProductTypes ( productType ) VALUES ( 'Coffee Machines' );

-- ProductTypes Table Data
SELECT * FROM ProductTypes;

CREATE TABLE Products (
	productId INTEGER PRIMARY KEY AUTOINCREMENT,
	productName TEXT NOT NULL,
	productPrice REAL NOT NULL,
	productTypeId INTEGER,
	FOREIGN KEY (productTypeId) REFERENCES ProductTypes(productTypeId)
);

INSERT INTO Products 
( productName, productPrice, productTypeId )
VALUES
( 'iPhone 15 Pro Max', 2000, 1 );

INSERT INTO Products 
( productName, productPrice, productTypeId )
VALUES
( 'Samsung Galaxy S24', 1700, 1 );

INSERT INTO Products 
( productName, productPrice, productTypeId )
VALUES
( 'Apple Macbook Pro M3 Max', 5300, 2 );

INSERT INTO Products 
( productName, productPrice, productTypeId )
VALUES
( 'Lenovo Yoga 7', 1500, 2 );

INSERT INTO Products 
( productName, productPrice, productTypeId )
VALUES
( 'FitBit Charge 6', 250, 3 );

INSERT INTO Products 
( productName, productPrice, productTypeId )
VALUES
( 'Garmin Instinct', 525, 3 );

INSERT INTO Products 
( productName, productPrice, productTypeId )
VALUES
( 'Apple iPad Air', 800, 4 );

INSERT INTO Products 
( productName, productPrice, productTypeId )
VALUES
( 'Amazon Fire Tablet', 125, 4 );

INSERT INTO Products 
( productName, productPrice, productTypeId )
VALUES
( 'Nespresso Vertuo', 175, 5 );

-- Product Table Data
SELECT * FROM Products;

SELECT 
	productName, productPrice, productType 
FROM
	Products 
INNER JOIN
	ProductTypes ON
	Products.productTypeId = ProductTypes.productTypeId ORDER BY productType;

CREATE TABLE Orders (
	orderId INTEGER PRIMARY KEY AUTOINCREMENT,
	orderDate TEXT NOT NULL,
	orderQuantity INTEGER NOT NULL,
	orderTaxAmount REAL NOT NULL,
	productId INTEGER REFERENCES Products(productId),
	storeId INTEGER REFERENCES Stores(storeId)
);

INSERT INTO Orders 
( orderDate, orderQuantity, orderTaxAmount, productId, storeId )
VALUES
( DATETIME('now','localtime','-200 hours'), 2, 200, 1, 1 );

INSERT INTO Orders 
( orderDate, orderQuantity, orderTaxAmount, productId, storeId )
VALUES
( DATETIME('now','localtime','-190 hours'), 3, 150, 2, 2 );

INSERT INTO Orders 
( orderDate, orderQuantity, orderTaxAmount, productId, storeId )
VALUES
( DATETIME('now','localtime','-180 hours'), 1, 250, 3, 1 );

INSERT INTO Orders 
( orderDate, orderQuantity, orderTaxAmount, productId, storeId )
VALUES
( DATETIME('now','localtime','-170 hours'), 2, 300, 4, 2 );

INSERT INTO Orders 
( orderDate, orderQuantity, orderTaxAmount, productId, storeId )
VALUES
( DATETIME('now','localtime','-160 hours'), 5, 50, 5, 1 );

INSERT INTO Orders 
( orderDate, orderQuantity, orderTaxAmount, productId, storeId )
VALUES
( DATETIME('now','localtime','-150 hours'), 3, 35, 6, 2 );

INSERT INTO Orders 
( orderDate, orderQuantity, orderTaxAmount, productId, storeId )
VALUES
( DATETIME('now','localtime','-140 hours'), 2, 125, 7, 1 );

INSERT INTO Orders 
( orderDate, orderQuantity, orderTaxAmount, productId, storeId )
VALUES
( DATETIME('now','localtime','-130 hours'), 4, 175, 8, 2 );

INSERT INTO Orders 
( orderDate, orderQuantity, orderTaxAmount, productId, storeId )
VALUES
( DATETIME('now','localtime','-120 hours'), 7, 200, 9, 1 );

-- Orders Table Data
SELECT * FROM Orders;

-- Get Data by Joining all the tables
SELECT 
	storeAddress, storeCity, productName, productType, 
	orderDate, productPrice, orderQuantity,
	(productPrice * orderQuantity) AS orderAmt,
	orderTaxAmount, 
	((productPrice * orderQuantity) + orderTaxAmount) AS totalBillAmt
FROM 
	Orders
INNER JOIN 
	Products ON
	Orders.productId = Products.productId
INNER JOIN 
	Stores ON
	Stores.storeId = Orders.storeId
INNER JOIN 
	ProductTypes ON
	ProductTypes.productTypeId = Products.productTypeId
ORDER BY 
	totalBillAmt DESC;

-- Above Query in a single line
SELECT storeAddress, storeCity, productName, productType, orderDate, productPrice, orderQuantity, (productPrice * orderQuantity) AS orderAmt, orderTaxAmount, ((productPrice * orderQuantity) + orderTaxAmount) AS totalBillAmt FROM Orders INNER JOIN Products ON Orders.productId = Products.productId INNER JOIN Stores ON Stores.storeId = Orders.storeId INNER JOIN ProductTypes ON ProductTypes.productTypeId = Products.productTypeId ORDER BY totalBillAmt DESC;