-- CREATE SCHEMA AND DATA FOR Customer-Table Along With Product, Order Tables

CREATE SCHEMA sqlS2;

DROP TABLE AzureLibDB.sqlS2.Customer;

CREATE TABLE 
	sqlS2.Customer(
		custID INT IDENTITY(1,2) PRIMARY KEY,
		custName VARCHAR(25) NOT NULL,
		custAge INT NOT NULL,
		custPhoneNumCountryCode INT,
		custPhoneNum BIGINT,
		custJob VARCHAR(25)
	);

INSERT INTO AzureLibDB.sqlS2.Customer( custName, custAge, custPhoneNumCountryCode, custPhoneNum, custJob ) VALUES( 'John', 31, 1, 9876543210, 'Instructor' );


INSERT INTO AzureLibDB.sqlS2.Customer( custName, custAge, custPhoneNumCountryCode, custPhoneNum, custJob ) VALUES( 'Jane', 31, 1, 4561237890, 'Tester' );

INSERT INTO AzureLibDB.sqlS2.Customer( custName, custAge, custPhoneNumCountryCode, custPhoneNum, custJob ) VALUES( 'Mary', 31, 91, 1234567890, 'Developer' );

SELECT * FROM AzureLibDB.sqlS2.Customer;

UPDATE AzureLibDB.sqlS2.Customer SET custAge = 25 WHERE custID = 3;
UPDATE AzureLibDB.sqlS2.Customer SET custAge = 28 WHERE custID = 5;

INSERT INTO AzureLibDB.sqlS2.Customer( custName, custAge, custPhoneNumCountryCode, custPhoneNum, custJob ) VALUES( 'Janice', 35, 971, 7896543210, 'Project Manager' );

INSERT INTO AzureLibDB.sqlS2.Customer( custName, custAge, custPhoneNumCountryCode, custPhoneNum, custJob ) VALUES( 'Larry', 40, 61, 8769015432, 'CEO' );

-- Add Country Column
ALTER TABLE 
	AzureLibDB.sqlS2.Customer
ADD 
	custCountry VARCHAR(25) NULL;

UPDATE AzureLibDB.sqlS2.Customer SET custCountry = 'Canada' WHERE custID = 1;
UPDATE AzureLibDB.sqlS2.Customer SET custCountry = 'USA' WHERE custID = 3;
UPDATE AzureLibDB.sqlS2.Customer SET custCountry = 'India' WHERE custID = 5;
UPDATE AzureLibDB.sqlS2.Customer SET custCountry = 'UAE' WHERE custID = 7;
UPDATE AzureLibDB.sqlS2.Customer SET custCountry = 'Australia' WHERE custID = 9;

SELECT * FROM AzureLibDB.sqlS2.Customer;

CREATE TABLE 
	AzureLibDB.sqlS2.Product(	
		productID INT IDENTITY(100,1) PRIMARY KEY,
		productName varchar(50) NOT NULL
);

CREATE TABLE 
	AzureLibDB.sqlS2.Stores( 
		storeID INT IDENTITY(200,1) PRIMARY KEY,
		address varchar(50) NOT NULL
);

CREATE TABLE 
	AzureLibDB.sqlS2.Inventory( 
		inventoryID INT IDENTITY(500,1) PRIMARY KEY,
		quantityOnHand int NOT NULL,
		price int NOT NULL,
		productID int,
		CONSTRAINT FK_ProductInventory FOREIGN KEY (productID) REFERENCES AzureLibDB.sqlS2.Product(productID),
		storeID int,
		CONSTRAINT FK_StoreInventory FOREIGN KEY (storeID) REFERENCES AzureLibDB.sqlS2.Stores(storeID)
);

CREATE TABLE  
	AzureLibDB.sqlS2.Orders( 
		orderID INT IDENTITY(1000,1) PRIMARY KEY,
		quantity int NOT NULL,
		productID int,
		CONSTRAINT FK_ProductInventory_2 FOREIGN KEY (productID) REFERENCES AzureLibDB.sqlS2.Product(productID),
		storeID int,
		CONSTRAINT FK_StoreInventory_2 FOREIGN KEY (storeID) REFERENCES AzureLibDB.sqlS2.Stores(storeID)
);

INSERT INTO AzureLibDB.sqlS2.Stores( address ) VALUES ( 'Winnipeg' );
INSERT INTO AzureLibDB.sqlS2.Stores( address ) VALUES ( 'London' );

INSERT INTO AzureLibDB.sqlS2.Product( productName ) VALUES ( 'No Name Peanut Butter' );
INSERT INTO AzureLibDB.sqlS2.Product( productName ) VALUES ( 'No Name Salt' );
INSERT INTO AzureLibDB.sqlS2.Product( productName ) VALUES ( 'Great Value Flour' );
INSERT INTO AzureLibDB.sqlS2.Product( productName ) VALUES ( 'Great Value Oil' );
INSERT INTO AzureLibDB.sqlS2.Product( productName ) VALUES ( 'Compliments Jam' );
INSERT INTO AzureLibDB.sqlS2.Product( productName ) VALUES ( 'Compliments Sauce' );

