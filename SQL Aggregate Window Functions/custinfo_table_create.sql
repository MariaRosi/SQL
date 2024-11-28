-- Create the Sales.Customers table
CREATE TABLE Sales.CustInfo (
    CustomerID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Score INT
);

-- Insert sample data into Sales.Customers
INSERT INTO Sales.CustInfo (CustomerID, FirstName, LastName, Score) VALUES
(1, 'Alice', 'Smith', 85),
(2, 'Bob', 'Johnson', NULL),
(3, 'Charlie', 'Williams', 90),
(4, 'Daisy', 'Brown', NULL),
(5, 'Ethan', 'Jones', 70),
(6, 'Fiona', NULL, 75),
(7, 'George', 'Miller', 95),
(8, 'Hannah', 'Davis', NULL),
(9, 'Ian', 'Garcia', 80),
(10, 'Jane', 'Martinez', 88);

select *
from Sales.CustInfo;

