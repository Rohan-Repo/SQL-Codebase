USE CompanyDatabase;

-- CREATE Audit table
DROP TABLE IF EXISTS AuditTable;

CREATE TABLE AuditTable
(
	auditEntryId INT PRIMARY KEY IDENTITY(1,2),
	operation VARCHAR(3),
	employeeId INT,
	auditEntryDate DATETIME
);

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
