USE CompanyDatabase;

INSERT INTO Employee
(
	empFirstName, empLastName, empSalary, empCity
)
VALUES
(
	'Albus', 'Dumbledore', 78654, 'London'
);

INSERT INTO Employee
(
	empFirstName, empLastName, empSalary, empCity
)
VALUES
(
	'Severus', 'Snape', 34567, 'Wembley'
);

SELECT * FROM Employee;