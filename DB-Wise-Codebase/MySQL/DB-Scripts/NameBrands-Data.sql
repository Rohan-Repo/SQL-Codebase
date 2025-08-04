USE NameBrands;

INSERT INTO Stores( address ) VALUES ( 'Winnipeg' );
INSERT INTO Stores( address ) VALUES ( 'London' );

INSERT INTO Product( productName ) VALUES ( 'No Name Peanut Butter' );
INSERT INTO Product( productName ) VALUES ( 'No Name Salt' );
INSERT INTO Product( productName ) VALUES ( 'Great Value Flour' );
INSERT INTO Product( productName ) VALUES ( 'Great Value Oil' );
INSERT INTO Product( productName ) VALUES ( 'Compliments Jam' );
INSERT INTO Product( productName ) VALUES ( 'Compliments Sauce' );

INSERT INTO Orders( quantity, productID, storeID ) VALUES ( 2, 100, 200 );
INSERT INTO Orders( quantity, productID, storeID ) VALUES ( 5, 100, 201 );
INSERT INTO Orders( quantity, productID, storeID ) VALUES ( 10, 102, 200 );
INSERT INTO Orders( quantity, productID, storeID ) VALUES ( 10, 102, 201 );
INSERT INTO Orders( quantity, productID, storeID ) VALUES ( 3, 105, 200 );
INSERT INTO Orders( quantity, productID, storeID ) VALUES ( 15, 104, 201 );

INSERT INTO Inventory( quantityOnHand, price, productID, storeID ) VALUES ( 4, 10, 100, 201 );
INSERT INTO Inventory( quantityOnHand, price, productID, storeID ) VALUES ( 15, 10, 100, 200 );
INSERT INTO Inventory( quantityOnHand, price, productID, storeID ) VALUES ( 14, 12, 102, 201 );
INSERT INTO Inventory( quantityOnHand, price, productID, storeID ) VALUES ( 11, 12, 102, 200 );
INSERT INTO Inventory( quantityOnHand, price, productID, storeID ) VALUES ( 4, 15, 104, 201 );
INSERT INTO Inventory( quantityOnHand, price, productID, storeID ) VALUES ( 35, 15, 104, 200 );
INSERT INTO Inventory( quantityOnHand, price, productID, storeID ) VALUES ( 1, 20, 105, 201 );
INSERT INTO Inventory( quantityOnHand, price, productID, storeID ) VALUES ( 12, 20, 105, 200 );