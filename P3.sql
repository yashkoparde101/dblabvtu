-- p3.sql
-- Aggregate functions
-- Create Employee table
CREATE TABLE Employee (
    E_id INT PRIMARY KEY,
    E_name VARCHAR(50),
    Age INT,
    Salary DECIMAL(10, 2)
);

-- Count number of employees
SELECT COUNT(E_name) AS num_employees
FROM Employee;

-- Find maximum age
SELECT MAX(Age) AS max_age
FROM Employee;

-- Find minimum age
SELECT MIN(Age) AS min_age
FROM Employee;

-- Display salaries in ascending order
SELECT E_name, Salary
FROM Employee
ORDER BY Salary ASC;

-- Group employees by salary
SELECT Salary, COUNT(*) AS num_employees
FROM Employee
GROUP BY Salary;
