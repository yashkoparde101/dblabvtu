-- p1.sql
-- Employee Table + User + Privileges
-- Create database
CREATE DATABASE 2VX24CS125;
-- Select the created database
USE 2VX24CS125;
-- Create Employee table
CREATE TABLE Employee (
    EMPNO INT PRIMARY KEY,
    ENAME VARCHAR(255),
    JOB VARCHAR(255),
    MANAGER_NO INT,
    SAL DECIMAL(10, 2),
    COMMISSION DECIMAL(10, 2)
);

-- Create a new user and grant privileges
CREATE USER 'new_user'@'localhost' 
IDENTIFIED BY 'password';

GRANT ALL PRIVILEGES 
ON your_database_name.* 
TO 'new_user'@'localhost';

FLUSH PRIVILEGES;
