-- STEP 1: CREATE AND USE DATABASE
DROP DATABASE IF EXISTS CompanyDB;
CREATE DATABASE CompanyDB;
USE CompanyDB;

-- STEP 2: CREATE TABLES
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100)
);

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(100),
    Salary DECIMAL(10,2),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

-- STEP 3: INSERT SAMPLE DATA
INSERT INTO Departments (DeptID, DeptName) VALUES
(10, 'HR'),
(20, 'Engineering'),
(30, 'Marketing');

INSERT INTO Employees (EmpID, Name, Salary, DeptID) VALUES
(1, 'Alice', 60000.00, 10),
(2, 'Bob', 80000.00, 20),
(3, 'Charlie', 75000.00, 20),
(4, 'David', 50000.00, 30);

-- STEP 4: BACKUP TABLES
CREATE TABLE Departments_backup AS
SELECT * FROM Departments;

CREATE TABLE Employees_backup AS
SELECT * FROM Employees;

-- STEP 5: SIMULATE FAILURE
DELETE FROM Employees;
DELETE FROM Departments;

-- STEP 6: VERIFY EMPTY STATE
SELECT * FROM Employees;
SELECT * FROM Departments;

-- STEP 7: RESTORE FROM BACKUP
INSERT INTO Departments
SELECT * FROM Departments_backup;

INSERT INTO Employees
SELECT * FROM Employees_backup;

-- STEP 8: FINAL CHECK
SELECT * FROM Departments;
SELECT * FROM Employees;