INSERT INTO AzureLibDB.sqlS2.Orders( quantity, productID, storeID ) VALUES ( 2, 100, 200 );
INSERT INTO AzureLibDB.sqlS2.Orders( quantity, productID, storeID ) VALUES ( 5, 100, 201 );
INSERT INTO AzureLibDB.sqlS2.Orders( quantity, productID, storeID ) VALUES ( 10, 102, 200 );
INSERT INTO AzureLibDB.sqlS2.Orders( quantity, productID, storeID ) VALUES ( 10, 102, 201 );
INSERT INTO AzureLibDB.sqlS2.Orders( quantity, productID, storeID ) VALUES ( 3, 105, 200 );
INSERT INTO AzureLibDB.sqlS2.Orders( quantity, productID, storeID ) VALUES ( 15, 104, 201 );

INSERT INTO AzureLibDB.sqlS2.Inventory( quantityOnHand, price, productID, storeID ) VALUES ( 4, 10, 100, 201 );
INSERT INTO AzureLibDB.sqlS2.Inventory( quantityOnHand, price, productID, storeID ) VALUES ( 15, 10, 100, 200 );
INSERT INTO AzureLibDB.sqlS2.Inventory( quantityOnHand, price, productID, storeID ) VALUES ( 14, 12, 102, 201 );
INSERT INTO AzureLibDB.sqlS2.Inventory( quantityOnHand, price, productID, storeID ) VALUES ( 11, 12, 102, 200 );
INSERT INTO AzureLibDB.sqlS2.Inventory( quantityOnHand, price, productID, storeID ) VALUES ( 4, 15, 104, 201 );
INSERT INTO AzureLibDB.sqlS2.Inventory( quantityOnHand, price, productID, storeID ) VALUES ( 35, 15, 104, 200 );
INSERT INTO AzureLibDB.sqlS2.Inventory( quantityOnHand, price, productID, storeID ) VALUES ( 1, 20, 105, 201 );
INSERT INTO AzureLibDB.sqlS2.Inventory( quantityOnHand, price, productID, storeID ) VALUES ( 12, 20, 105, 200 );

ALTER TABLE 
	AzureLibDB.sqlS2.Orders 
ADD 
	custID INT NULL;

ALTER TABLE 
	AzureLibDB.sqlS2.Orders 
ADD CONSTRAINT 
	custID FOREIGN KEY(custID) REFERENCES sqlS2.Customer(custID);
	
	
UPDATE sqlS2.Orders SET custID = 1 WHERE orderID = 1000;

UPDATE sqlS2.Orders SET custID = 3 WHERE orderID = 1001;

UPDATE sqlS2.Orders SET custID = 5 WHERE orderID = 1002;

UPDATE sqlS2.Orders SET custID = 7 WHERE orderID = 1003;

UPDATE sqlS2.Orders SET custID = 9 WHERE orderID = 1004;

UPDATE sqlS2.Orders SET custID = 1 WHERE orderID = 1005;

-- For Left and Right Join Removed custID = 9
UPDATE sqlS2.Orders SET custID = 3 WHERE orderID = 1004;

-- DROP Column
-- ALTER TABLE sqlS2.Orders DROP COLUMN orderDate;

-- Added the orderDate column 

ALTER TABLE 
	AzureLibDB.sqlS2.Orders 
ADD 
	orderDate DATE NULL;

UPDATE AzureLibDB.sqlS2.Orders SET orderDate = (GETDATE() + 1) WHERE orderID = 1000;

UPDATE AzureLibDB.sqlS2.Orders SET orderDate = (GETDATE() + 3) WHERE orderID = 1001;

UPDATE AzureLibDB.sqlS2.Orders SET orderDate = (GETDATE() - 5) WHERE orderID = 1002;

UPDATE AzureLibDB.sqlS2.Orders SET orderDate = (GETDATE() - 7) WHERE orderID = 1003;

UPDATE AzureLibDB.sqlS2.Orders SET orderDate = (GETDATE() - 9) WHERE orderID = 1004;

UPDATE AzureLibDB.sqlS2.Orders SET orderDate = (GETDATE() - 1) WHERE orderID = 1005;


INSERT INTO AzureLibDB.sqlS2.Product( productName ) VALUES( 'Kirkland Coconut Water' );

INSERT INTO AzureLibDB.sqlS2.Inventory( quantityOnHand, price, productID, storeID ) VALUES ( 50, 25, 106, 200 );

INSERT INTO AzureLibDB.sqlS2.Orders( quantity, productID, storeID, custID, orderDate ) VALUES( 20, 106, 200, 7, GETDATE() )

SELECT * FROM AzureLibDB.sqlS2.Stores;
SELECT * FROM AzureLibDB.sqlS2.Product;
SELECT * FROM AzureLibDB.sqlS2.Orders;
SELECT * FROM AzureLibDB.sqlS2.Inventory;
SELECT * FROM AzureLibDB.sqlS2.Customer;