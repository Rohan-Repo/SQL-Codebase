-- Check if Employee table Exists
SELECT * FROM Employee ORDER BY empSalary DESC;

-- Suppose you want to rank employees by salary within their department:
SELECT 
    empName,
    empDept,
    empSalary,
    RANK() OVER (PARTITION BY empDept ORDER BY empSalary DESC) AS dept_rank
FROM Employee;

-- RANK() is a window function.
-- PARTITION BY empDept means ranking is done separately for each department.
-- ORDER BY empSalary DESC ranks higher salaries first.

-- Find Average Salary from Employee table
SELECT AVG(empSalary) AS avg_sal FROM Employee;

-- Suppose you want to find employees who earn more than the average salary:
WITH AvgSalary AS (
    SELECT AVG(empSalary) AS avg_sal FROM Employee
)
SELECT empName, empSalary
FROM Employee, AvgSalary
WHERE empSalary > avg_sal;

-- WITH AvgSalary AS (...) defines a CTE that calculates the average salary.
-- Then we use that CTE in the main query to filter employees earning above average.

-- 5. Average Salary Per Department (Window)
SELECT empName, empDept, empSalary,
       AVG(empSalary) OVER (PARTITION BY empDept) AS dept_avg_salary
FROM Employee;

-- SELECT empName, empDept, empSalary
-- 		→ Selects the employee’s name, department, and salary.

-- AVG(empSalary) OVER (...)
--		→ Calculates the average salary using a window function without collapsing rows.

-- PARTITION BY empDept
--		→ Groups the calculation by department for the window function.

-- AS dept_avg_salary
--		→ Assigns an alias to the calculated average salary column.

-- If we use the Group By Clause
SELECT empDept,
       AVG(empSalary) AS dept_avg_salary
FROM Employee
GROUP BY empDept;

-- Therefore:
-- Window Function: Keeps all rows, adds computed value next to each row.
-- GROUP BY: Aggregates rows into fewer rows (one per group).

-- Filter employees whose salary is greater than their department's average:

-- Using Window functions + SubQueries
SELECT empName, empDept, empSalary
FROM (
    SELECT empName, empDept, empSalary,
           AVG(empSalary) OVER (PARTITION BY empDept) AS dept_avg_salary
    FROM Employee
)
WHERE empSalary > dept_avg_salary;

-- Using Window functions + CTE's
WITH DeptSalary AS (
    SELECT empName, empDept, empSalary,
           AVG(empSalary) OVER (PARTITION BY empDept) AS dept_avg_salary
    FROM Employee
)
SELECT empName, empDept, empSalary
FROM DeptSalary
WHERE empSalary > dept_avg_salary;

