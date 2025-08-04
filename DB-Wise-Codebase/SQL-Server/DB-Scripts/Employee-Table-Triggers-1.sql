USE CompanyDatabase;

CREATE TRIGGER tr_emp_after_insert_delete
ON
	Employee
AFTER INSERT,DELETE
AS
	BEGIN
		SELECT * FROM inserted;
		SELECT * FROM deleted;
	END

DROP TRIGGER tr_emp_after_insert_delete

CREATE TRIGGER tr_emp_after_insert_delete
ON
	Employee
AFTER INSERT,UPDATE,DELETE
AS
	BEGIN
		SELECT * FROM inserted ;
		SELECT * FROM deleted;
	END

INSERT INTO Employee
(
	empFirstName, empLastName, empSalary, empCity
)
VALUES
(
	'Doby', 'Malfoy', 51111, 'LiverPool'
);

UPDATE Employee SET empCity = 'Yale' WHERE empId = 180;

DELETE FROM Employee WHERE empId = 180;

CREATE TRIGGER tr_emp_after_insert
ON
	Employee
AFTER INSERT
AS
	BEGIN
		DECLARE @idInserted INT;

		-- SELECT * FROM inserted;
    
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
	'Sirius', 'Black', 55555, 'Chelsea'
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
		DECLARE @idDeleted INT;

		-- SELECT * FROM deleted;
    
		SELECT @idDeleted = empId FROM deleted

		INSERT INTO AuditTable 
			( operation, employeeId, auditEntryDate )
		VALUES
			( 'DEL', @idDeleted, GETDATE() );
	END

DELETE FROM Employee WHERE empId = 155;
/*
	This results in 
	(1 row affected) [Employee Table]
	(1 row affected) [AuditTable]
*/

SELECT * FROM Employee;
SELECT * FROM AuditTable;