USE TvHeroes;

CREATE TABLE TVShows
(
	showID INT PRIMARY KEY IDENTITY(100,10),
	showName VARCHAR(50) NOT NULL
);

INSERT INTO TVShows( showName ) VALUES ( 'Lie to me' );
INSERT INTO TVShows( showName ) VALUES ( 'Revenge' );
INSERT INTO TVShows( showName ) VALUES ( 'Arrow' );
INSERT INTO TVShows( showName ) VALUES ( 'Friends' );
INSERT INTO TVShows( showName ) VALUES ( 'Forever' );
INSERT INTO TVShows( showName ) VALUES ( 'Scandal' );


CREATE TABLE Actors
(
	actorID INT PRIMARY KEY IDENTITY(500,50),
	actorShowName VARCHAR(50) NOT NULL,
	actorRealName VARCHAR(50) NOT NULL
);

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
	showActorID INT PRIMARY KEY IDENTITY(1000,100),
	actorID INT,
	CONSTRAINT FK_Actor
	FOREIGN KEY (actorID) REFERENCES Actors(actorID),
	showID INT,
	CONSTRAINT FK_Show
	FOREIGN KEY (showID) REFERENCES TVShows(showID)
);

INSERT INTO Show_Actors( showID, actorID ) VALUES ( 130, 600 );
INSERT INTO Show_Actors( showID, actorID ) VALUES ( 130, 550 );
INSERT INTO Show_Actors( showID, actorID ) VALUES ( 100, 500 );
INSERT INTO Show_Actors( showID, actorID ) VALUES ( 100, 700 );
INSERT INTO Show_Actors( showID, actorID ) VALUES ( 110, 750 );
INSERT INTO Show_Actors( showID, actorID ) VALUES ( 120, 650 );
INSERT INTO Show_Actors( showID, actorID ) VALUES ( 140, 800 );
INSERT INTO Show_Actors( showID, actorID ) VALUES ( 150, 850 );

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
