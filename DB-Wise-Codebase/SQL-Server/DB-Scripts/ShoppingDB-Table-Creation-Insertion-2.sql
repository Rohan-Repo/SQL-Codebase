DROP DATABASE IF EXISTS ShoppingDB;

CREATE DATABASE ShoppingDB;

USE ShoppingDB;

DROP TABLE IF EXISTS ProductTypes;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Orders;

CREATE TABLE ProductTypes (
	productTypeId INT IDENTITY (100, 10) PRIMARY KEY,
	productType VARCHAR(50) NOT NULL
);

INSERT INTO ProductTypes ( productType ) VALUES ( 'SmartPhones' );
INSERT INTO ProductTypes ( productType ) VALUES ( 'Laptops' );
INSERT INTO ProductTypes ( productType ) VALUES ( 'SmartWatches' );
INSERT INTO ProductTypes ( productType ) VALUES ( 'Tablets' );
INSERT INTO ProductTypes ( productType ) VALUES ( 'Coffee Machines' );

CREATE TABLE Products (
	productId INT IDENTITY (500, 25) PRIMARY KEY,
	productName VARCHAR(50) NOT NULL,
	productPrice NUMERIC(8,2) NOT NULL,
	productTypeId INT,
	CONSTRAINT FK_ProdProdType
	FOREIGN KEY (productTypeId) REFERENCES ProductTypes(productTypeId)
);

INSERT INTO Products 
( productName, productPrice, productTypeId )
VALUES
( 'iPhone 15 Pro Max', 2000, 100 );

INSERT INTO Products 
( productName, productPrice, productTypeId )
VALUES
( 'Samsung Galaxy S24', 1700, 100 );

INSERT INTO Products 
( productName, productPrice, productTypeId )
VALUES
( 'Apple Macbook Pro M3 Max', 5300, 110 );

INSERT INTO Products 
( productName, productPrice, productTypeId )
VALUES
( 'Lenovo Yoga 7', 1500, 110 );

INSERT INTO Products 
( productName, productPrice, productTypeId )
VALUES
( 'FitBit Charge 6', 250, 120 );

INSERT INTO Products 
( productName, productPrice, productTypeId )
VALUES
( 'Garmin Instinct', 525, 120 );

INSERT INTO Products 
( productName, productPrice, productTypeId )
VALUES
( 'Apple iPad Air', 800, 130 );

INSERT INTO Products 
( productName, productPrice, productTypeId )
VALUES
( 'Amazon Fire Tablet', 125, 130 );

INSERT INTO Products 
( productName, productPrice, productTypeId )
VALUES
( 'Nespresso Vertuo', 175, 140 );


SELECT * FROM ProductTypes;
SELECT * FROM Products;

CREATE TABLE Orders (
	orderId INT IDENTITY (1000, 100) PRIMARY KEY,
	orderDate DATE NOT NULL,
	orderQuantity INT NOT NULL,
	orderTaxAmount NUMERIC (8,2) NOT NULL,
	storeAddress VARCHAR(50) NOT NULL,
	productId INT,
	CONSTRAINT FK_OrderProd
	FOREIGN KEY (productId) REFERENCES Products(productId)
);

INSERT INTO Orders 
( orderDate, orderQuantity, orderTaxAmount, productId, storeAddress )
VALUES
( GETDATE()-100, 2, 200, 500, '123 Main Street' );

INSERT INTO Orders 
( orderDate, orderQuantity, orderTaxAmount, productId, storeAddress )
VALUES
( GETDATE()-110, 3, 150, 525, '987 Union Center' );

INSERT INTO Orders 
( orderDate, orderQuantity, orderTaxAmount, productId, storeAddress )
VALUES
( GETDATE()-115, 1, 250, 550, '456 Bloor Street' );

INSERT INTO Orders 
( orderDate, orderQuantity, orderTaxAmount, productId, storeAddress )
VALUES
( GETDATE()-120, 2, 300, 575, '123 Main Street' );

INSERT INTO Orders 
( orderDate, orderQuantity, orderTaxAmount, productId, storeAddress )
VALUES
( GETDATE()-125, 5, 50, 600, '456 Bloor Street' );

INSERT INTO Orders 
( orderDate, orderQuantity, orderTaxAmount, productId, storeAddress )
VALUES
( GETDATE()-130, 3, 35, 625, '987 Union Center' );

INSERT INTO Orders 
( orderDate, orderQuantity, orderTaxAmount, productId, storeAddress )
VALUES
( GETDATE()-135, 2, 125, 650, '123 Main Street' );

INSERT INTO Orders 
( orderDate, orderQuantity, orderTaxAmount, productId, storeAddress )
VALUES
( GETDATE()-140, 4, 175, 675, '456 Bloor Street' );

INSERT INTO Orders 
( orderDate, orderQuantity, orderTaxAmount, productId, storeAddress )
VALUES
( GETDATE()-150, 7, 200, 700, '123 Main Street' );

SELECT * FROM ProductTypes;
SELECT * FROM Products;
SELECT * FROM Orders;

SELECT 
	storeAddress, productName, productType, 
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
	ProductTypes ON
	ProductTypes.productTypeId = Products.productTypeId
ORDER BY 
	totalBillAmt DESC;

SELECT storeAddress, productName, productType, orderDate, productPrice, orderQuantity, (productPrice * orderQuantity) AS orderAmt, orderTaxAmount, ((productPrice * orderQuantity) + orderTaxAmount) AS totalBillAmt FROM Orders INNER JOIN Products ON Orders.productId = Products.productId INNER JOIN ProductTypes ON ProductTypes.productTypeId = Products.productTypeId ORDER BY totalBillAmt DESC;