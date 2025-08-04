USE NameBrands;

-- Inventory By Product
SELECT productID, SUM(quantityOnHand) as productInventory FROM Inventory group by productID;
-- Inventory By Store
SELECT storeID, SUM(quantityOnHand) as storeInventory FROM Inventory group by storeID;

-- Inventory by Order
SELECT inv.storeID, ord.quantity as orderQuantity, inv.quantityOnHand FROM 
Inventory inv, Orders ord WHERE 
inv.storeID = ord.storeID AND 
inv.productID = ord.productID
order by storeID;

-- I
SELECT inv.storeID, ord.quantity as orderQuantity FROM 
Inventory inv, Orders ord WHERE 
inv.storeID = ord.storeID AND 
inv.productID = ord.productID
order by storeID;

SELECT inv.storeID, sum(ord.quantity) as orderQuantity FROM 
Inventory inv, Orders ord WHERE 
inv.storeID = ord.storeID AND 
inv.productID = ord.productID group by storeID;

-- Cost of Each Order
SELECT * from orders;

SELECT orderID, ord.quantity, inv.price, (ord.quantity*inv.price) AS MSRP
FROM Product prd, Orders ord, Inventory inv
WHERE 
inv.productID = ord.productID
AND
inv.storeID = ord.storeID; 

-- II
SELECT orderID, ord.quantity,inv.price, (ord.quantity*inv.price) AS MSRP
FROM Orders ord, Inventory inv
WHERE 
inv.storeID = ord.storeID 
AND 
inv.productID = ord.productID; 

SELECT orderID, ord.quantity,inv.price
FROM Orders ord, Inventory inv
WHERE 
inv.storeID = ord.storeID 
AND 
inv.productID = ord.productID; 


SELECT orderID, prd.productName, ord.quantity,inv.price, (ord.quantity*inv.price) AS MSRP
FROM Orders ord, Inventory inv, Product prd
WHERE 
inv.storeID = ord.storeID 
AND 
inv.productID = ord.productID
AND
ord.productID = prd.productID;

-- III
SELECT orderID, quantity, quantityOnHand, quantity > quantityOnHand AS unfulfilled
FROM Orders ord, Inventory inv
WHERE 
inv.storeID = ord.storeID 
AND 
inv.productID = ord.productID;

SELECT orderID, quantity, price, quantityOnHand
FROM Orders ord, Inventory inv
WHERE 
inv.storeID = ord.storeID 
AND 
inv.productID = ord.productID
AND
quantity > quantityOnHand;

SELECT orderID, quantity, price, quantityOnHand, quantity > quantityOnHand AS unfulfilled
FROM Orders ord, Inventory inv
WHERE 
inv.storeID = ord.storeID 
AND 
inv.productID = ord.productID;

SELECT orderID, quantity, price, quantity * price AS orderTotal
FROM Orders ord, Inventory inv
WHERE 
inv.storeID = ord.storeID 
AND 
inv.productID = ord.productID;

-- STORED FUNCTION
SELECT price from inventory where storeID = 201 AND productID = 100;

DELIMITER //
CREATE FUNCTION getPrice( sID int, pID int )
RETURNS int
DETERMINISTIC
BEGIN
	DECLARE priceVal int;
	SELECT price into priceVal from inventory where storeID = sID AND productID = pID;
	RETURN priceVal;
END //
DELIMITER ;

SELECT getPrice ( 201, 100 );
