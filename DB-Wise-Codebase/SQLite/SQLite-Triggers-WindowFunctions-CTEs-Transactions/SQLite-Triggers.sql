-- Check if Employee table Exists
SELECT * FROM Employee ORDER BY empSalary DESC;

-- Drop old AuditLog if exists
DROP TABLE IF EXISTS AuditLog;

-- Create simplified AuditLog table
CREATE TABLE AuditLog (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    empId INT,
    action TEXT,
    changedColumn TEXT,
    oldValue TEXT,
    newValue TEXT,
    happened_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- -------------------------------
-- INSERT Trigger
-- -------------------------------
DROP TRIGGER IF EXISTS trg_employee_insert;
CREATE TRIGGER trg_employee_insert
AFTER INSERT ON Employee
BEGIN
    INSERT INTO AuditLog (empId, action, changedColumn)
    VALUES (NEW.empId, 'INSERT', 'All columns (new row)');
END;

-- -------------------------------
-- UPDATE Trigger (simplified)
-- -------------------------------
DROP TRIGGER IF EXISTS trg_employee_update;
CREATE TRIGGER trg_employee_update
AFTER UPDATE ON Employee
BEGIN
    -- empSalary change
    INSERT INTO AuditLog (empId, action, changedColumn, oldValue, newValue)
    SELECT NEW.empId, 'UPDATE', 'empSalary', OLD.empSalary, NEW.empSalary
    WHERE OLD.empSalary IS NOT NEW.empSalary;

    -- empDept change
    INSERT INTO AuditLog (empId, action, changedColumn, oldValue, newValue)
    SELECT NEW.empId, 'UPDATE', 'empDept', OLD.empDept, NEW.empDept
    WHERE OLD.empDept IS NOT NEW.empDept;
END;

-- -------------------------------
-- DELETE Trigger
-- -------------------------------
DROP TRIGGER IF EXISTS trg_employee_delete;
CREATE TRIGGER trg_employee_delete
AFTER DELETE ON Employee
BEGIN
    INSERT INTO AuditLog (empId, action, changedColumn)
    VALUES (OLD.empId, 'DELETE', 'All columns (row deleted)');
END;

-- -------------------------------
-- TEST SECTION
-- -------------------------------

-- 1. Insert a new employee
INSERT INTO Employee VALUES (40, 'Emma Stone', 'Legal', 95000, 'New York', 'USA');

-- 2. Update multiple columns (salary and dept)
UPDATE Employee
SET empSalary = 100000, empDept = 'Finance'
WHERE empId = 40;

-- 3. Delete the employee
DELETE FROM Employee WHERE empId = 40;

-- 4. Check AuditLog
SELECT * FROM AuditLog ORDER BY happened_at DESC;
