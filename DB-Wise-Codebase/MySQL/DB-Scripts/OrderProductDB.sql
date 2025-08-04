USE productdb;

SELECT * FROM productdb.products;
SELECT * FROM productdb.orders;

-- Product Details
SELECT 
	productName, productType, productPrice 
FROM 
	Products;

-- Order Details
SELECT 
	orderDate, productName, productType, productPrice, orderQuantity, ( productPrice*orderQuantity ) AS totalOrderAmt
FROM 
	Products, Orders 
WHERE
	Products.productID = Orders.productID;