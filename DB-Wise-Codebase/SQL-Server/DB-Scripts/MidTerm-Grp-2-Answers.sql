-- Suppose you want information for employees in a certain salary range:

CREATE PROCEDURE sp_getEmployeesWithinRange
@startSal INT, @endSal INT
AS
	BEGIN
		SELECT 
			CONCAT( empFirstName, ' ',  empLastName) AS employeeName,
			empSalary AS employeeSal,
			empCity AS employeeCity 
		FROM Employee
		WHERE 
			empSalary BETWEEN @startSal AND @endSal
		ORDER BY empSalary DESC
	END

EXEC sp_getEmployeesWithinRange 50000,100000;

-- Gather Audit information:
CREATE PROCEDURE sp_getAuditInformation
AS
	BEGIN
		SELECT 
			operation, 
			count(*) as countOper 
		FROM 
			AuditTable 
		GROUP BY 
			operation;
	END

EXEC sp_getAuditInformation;