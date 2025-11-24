-- Clear Table Contents:
DROP TABLE IF EXISTS Employee;

CREATE TABLE Employee( empId INT PRIMARY KEY, empName TEXT, empDept TEXT, empSalary REAL, empCity TEXT, empCountry TEXT );

INSERT INTO Employee VALUES ( 1, 'Harvey Specter', 'Legal', 100000, 'New York', 'USA' ); 

INSERT INTO Employee VALUES ( 2, 'Jessica Pearson', 'CEO', 200000, 'Seattle', 'USA' ); 

INSERT INTO Employee VALUES ( 3, 'Mike Ross', 'Research', 50000, 'Toronto', 'Canada' ); 

INSERT INTO Employee VALUES ( 4, 'Louis Litt', 'COO', 150000, 'London', 'UK' ); 

INSERT INTO Employee VALUES (5, 'Rachel Zane', 'Legal', 80000, 'New York', 'USA');

INSERT INTO Employee VALUES (6, 'Donna Paulsen', 'Legal', 90000, 'New York', 'USA');

INSERT INTO Employee VALUES (7, 'Rober Zane', 'Legal', 125000, 'Seattle', 'USA');

INSERT INTO Employee VALUES (8, 'Harold Gunderson', 'Research', 35000, 'Toronto', 'Canada');

INSERT INTO Employee VALUES (9, 'Benjamin', 'Research', 45000, 'Toronto', 'Canada');

SELECT * FROM Employee ORDER BY empSalary DESC;
