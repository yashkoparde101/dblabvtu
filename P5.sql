-- p5.sql
-- Cursor operations
-- Create database and use it
CREATE DATABASE employee;
USE employee;

-- Create Employee table
CREATE TABLE employee (
    E_id INT AUTO_INCREMENT PRIMARY KEY,
    E_name VARCHAR(100),
    Age INT,
    Salary DECIMAL(10, 2)
);

-- Insert sample records
INSERT INTO employee (E_name, Age, Salary) VALUES
    ('John Doe', 30, 50000.00),
    ('Alice Smith', 25, 60000.00),
    ('Bob Johnson', 35, 70000.00);

-- Create stored procedure using cursor
DELIMITER //

CREATE PROCEDURE employee_cursor_proc()
BEGIN
    -- Declare variables
    DECLARE done BOOLEAN DEFAULT FALSE;
    DECLARE emp_id INT;
    DECLARE emp_name VARCHAR(100);
    DECLARE emp_age INT;
    DECLARE emp_salary DECIMAL(10, 2);

    -- Declare cursor
    DECLARE emp_cursor CURSOR FOR
        SELECT E_id, E_name, Age, Salary FROM employee;

    -- Handler for end of rows
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    -- Open cursor
    OPEN emp_cursor;

    -- Loop through records
    emp_loop: LOOP
        FETCH emp_cursor INTO emp_id, emp_name, emp_age, emp_salary;

        IF done THEN
            LEAVE emp_loop;
        END IF;

        SELECT CONCAT(
            'Employee ID: ', emp_id,
            ', Name: ', emp_name,
            ', Age: ', emp_age,
            ', Salary: ', emp_salary
        ) AS EmployeeInfo;

    END LOOP;

    -- Close cursor
    CLOSE emp_cursor;
END//

DELIMITER ;

-- Call procedure
CALL employee_cursor_proc();
