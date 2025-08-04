CREATE DATABASE TvHeroes;

USE TvHeroes;

create user 'actordbadmin'@'localhost' IDENTIFIED BY 'actordbadmin';

grant all privileges on *.* to 'actordbadmin'@'localhost' with GRANT option;

CREATE TABLE TVShows
(
	showID INT PRIMARY KEY AUTO_INCREMENT,
	showName VARCHAR(50) NOT NULL
) AUTO_INCREMENT = 100;

INSERT INTO TVShows( showName ) VALUES ( 'Lie to me' );
INSERT INTO TVShows( showName ) VALUES ( 'Revenge' );
INSERT INTO TVShows( showName ) VALUES ( 'Arrow' );
INSERT INTO TVShows( showName ) VALUES ( 'Friends' );
INSERT INTO TVShows( showName ) VALUES ( 'Forever' );
INSERT INTO TVShows( showName ) VALUES ( 'Scandal' );


CREATE TABLE Actors
(
	actorID INT PRIMARY KEY AUTO_INCREMENT,
	actorShowName VARCHAR(50) NOT NULL,
	actorRealName VARCHAR(50) NOT NULL
) AUTO_INCREMENT = 200;

INSERT INTO Actors( actorShowName, actorRealName ) VALUES ( 'Cal Lightman', 'Tim Roth' );
INSERT INTO Actors( actorShowName, actorRealName ) VALUES ( 'Joey Tribbiani', 'Matt Leblanc' );
INSERT INTO Actors( actorShowName, actorRealName ) VALUES ( 'Chandler Bing', 'Matthew Perry' );
INSERT INTO Actors( actorShowName, actorRealName ) VALUES ( 'Oliver Queen', 'Stephen Amell' );
INSERT INTO Actors( actorShowName, actorRealName ) VALUES ( 'Gillian Foster', 'Kelli Williams' );
INSERT INTO Actors( actorShowName, actorRealName ) VALUES ( 'Emily Thorne', 'Emily Vancamp' );
INSERT INTO Actors( actorShowName, actorRealName ) VALUES ( 'Dr. Henry Morgan', 'Ioan Gruffudd' );
INSERT INTO Actors( actorShowName, actorRealName ) VALUES ( 'Olivia Pope', 'Kerry Washington' );

CREATE TABLE Show_Actors
(
	showActorID INT PRIMARY KEY AUTO_INCREMENT,
	actorID INT,
	FOREIGN KEY (actorID) REFERENCES Actors(actorID),
	showID INT,
	FOREIGN KEY (showID) REFERENCES TVShows(showID)
) AUTO_INCREMENT = 300;


SELECT * FROM TVShows;
SELECT * FROM Actors;

INSERT INTO Show_Actors( showID, actorID ) VALUES ( 103, 202 );
INSERT INTO Show_Actors( showID, actorID ) VALUES ( 103, 201 );
INSERT INTO Show_Actors( showID, actorID ) VALUES ( 100, 200 );
INSERT INTO Show_Actors( showID, actorID ) VALUES ( 100, 204 );
INSERT INTO Show_Actors( showID, actorID ) VALUES ( 101, 205 );
INSERT INTO Show_Actors( showID, actorID ) VALUES ( 102, 203 );
INSERT INTO Show_Actors( showID, actorID ) VALUES ( 104, 206 );
INSERT INTO Show_Actors( showID, actorID ) VALUES ( 105, 207 );

SELECT * FROM TVShows;
SELECT * FROM Actors;
SELECT * FROM Show_Actors;

SELECT 
	actorShowName, actorRealName, showName
FROM
	TVShows 
INNER JOIN 
	Show_Actors ON (TVShows.showID = Show_Actors.showID)
INNER JOIN 
	Actors ON (Actors.actorID = Show_Actors.actorID)
ORDER BY
	showName;
