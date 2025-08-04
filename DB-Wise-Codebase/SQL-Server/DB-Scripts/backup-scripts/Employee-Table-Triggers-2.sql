USE CompanyDatabase;

-- DROP TRIGGER tr_emp_after_insert;
-- DROP TRIGGER tr_emp_after_delete;

CREATE TRIGGER tr_emp_after_insert
ON
	Employee
AFTER INSERT
AS
	BEGIN
		SELECT * FROM inserted;
	END

INSERT INTO Employee
(
	empFirstName, empLastName, empSalary, empCity
)
VALUES
(
	'Sirius', 'Black', 55555, 'Chelsea'
);

ALTER TRIGGER tr_emp_after_insert
ON
	Employee
AFTER INSERT
AS
	BEGIN
		DECLARE @idInserted INT;
		
		SELECT @idInserted = empId FROM inserted

		INSERT INTO AuditTable 
			( operation, employeeId, auditEntryDate )
		VALUES
			( 'INS', @idInserted, GETDATE() );
	END

INSERT INTO Employee
(
	empFirstName, empLastName, empSalary, empCity
)
VALUES
(
	'Rubeus', 'Hagrid', 44444, 'Liverpool'
);


/*
	This results in 
	(1 row affected) [Employee Table]
	(1 row affected) [AuditTable]
*/

SELECT * FROM Employee ORDER BY empId DESC;
SELECT * FROM AuditTable;

CREATE TRIGGER tr_emp_after_delete
ON
	Employee
AFTER DELETE
AS
	BEGIN
		SELECT * FROM deleted;
	END

DELETE FROM Employee WHERE empId = 165;

ALTER TRIGGER tr_emp_after_delete
ON
	Employee
AFTER DELETE
AS
	BEGIN
		DECLARE @idDeleted INT;

		-- SELECT * FROM deleted;
		
		SELECT @idDeleted = empId FROM deleted

		INSERT INTO AuditTable 
			( operation, employeeId, auditEntryDate )
		VALUES
			( 'DEL', @idDeleted, GETDATE() );
	END

DELETE FROM Employee WHERE empId = 170;
/*
	This results in 
	(1 row affected) [Employee Table]
	(1 row affected) [AuditTable]
*/

SELECT * FROM Employee;
SELECT * FROM AuditTable;