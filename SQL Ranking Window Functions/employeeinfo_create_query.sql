CREATE TABLE Sales.EmployeeInfo (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    Salary DECIMAL(10, 2)
);

INSERT INTO Sales.EmployeeInfo (EmployeeID, EmployeeName, Salary) VALUES
(1, 'Alice', 50000.00),
(2, 'Bob', 75000.00),
(3, 'Charlie', 30000.00),
(4, 'David', 120000.00),
(5, 'Eve', 90000.00),
(6, 'Frank', 65000.00),
(7, 'Grace', 110000.00),
(8, 'Hank', 45000.00),
(9, 'Ivy', 85000.00),
(10, 'Jack', 70000.00);

select * from Sales.EmployeeInfo;
