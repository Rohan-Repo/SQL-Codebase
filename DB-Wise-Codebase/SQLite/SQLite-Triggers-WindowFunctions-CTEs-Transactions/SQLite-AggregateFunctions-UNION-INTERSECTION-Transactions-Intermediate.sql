-- Check if Employee table Exists
SELECT * FROM Employee ORDER BY empSalary DESC;

-- Aggregate functions

SELECT 
    AVG(empSalary) AS avg_salary,
    COUNT(*) AS total_employees,
	MIN(empSalary) AS minSal,
	MAX(empSalary) AS maxSal,
FROM Employee;

SELECT empDept, SUM(empSalary) AS sumSal, AVG(empSalary) AS avgSal FROM Employee GROUP BY empDept;

-- HAVING Clause

SELECT empName, empDept, empSalary
FROM Employee
GROUP BY empDept
HAVING empSalary > (SELECT AVG(empSalary) FROM Employee);


-- UNION & Intersection

SELECT empName, empCountry FROM Employee WHERE empCountry = 'USA'
UNION
SELECT empName, empCountry FROM Employee WHERE empCountry = 'Canada';


SELECT empName FROM Employee WHERE empDept = 'Legal'
INTERSECT
SELECT empName FROM Employee WHERE empCountry = 'USA';

DELETE FROM Employee WHERE empId IN(10,11);

-- TRANSACTIONS: COMMIT & ROLLBACK
SELECT * FROM Employee ORDER BY empSalary DESC;

BEGIN TRANSACTION;

INSERT INTO Employee VALUES (10, 'Alex Williams', 'Finance', 75000, 'Boston', 'USA');
UPDATE Employee SET empSalary = empSalary + 5000 WHERE empDept = 'Legal';

COMMIT;

SELECT * FROM Employee ORDER BY empSalary DESC;

BEGIN TRANSACTION;

INSERT INTO Employee VALUES (11, 'Chris Taylor', 'Finance', 80000, 'Chicago', 'USA');
UPDATE Employee SET empSalary = empSalary - 10000 WHERE empDept = 'Research';

ROLLBACK;

SELECT * FROM Employee ORDER BY empSalary DESC;

-----