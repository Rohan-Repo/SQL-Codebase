-- Clear Table Contents:
DROP TABLE IF EXISTS Employee;

CREATE TABLE Employee( empId INTEGER PRIMARY KEY AUTOINCREMENT, empName TEXT, empDept TEXT, empSalary REAL, empCity TEXT, empCountry TEXT );

INSERT INTO Employee (empName, empDept, empSalary, empCity, empCountry)
VALUES
('Harvey Specter', 'Legal', 100000, 'New York', 'USA'),
('Jessica Pearson', 'CEO', 200000, 'Seattle', 'USA'),
('Mike Ross', 'Research', 50000, 'Toronto', 'Canada'),
('Louis Litt', 'COO', 150000, 'London', 'UK'),
('Rachel Zane', 'Legal', 80000, 'New York', 'USA'),
('Donna Paulsen', 'Legal', 90000, 'New York', 'USA'),
('Robert Zane', 'Legal', 125000, 'Seattle', 'USA'),
('Harold Gunderson', 'Research', 35000, 'Toronto', 'Canada'),
('Benjamin', 'Research', 45000, 'Toronto', 'Canada');

SELECT * FROM Employee ORDER BY empSalary DESC;
