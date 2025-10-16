-- Database
-- create database sql_practice_db;


-- Table 1: Departments
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO Departments VALUES
(1, 'HR'),
(2, 'Sales'),
(3, 'IT'),
(4, 'Marketing'),
(5, 'Finance');

-- Table 2: Employees
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50) NOT NULL,
    DeptID INT NOT NULL,
    Salary DECIMAL(10,2) NOT NULL CHECK(Salary > 0),
    JoiningDate DATE NOT NULL,
    Email VARCHAR(100) UNIQUE,
    CONSTRAINT FK_Dept FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

INSERT INTO Employees (EmpID, EmpName, DeptID, Salary, JoiningDate, Email) VALUES
(1, 'Alice', 1, 50000, '2020-01-15', 'alice@example.com'),
(2, 'Bob', 2, 60000, '2019-03-12', 'bob@example.com'),
(3, 'Charlie', 3, 55000, '2021-06-18', 'charlie@example.com'),
(4, 'David', 2, 62000, '2018-09-22', 'david@example.com'),
(5, 'Eva', 4, 58000, '2022-01-30', 'eva@example.com'),
(6, 'Frank', 1, 51000, '2020-11-05', 'frank@example.com'),
(7, 'Grace', 5, 67000, '2019-07-17', 'grace@example.com'),
(8, 'Hannah', 3, 53000, '2021-02-25', 'hannah@example.com'),
(9, 'Ian', 4, 59000, '2020-05-20', 'ian@example.com'),
(10, 'Jack', 2, 61500, '2018-12-01', 'jack@example.com'),
(11, 'Kylie', 1, 52000, '2021-09-11', 'kylie@example.com'),
(12, 'Leo', 3, 56000, '2020-08-30', 'leo@example.com'),
(13, 'Mona', 5, 68000, '2019-10-10', 'mona@example.com'),
(14, 'Nina', 4, 59500, '2022-03-14', 'nina@example.com'),
(15, 'Oscar', 2, 62500, '2018-11-21', 'oscar@example.com'),
(16, 'Paula', 1, 53000, '2021-07-07', 'paula@example.com'),
(17, 'Quinn', 3, 54000, '2020-06-06', 'quinn@example.com'),
(18, 'Rita', 4, 60000, '2022-02-19', 'rita@example.com'),
(19, 'Sam', 5, 69000, '2019-04-28', 'sam@example.com'),
(20, 'Tina', 2, 61000, '2018-08-09', 'tina@example.com'),
(21, 'Uma', 1, 54000, '2020-10-12', 'uma@example.com'),
(22, 'Victor', 3, 55500, '2021-01-03', 'victor@example.com'),
(23, 'Wendy', 4, 60500, '2022-05-25', 'wendy@example.com'),
(24, 'Xander', 5, 70000, '2019-06-16', 'xander@example.com'),
(25, 'Yara', 2, 62000, '2018-03-18', 'yara@example.com'),
(26, 'Zane', 1, 55000, '2021-12-21', 'zane@example.com'),
(27, 'Liam', 3, 56500, '2020-09-14', 'liam@example.com'),
(28, 'Mia', 4, 61000, '2022-07-19', 'mia@example.com'),
(29, 'Noah', 5, 71000, '2019-02-11', 'noah@example.com'),
(30, 'Olivia', 2, 63000, '2018-05-05', 'olivia@example.com');


-- Big 6 statements → SELECT, INSERT, UPDATE, DELETE, CREATE, DROP

-- Joins → Seen in CTE example

-- CTEs, Views, Stored Procedures/Functions → covered

-- Indexes, Constraints, Transactions, Functions, Triggers, Window Functions, Subqueries, Set Operations, Data Types, Error Handling → all included