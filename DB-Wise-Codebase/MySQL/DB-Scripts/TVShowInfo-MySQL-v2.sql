CREATE DATABASE TVStar;

USE TVStar;

create user 'tvshowdbadmin'@'localhost' IDENTIFIED BY 'tvshowdbadmin';

grant all privileges on *.* to 'tvshowdbadmin'@'localhost' with GRANT option;

CREATE TABLE TVShowActors
(
	showID INT PRIMARY KEY AUTO_INCREMENT,
	showName VARCHAR(50) NOT NULL,
    actorShowName VARCHAR(50) NOT NULL,
	actorRealName VARCHAR(50) NOT NULL
) AUTO_INCREMENT = 100;

INSERT INTO TVShowActors 
	( showName, actorShowName, actorRealName )
VALUES
	( 'Friends', 'Chandler Bing', 'Matthew Perry' );
    
INSERT INTO TVShowActors 
	( showName, actorShowName, actorRealName )
VALUES
	( 'Lie to me', 'Cal Lightman', 'Tim Roth' );

INSERT INTO TVShowActors 
	( showName, actorShowName, actorRealName )
VALUES
	( 'Revenge', 'Emily Thorne', 'Emily Vancamp' );

INSERT INTO TVShowActors 
	( showName, actorShowName, actorRealName )
VALUES
	( 'Arrow', 'Oliver Queen', 'Stephen Amell' );
    
INSERT INTO TVShowActors 
	( showName, actorShowName, actorRealName )
VALUES
	( 'Scandal', 'Olivia Pope', 'Kerry Washington' );
    
INSERT INTO TVShowActors 
	( showName, actorShowName, actorRealName )
VALUES
	( 'Forever', 'Dr. Henry Morgan', 'Ioan Gruffudd' );

SELECT * FROM TVShowActors;