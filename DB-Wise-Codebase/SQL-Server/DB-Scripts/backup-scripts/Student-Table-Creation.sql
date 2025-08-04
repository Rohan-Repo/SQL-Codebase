USE StudentDB;

DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Student;

-- CREATE Tables and add all the requisite Data

CREATE TABLE Courses
(
	c_id INT PRIMARY KEY,
	c_name VARCHAR(50) NOT NULL
);

INSERT INTO Courses VALUES( 1, 'C#' );
INSERT INTO Courses VALUES( 2, 'HTML-CSS-JS' );
INSERT INTO Courses VALUES( 3, 'SQL' );

SELECT * FROM Courses;

CREATE TABLE Student
(
	s_id INT IDENTITY(1000,10) PRIMARY KEY,
	s_firstName VARCHAR(20) NOT NULL,
	s_lastName VARCHAR(20) NOT NULL,
	s_emailId VARCHAR(50) NOT NULL,
	s_phoneNum VARCHAR(20) NULL,
	s_gender CHAR(1) NULL,
	s_dateOfBirth DATE NOT NULL,
	s_fees NUMERIC(6,2) NULL,
	c_id INT,
	CONSTRAINT FK_StudCourse
	FOREIGN KEY (c_id) REFERENCES Courses(c_id)
);

INSERT INTO Student 
(
	s_firstName, s_lastName, s_emailId, s_phoneNum, s_gender, s_dateOfBirth, s_fees, c_id
)
VALUES
(
	'John', 'Doe', 'john.doe@yahoo.com', '+1-987-654-3210', 'm', '1999-12-12', 1000, 1 
);

INSERT INTO Student 
(
	s_firstName, s_lastName, s_emailId, s_phoneNum, s_gender, s_dateOfBirth, s_fees, c_id
)
VALUES
(
	'Jane', 'Doe', 'jane.doe@outlook.com', '+1-123-456-7890', 'f', '2000-01-03', 1500, 1 
);

INSERT INTO Student 
(
	s_firstName, s_lastName, s_emailId, s_phoneNum, s_gender, s_dateOfBirth, s_fees, c_id
)
VALUES
(
	'Mary', 'Smith', 'mary.smith@gmail.com', '+1-086-421-3579', 'o', '1998-08-15', 2000, 2 
);

INSERT INTO Student 
(
	s_firstName, s_lastName, s_emailId, s_phoneNum, s_gender, s_dateOfBirth, s_fees, c_id
)
VALUES
(
	'Ana', 'Stine', 'ana.stine@gmail.com', '+1-135-791-9642', 'f', '1997-10-23', 2500, 3 
);

SELECT * FROM Student;