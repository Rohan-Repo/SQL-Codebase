USE CompanyDatabase;

DROP TABLE IF EXISTS Employee;

CREATE TABLE Employee
(
	empId INT PRIMARY KEY IDENTITY(100,5),
	empFirstName VARCHAR(30),
	empLastName VARCHAR(30),
	empSalary INT NOT NULL CHECK( empSalary > 20000 ),
	empCity VARCHAR(50) NOT NULL
);

INSERT INTO Employee
(
	empFirstName, empLastName, empSalary, empCity
)
VALUES
(
	'Larry', 'Stine', 100000, 'New York'
);


INSERT INTO Employee
(
	empFirstName, empLastName, empSalary, empCity
)
VALUES
(
	'John', 'Doe', 50000, 'Toronto'
);

INSERT INTO Employee
(
	empFirstName, empLastName, empSalary, empCity
)
VALUES
(
	'Jane', 'Doe', 35000, 'Vancouver'
);

INSERT INTO Employee
(
	empFirstName, empLastName, empSalary, empCity
)
VALUES
(
	'Mary', 'Smith', 25000, 'Calgary'
);

INSERT INTO Employee
(
	empFirstName, empLastName, empSalary, empCity
)
VALUES
(
	'Janice', 'Walker', 70000, 'Seattle'
);

INSERT INTO Employee
(
	empFirstName, empLastName, empSalary, empCity
)
VALUES
(
	'Adam', 'West', 23000, 'Texas'
);

INSERT INTO Employee
(
	empFirstName, empLastName, empSalary, empCity
)
VALUES
(
	'Robert', 'King', 54321, 'Edmonton'
);

SELECT * FROM Employee;

SELECT * FROM Employee ORDER BY empSalary DESC;