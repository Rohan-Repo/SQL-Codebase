-- DROP TABLE Department;

CREATE TABLE 
	Department(
		deptID INT IDENTITY(1000,100) PRIMARY KEY,
		deptName VARCHAR(20)
		);

INSERT INTO Department( deptName ) VALUES ( 'C-Suite' );
INSERT INTO Department( deptName ) VALUES ( 'L&D' );
INSERT INTO Department( deptName ) VALUES ( 'Eng' );
INSERT INTO Department( deptName ) VALUES ( 'PM' );


-- SELECT * from Department;

DROP Table Department;

CREATE TABLE 
	Employee(
		empID INT IDENTITY(100,5) PRIMARY KEY,
		empName VARCHAR(25) NOT NULL,
		empAge INT NOT NULL,
		empPhoneNumCountryCode INT,
		empPhoneNum BIGINT,
		empJob VARCHAR(25),
		empCountry VARCHAR(25) NOT NULL,
		deptID INT,
		CONSTRAINT FK_DeptEmp 
		FOREIGN KEY (deptID) REFERENCES Department(deptID)
	);

INSERT INTO 
	Employee
		( empName, empAge, empPhoneNumCountryCode, empPhoneNum, empJob, empCountry, deptID )
	VALUES
		( 'John', 31, 1, 9876543210, 'Trainer', 'Canada', 1100 );

INSERT INTO 
	Employee
		( empName, empAge, empPhoneNumCountryCode, empPhoneNum, empJob, empCountry, deptID )
	VALUES
		( 'Jane', 25, 1, 4561237890, 'Tester', 'USA', 1200 );

INSERT INTO 
	Employee
		( empName, empAge, empPhoneNumCountryCode, empPhoneNum, empJob, empCountry, deptID )
	VALUES
		( 'Mary', 28, 91, 1234567890, 'Developer', 'India', 1200 );

INSERT INTO 
	Employee
		( empName, empAge, empPhoneNumCountryCode, empPhoneNum, empJob, empCountry, deptID )
	VALUES
		( 'Janice', 35, 971, 7896543210, 'Project Manager', 'UAE', 1300 );

INSERT INTO 
	Employee
		( empName, empAge, empPhoneNumCountryCode, empPhoneNum, empJob, empCountry, deptID )
	VALUES
		( 'Larry', 40, 61, 8769015432, 'CEO', 'Australia', 1000 );

SELECT * FROM Department;

SELECT * FROM Employee;

SELECT 
	empName, empAge, empPhoneNumCountryCode, empPhoneNum, empJob, empCountry, deptName
FROM 
	Employee emp
INNER JOIN 
	Department dept
ON 
	emp.deptID = dept.deptID 
ORDER BY 
	empAge DESC;

--