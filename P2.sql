-- p2.sql
-- 1) Create Employee table
CREATE TABLE Employee (
    EMPNO INT,
    ENAME VARCHAR(50),
    JOB VARCHAR(50),
    MGR INT,
    SAL DECIMAL(10, 2)
);

-- 2) Add COMMISSION column
ALTER TABLE Employee
ADD COLUMN COMMISSION DECIMAL(10, 2);

-- 3) Insert 5 records
INSERT INTO Employee (EMPNO, ENAME, JOB, MGR, SAL, COMMISSION) VALUES
(101, 'John Doe', 'Manager', NULL, 5000.00, NULL),
(102, 'Jane Smith', 'Developer', 101, 4000.00, NULL),
(103, 'Alice Johnson', 'Designer', 101, 4500.00, NULL),
(104, 'Bob Brown', 'Analyst', 101, 4200.00, NULL),
(105, 'Emma Wilson', 'Tester', 102, 3800.00, NULL);

-- 4) Update JOB column (add "Senior" prefix)
UPDATE Employee
SET JOB = CONCAT('Senior ', JOB);

-- 5) Rename column MGR to MANAGER_NO
ALTER TABLE Employee
CHANGE COLUMN MGR MANAGER_NO INT;

-- 6) Delete employee with EMPNO = 105
DELETE FROM Employee
WHERE EMPNO = 105;
