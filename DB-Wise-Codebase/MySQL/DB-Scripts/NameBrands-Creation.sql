CREATE DATABASE NameBrands;

USE NameBrands;

CREATE TABLE Product( 
productID int PRIMARY KEY AUTO_INCREMENT,
productName varchar(50) NOT NULL
) AUTO_INCREMENT = 100;

CREATE TABLE Stores( 
storeID int PRIMARY KEY AUTO_INCREMENT,
address varchar(50) NOT NULL
) AUTO_INCREMENT = 200;

CREATE TABLE Inventory( 
inventoryID int PRIMARY KEY AUTO_INCREMENT,
quantityOnHand int NOT NULL,
price int NOT NULL,
productID int,
FOREIGN KEY (productID) REFERENCES Product(productID),
storeID int,
FOREIGN KEY (storeID) REFERENCES Stores(storeID)
) AUTO_INCREMENT = 500;

CREATE TABLE Orders( 
orderID int PRIMARY KEY AUTO_INCREMENT,
quantity int NOT NULL,
productID int,
FOREIGN KEY (productID) REFERENCES Product(productID),
storeID int,
FOREIGN KEY (storeID) REFERENCES Stores(storeID)
) AUTO_INCREMENT = 1000;

SHOW TABLES;
